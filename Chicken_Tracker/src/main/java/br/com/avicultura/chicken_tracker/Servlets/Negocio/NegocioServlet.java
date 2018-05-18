/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Negocio;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class NegocioServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        Negocio n = Negocio.getInstance();
        n.setNome(request.getParameter("inputNome"));
        n.setEmpresaCNPJ(request.getParameter("inputCNPJ"));
        n.setLinkEmail(request.getParameter("inputEmail"));
        n.setLinkInstagram(request.getParameter("inputLinkInstagram"));
        n.setLinkFacebook(request.getParameter("inputLinkFB"));
        n.setFone1(request.getParameter("inputFone1"));
        n.setFone2(request.getParameter("inputFone2"));
        
        HttpSession sessao = request.getSession();
        n.setPerfil((Perfil) sessao.getAttribute("usuario"));
                
        HibernateUtil<Negocio> hup = new HibernateUtil<>();
        String s = hup.salvar(n);
        out.println(s);
        
        response.sendRedirect("seusNegocios/negocios.jsp");
    }
    
}
