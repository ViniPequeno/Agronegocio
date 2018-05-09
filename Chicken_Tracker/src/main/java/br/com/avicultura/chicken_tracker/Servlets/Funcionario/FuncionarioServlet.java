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

        PrintWriter out = response.getWriter();
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        EstabelecimentoFuncionario ef = EstabelecimentoFuncionario.getInstance();
        Funcionario f = Funcionario.getInstance();
        String s = "";
        out.println(request.getParameter("funcionario"));
        if (request.getParameter("funcionario").equals("pagar")) {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }
            String[] cpf = new String[chkBoxIds.size()];
            double total = 0;
            int index = 0;
            for (String s1 : chkBoxIds) {
                cpf[index] = s1.split("!")[1];
                index++;
            }
            for (index = 0; index < cpf.length; index++) {
                ef = ConsultaFuncionario.returnFuncionario(e.getSufixoCNPJ(), cpf[index]);
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
                List<EstabelecimentoFuncionario> list = ConsultaFuncionario.returnListFuncionario(e.getSufixoCNPJ());
                HibernateUtil<Pagamento> hup = new HibernateUtil<>();
                HibernateUtil<Estabelecimento> hue = new HibernateUtil<>();
                for (index = 0; index < cpf.length; index++) {
                    ef = ConsultaFuncionario.returnFuncionario(e.getSufixoCNPJ(), cpf[index]);
                    p.setValor(ef.getSalario());
                    p.setDescricao("Pagamento do funcionário " + ef.getFuncionario().getNome() + " no valor: " + p.getValor()
                            + " na data " + p.getDia() + "/" + p.getMes() + "/" + p.getAno());
                    p.setTipo('G');
                    e.setSaldo(e.getSaldo()-p.getValor());
                    s = hup.salvar(p);
                    hue.atualizar(e);
                }
                if (s.equals("")) {
                    
                    response.sendRedirect("seusNegocios/funcionarios.jsp?estabelecimento=" + e.getSufixoCNPJ());
                } else {
                    out.print(s);
                }
            } else {
                //erro SALDO INSUFICIENTE
            }

        } else {
            HibernateUtil<Funcionario> hupf = new HibernateUtil<>();
            HibernateUtil<EstabelecimentoFuncionario> hupef = new HibernateUtil<>();

            s = "";
            f.setNome(request.getParameter("inputNome"));
            f.setCPF(request.getParameter("inputCPF"));
            f.setRG(request.getParameter("inputRG"));

            if (ConsultaFuncionario.findById(f.getCPF()) == null) {
                s = hupf.salvar(f);
                out.print(s);
            }
            if (s.equals("")) {
                ef.setFuncionario(f);
                ef.setEstabelecimento(e);
                ef.setCargo(request.getParameter("inputCargo"));
                String salario = request.getParameter("inputSalario");
                out.println(salario);
                ef.setSalario(Double.parseDouble(salario));
                out.println(ef.getSalario());
                ef.setSituacao('A');
                s = hupef.salvar(ef);
                out.print(s);
            }
            if (s.equals("")) {
                response.sendRedirect("seusNegocios/funcionarios.jsp?estabelecimento=" + e.getSufixoCNPJ());
            } else {
                out.print(s);
            }

        }
    }

}
