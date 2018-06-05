/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Funcionario;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.EstabelecimentoFuncionario;
import br.com.avicultura.chicken_tracker.Models.Funcionario;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import br.com.avicultura.chicken_tracker.Models.Pagamento;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class FuncionarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
////        Session s = HibernateFactory.getSessionFactory().openSession();
////        Query query = s.createQuery("from perfil");
////        List<Perfil> list = query.getResultList();
//          response.sendRedirect("manter");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        EstabelecimentoFuncionario ef = EstabelecimentoFuncionario.getInstance();
        Funcionario f = Funcionario.getInstance();
        String butao = request.getParameter("funcionario");
        HibernateUtil<Funcionario> hupf = new HibernateUtil<>();
        PrintWriter out = response.getWriter();
        HibernateUtil<EstabelecimentoFuncionario> hupef = new HibernateUtil<>();
        HibernateUtil<Pagamento> hup = new HibernateUtil<>();
        HibernateUtil<Estabelecimento> hue = new HibernateUtil<>();
        Negocio n = (Negocio) request.getSession().getAttribute("negocio");
        if (butao.equals("pagar")) {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                if (parameterName.contains("checkbox")) {
                    chkBoxIds.add(parameterName);
                }
            }
            String[] cpf = new String[chkBoxIds.size()];
            double total = 0;
            int index = 0;
            for (String s1 : chkBoxIds) {
                System.out.println(s1);
                cpf[index] = s1.split("!")[1];
                index++;
            }
            for (index = 0; index < cpf.length; index++) {
                ef = ConsultaFuncionario.returnFuncionario(e.getId().toString(), cpf[index]);
                total += ef.getSalario();
            }
            if (e.getSaldo() >= total) {
                Pagamento p = Pagamento.getInstance();
                GregorianCalendar gc = new GregorianCalendar();
                int dia = gc.get(GregorianCalendar.DAY_OF_MONTH);
                int mes = gc.get(GregorianCalendar.MONTH + 1);
                int ano = gc.get(GregorianCalendar.YEAR);
                p.setDia(dia);
                p.setMes(mes);
                p.setAno(ano);
                p.setEstabelecimento(e);
                List<EstabelecimentoFuncionario> list = ConsultaFuncionario.returnListFuncionario(e.getId().toString());

                for (index = 0; index < cpf.length; index++) {
                    ef = ConsultaFuncionario.returnFuncionario(e.getId().toString(), cpf[index]);
                    p.setValor(ef.getSalario());
                    p.setDescricao("Pagamento do funcionário " + ef.getFuncionario().getNome()
                            + " que trabalha no estabelecimento " + ef.getEstabelecimento().getSufixoCNPJ()
                            + " do negócio " + ef.getEstabelecimento().getNegocio().getNome() + " (" + ef.getEstabelecimento().getNegocio().getEmpresaCNPJ() + ")");
                    p.setTipo('G');
                    e.setSaldo(e.getSaldo() - p.getValor());
                    hup.salvar(p);
                    hue.atualizar(e);
                }
                response.sendRedirect("seusNegocios/funcionarios.jsp?estabelecimento=" + e.getId());
            } else {
                //Erro
            }

        } else if (butao.equals("cadastrar")) {
            f.setNome(request.getParameter("inputNome"));
            f.setCPF(request.getParameter("inputCPF"));
            f.setRG(request.getParameter("inputRG"));
            String s = "";
            if (ConsultaFuncionario.findById(f.getCPF()) == null) {
                s = hupf.salvar(f);
            }
            if (s.equals("")) {
                ef.setFuncionario(f);
                ef.setEstabelecimento(e);
                ef.setCargo(request.getParameter("inputCargo"));
                String salario = request.getParameter("inputSalario");
                ef.setSalario(Double.parseDouble(salario));
                ef.setSituacao('A');
                ef.setNegocio(n.getEmpresaCNPJ());
                hupef.salvar(ef);
            }
            response.sendRedirect("seusNegocios/funcionarios.jsp?estabelecimento=" + e.getId());

        } else if (butao.equals("alterar")) {
            ef.setSalario(Double.parseDouble(request.getParameter("inputSalario")));
            ef.setCargo(request.getParameter("inputCargo"));
            ef.setSituacao(request.getParameter("inputSituacao").charAt(0));
            ef.setNegocio(n.getEmpresaCNPJ());
            hupef.atualizar(ef);
            response.sendRedirect("seusNegocios/funcionarios.jsp?estabelecimento=" + e.getId());
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                if (parameterName.contains("checkbox")) {
                    chkBoxIds.add(parameterName);
                }
            }
            String[] cpf = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                cpf[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < cpf.length; index++) {
                f = ConsultaFuncionario.findById(cpf[index]);;
                ef = ConsultaFuncionario.returnFuncionario(e.getId().toString(), f.getCPF());
                hupef.deletar(ef);
            }
            response.sendRedirect("seusNegocios/funcionarios.jsp?estabelecimento=" + e.getId());
        }

    }
}
