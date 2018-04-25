/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Funcionario;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Funcionario;
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
public class FuncionarioAlterarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Funcionario f = Funcionario.getInstance();
        f.setNome(request.getParameter("inputNome"));
        f.setCPF(request.getParameter("inputCPF"));
        f.setCargo(request.getParameter("inputCargo"));
        f.setRG(request.getParameter("inputRG"));
        f.setSituacao('A');
        HibernateUtil<Funcionario> hup = new HibernateUtil<>();
        String s = hup.atualizar(f);
        PrintWriter out = response.getWriter();
        out.print(s);
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        response.sendRedirect("seusNegocios/funcionarios.jsp?estabelecimento=" + e.getSufixoCNPJ());
    }

}
