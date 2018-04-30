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
////        Session s = HibernateFactory.getSession();
////        Query query = s.createQuery("from perfil");
////        List<Perfil> list = query.getResultList();
//          response.sendRedirect("manter");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("funcionario").equals("pagar")) {
            Pagamento p = Pagamento.getInstance();
            p.setDia(0);
        } else {
            PrintWriter out = response.getWriter();
            HibernateUtil<Funcionario> hupf = new HibernateUtil<>();
            HibernateUtil<EstabelecimentoFuncionario> hupef = new HibernateUtil<>();

            Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
            EstabelecimentoFuncionario ef = EstabelecimentoFuncionario.getInstance();

            String s = "";
            Funcionario f = Funcionario.getInstance();
            f.setNome(request.getParameter("inputNome"));
            f.setCPF(request.getParameter("inputCPF"));
            f.setRG(request.getParameter("inputRG"));

            if (ConsultaFuncionario.findById(f.getCPF()) == null) {
                s = hupf.salvar(f);
            }
            if (s.equals("")) {
                ef.setFuncionario(f);
                ef.setEstabelecimento(e);
                ef.setCargo(request.getParameter("inputCargo"));
                ef.setSalario(Double.parseDouble(request.getParameter("inputSalario")));
                ef.setSituacao('A');
                s = hupef.salvar(ef);
            }
            if (s.equals("")) {
                response.sendRedirect("seusNegocios/funcionarios.jsp?estabelecimento=" + e.getSufixoCNPJ());
            } else {
                out.print(s);
            }

        }
    }

}
