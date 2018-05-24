/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Perfil;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import br.com.avicultura.chicken_tracker.Utils.Email;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Arrays;
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
import org.apache.commons.io.FileUtils;

@MultipartConfig
public class PerfilServlet extends HttpServlet {

    final String CAMINHO_LAB_X = "C:/Users/Yan e Pedro/Documents/NetBeansProjects/Avicultura/Chicken_Tracker/src/main/webapp";
    final String CAMINHO_PEDRO = "C:/Users/vinic/Documents/NetBeansProjects/Avicultura/Chicken_Tracker/src/main/webapp";

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
        String s = "";
        Perfil p = Perfil.getInstance();
        HibernateUtil<Perfil> hup = new HibernateUtil<>();
        String butao = "";

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                out.println("Entrei</br>");
                List<FileItem> m = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : m) {//Mudar a ordem dos inputs, colocar o usuario em cima da imagem
                    if (!item.isFormField()) {
                        File file = new File(CAMINHO_PEDRO + "/imagensUsuario/"
                                + p.getUsuario() + ".png");
                        InputStream in = new ByteArrayInputStream(item.get());
                        BufferedImage bImageFromConvert = ImageIO.read(in);
                        if (bImageFromConvert == null
                                || Arrays.equals(item.get(),
                                        FileToByte(new File(CAMINHO_PEDRO + "/img/farmer.jpg")))) {
                            //apagar arquivo
                            if (butao.equals("cadastrar")) {
                                out.println("Foto padrao");
                                p.setFoto("../img/farmer.jpg");
                                file.delete();
                            }
                        } else {
                            out.println("Foto qualuqer");
                            p.setFoto("../imagensUsuario/" + p.getUsuario() + ".png");
                            ImageIO.write(bImageFromConvert, "png", file);
                        }
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
                            case "usuario":
                                butao = item.getString();
                                break;
                        }
                    }
                }
                if (!butao.equals("cadastrar")) {
                    String login = p.getUsuario();
                    String nome = p.getNome();
                    String email = p.getEmail();
                    String foto = p.getFoto();
                    p = ConsultaPerfil.findById(p.getUsuario());
                    p.setNome(nome);
                    p.setEmail(email);
                    p.setFoto(foto);
                }
            } catch (Exception ex) {
                out.println(ex.hashCode());
                out.println(ex.getMessage());
            }

            if (butao.equals("cadastrar")) {
                out.println("Cadsatro");
                HttpSession sessao = request.getSession();

                out.println(p.getUsuario());
                out.println(sessao);
                s = hup.salvar(p);
                if (s.equals("")) {
                    sessao.setAttribute("usuario", p);
                    sessao.setAttribute("usuario_logado", "true");
                    sessao.setAttribute("nome_usuario", p.getUsuario());
                    response.sendRedirect(
                            "seusNegocios/negocios.jsp");
                } else {
                    sessao.setAttribute("erro", s);
                    response.sendRedirect(
                            "excecoes/ErroBanco.jsp");
                }

            } else if (butao.equals("alterar")) {
                HttpSession sessao = request.getSession();

                s = hup.atualizar(p);
                if (s.equals("")) {
                    sessao.setAttribute("usuario", p);
                    sessao.setAttribute("usuario_logado", "true");
                    sessao.setAttribute("nome_usuario", p.getUsuario());
                    response.sendRedirect(
                            "seusNegocios/negocios.jsp");
                } else {
                    sessao.setAttribute("erro", s);
                    response.sendRedirect(
                            "excecoes/ErroBanco.jsp");
                }

            }

        } else {
            butao = request.getParameter("usuario");
            HttpSession sessao = request.getSession();
            if (butao.equals("senha")) {
                p = ConsultaPerfil.findById((String) sessao.getAttribute("nome_usuario"));
                String senhaAtual = request.getParameter("inputSenhaAtual");
                String senhaNova = request.getParameter("inputNovaSenha");
                out.println("senha atual: " + p.getSenha());
                out.println("senha digitada atual: " + senhaAtual);
                if (senhaAtual.equals(p.getSenha()) && !senhaAtual.equals(senhaNova)) {
                    p.setSenha(request.getParameter("inputNovaSenha"));
                    s = hup.atualizar(p);
                    if (s.equals("")) {
                        sessao.setAttribute("usuario", p);
                        sessao.setAttribute("usuario_logado", "true");
                        sessao.setAttribute("nome_usuario", p.getUsuario());
                        response.sendRedirect(
                                "seusNegocios/negocios.jsp");
                    } else {
                        sessao.setAttribute("erro", s);
                        response.sendRedirect(
                                "excecoes/ErroBanco.jsp");
                    }
                } else if (senhaAtual.equals(senhaNova)) {//senha iguais
                    out.println("Senha iguais");
                } else {//senha atual errado
                    out.println("Erro senha atual");
                }
            } else {
                File file = new File(CAMINHO_PEDRO + "/imagensUsuario/" + p.getUsuario() + ".png");

                p.setUsuario((String) sessao.getAttribute("nome_usuario"));
                s = hup.deletar(p);
                if (s.equals("")) {
                    file.delete();
                    sessao.setAttribute("usuario", null);
                    sessao.setAttribute("usuario_logado", "false");
                    sessao.setAttribute("nome_usuario", null);
                    response.sendRedirect(
                            "main/index.jsp");
                } else {
                    sessao.setAttribute("erro", s);
                    response.sendRedirect(
                            "excecoes/ErroBanco.jsp");
                }
            }
        }
    }

    private byte[] FileToByte(File file) throws IOException, IOException {
        //init array with file length
        byte[] byteArray = FileUtils.readFileToByteArray(file);
        return byteArray;
    }
}
