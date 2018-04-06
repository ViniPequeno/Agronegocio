/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import static com.sun.org.apache.xerces.internal.util.PropertyState.is;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Perfil p = Perfil.getInstance();
        p.setNome(request.getParameter("inputNome"));
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
