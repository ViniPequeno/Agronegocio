/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Perfil;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class PerfilAlterarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Perfil p = Perfil.getInstance();
        PrintWriter out = response.getWriter();
        out.print(request.getParameter("inputNome"));
        out.print(request.getParameter("inputEmail"));
        out.print(request.getParameter("inputSenha"));
        p.setNome(request.getParameter("inputNome"));
        p.setUsuario(request.getParameter("inputUsuario"));
        p.setEmail(request.getParameter("inputEmail"));
        p.setSenha(request.getParameter("inputSenha"));

        HttpSession sessao = request.getSession();
        p.setUsuario(((Perfil) sessao.getAttribute("usuario")).getUsuario());
        //p.setFoto(foto);
        //f.setEstabelecimentos();

        sessao.setAttribute("usuario_logado", "true");
        sessao.setAttribute("nome_usuario", p.getUsuario());
        sessao.setAttribute("usuario", p);
        HibernateUtil<Perfil> hup = new HibernateUtil<>();
        String s = hup.atualizar(p);
        out.print(s);

    }
}
