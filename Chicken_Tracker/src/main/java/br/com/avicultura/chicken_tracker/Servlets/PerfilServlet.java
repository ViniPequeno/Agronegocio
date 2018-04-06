/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import static com.sun.org.apache.xerces.internal.util.PropertyState.is;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@MultipartConfig
public class PerfilServlet extends HttpServlet {

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
        Perfil p = Perfil.getInstance();
        p.setNome(request.getParameter("inputNome"));
        p.setUsuario(request.getParameter("inputLogin"));
        p.setEmail(request.getParameter("inputEmail"));
        p.setSenha(request.getParameter("inputSenha"));
        p.setUsuario(request.getParameter("inputLogin"));

        InputStream in = null;
        Part fileImg = request.getPart("inputFoto");
        if (fileImg != null) {
            System.out.println(fileImg.getName());
            System.out.println(fileImg.getSize());
            System.out.println(fileImg.getContentType());
            in = fileImg.getInputStream();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            int reads = in.read();
            while (reads != -1) {
                baos.write(reads);
                reads = in.read();
            }
            p.setFoto(baos.toByteArray());
        }
        PrintWriter out = response.getWriter();
        out.print(request.getPart("inputFoto"));

        HibernateUtil<Perfil> hup = new HibernateUtil<>();
        String s = hup.salvar(p);
        out.print(s);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Perfil p = Perfil.getInstance();
        p.setNome(request.getParameter("inputNome"));
        p.setUsuario(request.getParameter("inputUsuario"));
        p.setEmail(request.getParameter("inputEmail"));
        p.setSenha(request.getParameter("inputSenha"));
        //p.setFoto(foto);
        //f.setEstabelecimentos();
        HibernateUtil<Perfil> hup = new HibernateUtil<>();
        String s = hup.atualizar(p);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/negocios.jsp");

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Perfil p = Perfil.getInstance();
        p.setUsuario(request.getParameter("inputUsuario"));
        HibernateUtil<Perfil> hup = new HibernateUtil<>();
        String s = hup.deletar(p);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/negocios.jsp");
    }
}
