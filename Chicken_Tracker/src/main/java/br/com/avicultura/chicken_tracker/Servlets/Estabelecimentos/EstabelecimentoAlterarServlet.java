/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Negocio;
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
public class EstabelecimentoAlterarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Estabelecimento e = Estabelecimento.getInstance();
        e.setSufixoCNPJ(request.getParameter("inputSuficoCNPJ"));
        e.setCNAE(request.getParameter("inputCNAE"));
        e.setEndereco(request.getParameter("inputEndereco"));
        HibernateUtil<Estabelecimento> hup = new HibernateUtil<>();
        String s = hup.atualizar(e);
        Negocio n = (Negocio) request.getSession().getAttribute("negocio");
        response.sendRedirect("seusNegocios/estabelecimentos.jsp?negocio=" + n.getEmpresaCNPJ());
    }

}
