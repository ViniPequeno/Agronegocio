/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author User
 */
@MultipartConfig
public class PerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        Session session = new Configuration().configure("hibernate.cfg.xml")
                .buildSessionFactory().openSession();
        String login = request.getSession().getAttribute("nome_usuario").toString();
        Perfil object1 = (Perfil) session.get(Perfil.class, login); // It will get data of which have imageId=1
        byte[] getImageInBytes = object1.getFoto();  // image convert in byte form

        File imageFile = new File("/Users/user/Documents/GitHub/Avicultura/Chicken_Tracker/myImage.jpg"); // we can put any name of file (just name of new file created).

        FileOutputStream outputStream = new FileOutputStream(imageFile); // it will create new file (same location of class)
        outputStream.write(getImageInBytes); // image write in "myImage.jpg" file
        outputStream.close(); // close the output stream
        
        response.setContentType("text/html");
        out = response.getWriter();
        out.println(getImageInBytes);
        out.println("<html>");
        out.println("<head>");
        out.println("<title> Cálculo de áreas de figuras geométricas</title>");
        out.println("</head>");
        out.println("<body>");
        out.println(login);
        out.println(request.getContextPath());
        out.println(imageFile.getAbsolutePath());
        out.println("Retrieved Image from Database using Hibernate.");
        out.println("<img src='myImage.jpg'>");
        out.println("</body>");
        out.println("</html>");
        session.close();
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
