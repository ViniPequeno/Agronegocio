/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Perfil;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        request.setCharacterEncoding("UTF-8");

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
        Perfil p = Perfil.getInstance();
        p.setNome(request.getParameter("inputNome"));
        p.setUsuario(request.getParameter("inputLogin"));
        p.setEmail(request.getParameter("inputEmail"));
        p.setSenha(request.getParameter("inputSenha"));
        HibernateUtil<Perfil> hup = new HibernateUtil<>();
        String s = hup.salvar(p);
        HttpSession sessao = request.getSession();
        sessao.setAttribute("usuario", p);
        sessao.setAttribute("usuario_logado", "true");
        sessao.setAttribute("nome_usuario", request.getParameter("inputLogin"));
        response.sendRedirect(
                "seusNegocios/negocios.jsp");
    }

}
