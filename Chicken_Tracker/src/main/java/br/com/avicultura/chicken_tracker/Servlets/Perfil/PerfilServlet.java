/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Perfil;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig
public class PerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

//        PrintWriter out = response.getWriter();
//        Session session = HibernateFactory.getSessionFactory().openSession();
//        String login = request.getSession().getAttribute("nome_usuario").toString();
//        Perfil object1 = (Perfil) session.get(Perfil.class, login); // It will get data of which have imageId=1
//        //byte[] getImageInBytes = object1.getFoto();  // image convert in byte form
//
//        File imageFile = new File("myImage.jpg"); // we can put any name of file (just name of new file created).
//
//        FileOutputStream outputStream = new FileOutputStream(imageFile); // it will create new file (same location of class)
//        outputStream.write(getImageInBytes); // image write in "myImage.jpg" file
//        outputStream.close(); // close the output stream
//
//        response.setContentType("text/html");
//        out = response.getWriter();
//        out.println(getImageInBytes);
//        out.println("<html>");
//        out.println("<head>");
//        out.println("<title> Cálculo de áreas de figuras geométricas</title>");
//        out.println("</head>");
//        out.println("<body>");
//        out.println(login);
//        out.print("<br/>");
//        out.print(object1.getEmail());
//        out.print("<br/>");
//        out.println(request.getContextPath());
//        out.print("<br/>");
//        out.println(imageFile.getAbsolutePath());
//        out.print("<br/>");
//        out.println("Retrieved Image from Database using Hibernate.");
//        out.print("<br/>");
//        out.println("<img src='myImage.jpg'>");
//        out.print("<br/>");
//        out.println("</body>");
//        out.println("</html>");
//        session.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Perfil p = Perfil.getInstance();
        HibernateUtil<Perfil> hup = new HibernateUtil<>();
        String s = "";
        String butao = "";

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                out.print("Entrei</br>");
                List<FileItem> m = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : m) {//Mudar a ordem dos inputs, colocar o usuario em cima da imagem
                    if (!item.isFormField()) {
                        File file = new File("/Users/user/Documents/GitHub/Avicultura/Chicken_Tracker/src/main/webapp/imagensUsuario/imagensUsuario"
                                +p.getUsuario() + ".png");
                        String name = file.getAbsolutePath();
                        p.setFoto(file.getAbsolutePath());
                        InputStream in = new ByteArrayInputStream(item.get());
                        BufferedImage bImageFromConvert = ImageIO.read(in);

                        ImageIO.write(bImageFromConvert, "png", file);

                    } else {
                        out.println(item.getFieldName());
                        switch (item.getFieldName()) {
                            case "inputNome":
                                p.setNome(item.getString());
                                break;
                            case "inputLogin":
                                p.setUsuario(item.getString());
                                break;
                            case "inputEmail":
                                p.setEmail(item.getString());
                                break;
                            case "inputSenha":
                                p.setSenha(item.getString());
                                break;
                                case "usuario":
                                butao = item.getString();
                        }
                    }
                }
                out.println("Butao: "+butao);
            } catch (Exception ex) {
            }

            if (butao.equals("cadastrar")) {
                out.println("Cadsatro");
                HttpSession sessao = request.getSession();

                out.println(p.getUsuario());
                out.println(sessao);
                s = hup.salvar(p);
                sessao.setAttribute("usuario", p);
                sessao.setAttribute("usuario_logado", "true");
                sessao.setAttribute("nome_usuario", p.getUsuario());
                response.sendRedirect(
                        "seusNegocios/negocios.jsp");

            } else if (butao.equals("alterar")) {
                if (ServletFileUpload.isMultipartContent(request)) {
                    try {
                        out.print("Entrei</br>");
                        List<FileItem> m = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                        for (FileItem item : m) {//Mudar a ordem dos inputs, colocar o usuario em cima da imagem
                            if (!item.isFormField()) {
                                File file = new File("imagensUsuario/imagensUsuario"+p.getUsuario() + ".png");
                                String name = file.getAbsolutePath();
                                System.out.println(name);
                                p.setFoto(name);
                                out.println(p.getFoto());
                                InputStream in = new ByteArrayInputStream(item.get());
                                BufferedImage bImageFromConvert = ImageIO.read(in);

                                ImageIO.write(bImageFromConvert, "png", file);

                            } else {
                                switch (item.getFieldName()) {
                                    case "inputNome":
                                        p.setNome(item.getString());
                                        break;
                                    case "inputLogin":
                                        p.setUsuario(item.getString());
                                        break;
                                    case "inputEmail":
                                        p.setEmail(item.getString());
                                        break;
                                    case "inputSenha":
                                        p.setSenha(item.getString());
                                        break;
                                }
                            }
                        }
                        HttpSession sessao = request.getSession();
                        s = hup.atualizar(p);
                        sessao.setAttribute("usuario", p);
                        sessao.setAttribute("usuario_logado", "true");
                        sessao.setAttribute("nome_usuario", p.getUsuario());
                        response.sendRedirect(
                                "seusNegocios/negocios.jsp");
                    } catch (Exception ex) {
                    }
                }
            } else {
                HttpSession sessao = request.getSession();
                p.setUsuario((String) sessao.getAttribute("nome_usuario"));
                s = hup.deletar(p);
            }

        }

    }

}
