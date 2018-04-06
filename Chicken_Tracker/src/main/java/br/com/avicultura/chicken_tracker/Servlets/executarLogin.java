/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

/**
 *
 * @author user
 */
public class executarLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        HttpSession sessao = request.getSession();
        sessao.setAttribute("usuario_logado", null);
        sessao.invalidate();
        response.sendRedirect("main/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        HttpSession sessao = request.getSession();
        Session s = HibernateFactory.getSession();
        Perfil p = s.get(Perfil.class, request.getParameter("inputLogin"));
        if(p==null){
            //Usuario naão existe
        }else if (request.getParameter("inputSenha").equals(p.getSenha())) {
            sessao.setAttribute("usuario_logado", "true");
            sessao.setAttribute("nome_usuario", request.getParameter("inputLogin"));
            response.sendRedirect("main/index.jsp");
        } else {
            response.sendRedirect("main/login.jsp");
        }

    }

}