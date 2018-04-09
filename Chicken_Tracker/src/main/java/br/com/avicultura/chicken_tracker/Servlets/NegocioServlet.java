/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import br.com.avicultura.chicken_tracker.Models.Perfil;
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
public class NegocioServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        out.println(req.getMethod());
        out.println(req.getContextPath());
        out.println(req.getServletPath());
        out.println(req.getHeaderNames().toString());
    }
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Negocio n = Negocio.getInstance();
        n.setNome(request.getParameter("inputNome"));
        n.setEmpresaCNPJ(request.getParameter("inputEmpresaCNPJ"));
        n.setLinkEmail(request.getParameter("inputLinkEmail"));
        n.setLinkInstragram(request.getParameter("inputLinkInstragram"));
        n.setLinkFacebook(request.getParameter("inputLinkFacebook"));
        //f.setEstabelecimentos();
        HibernateUtil<Negocio> hup = new HibernateUtil<>();
        String s = hup.salvar(n);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/negocios.jsp");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Negocio n = Negocio.getInstance();
        n.setNome(request.getParameter("inputNome"));
        n.setEmpresaCNPJ(request.getParameter("inputEmpresaCNPJ"));
        n.setLinkEmail(request.getParameter("inputLinkEmail"));
        n.setLinkInstragram(request.getParameter("inputLinkInstragram"));
        n.setLinkFacebook(request.getParameter("inputLinkFacebook"));
        //f.setEstabelecimentos();
        HibernateUtil<Negocio> hup = new HibernateUtil<>();
        String s = hup.atualizar(n);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/negocios.jsp");

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Negocio n = Negocio.getInstance();
        n.setEmpresaCNPJ(request.getParameter("inputEmpresaCNPJ"));
        HibernateUtil<Negocio> hup = new HibernateUtil<>();
        String s = hup.deletar(n);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/negocios.jsp");
    }

}
