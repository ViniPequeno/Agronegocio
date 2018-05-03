/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class EstabelecimentoServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Estabelecimento e = Estabelecimento.getInstance();
        e.setSufixoCNPJ(request.getParameter("inputSufixoCNPJ"));
        e.setCNAE(request.getParameter("inputCNAE"));
        e.setEndereco(request.getParameter("inputEndereco"));
        HttpSession sessao = request.getSession();
        e.setPerfil((Perfil) sessao.getAttribute("usuario"));
        e.setNegocio((Negocio) sessao.getAttribute("negocio"));
        
        HibernateUtil<Estabelecimento> hup = new HibernateUtil<>();
        String s = hup.salvar(e);   
        PrintWriter out = response.getWriter();
        response.sendRedirect("seusNegocios/estabelecimentos.jsp?negocio="+((Negocio) sessao.getAttribute("negocio")).getEmpresaCNPJ());
    }
    
}
