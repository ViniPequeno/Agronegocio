/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Session;

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
        Session session = HibernateFactory.getSession();
        String login = request.getSession().getAttribute("nome_usuario").toString();
        Perfil object1 = (Perfil) session.get(Perfil.class, login); // It will get data of which have imageId=1
        byte[] getImageInBytes = object1.getFoto();  // image convert in byte form

        File imageFile = new File("myImage.jpg"); // we can put any name of file (just name of new file created).

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
        out.print("<br/>");
        out.print(object1.getEmail());
        out.print("<br/>");
        out.println(request.getContextPath());
        out.print("<br/>");
        out.println(imageFile.getAbsolutePath());
        out.print("<br/>");
        out.println("Retrieved Image from Database using Hibernate.");
        out.print("<br/>");
        out.println("<img src='myImage.jpg'>");
        out.print("<br/>");
        out.println("</body>");
        out.println("</html>");
        session.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("inputFoto"); // Retrieves <input type="file" name="file">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        InputStream fileContent = filePart.getInputStream();
        System.out.println(fileContent.toString());
        System.out.println(fileContent.available());
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
