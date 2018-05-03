/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Perfil;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
public class PerfilAlterarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        Perfil p = Perfil.getInstance();
        PrintWriter out = response.getWriter();
        out.println(request.getParameter("inputLogin"));
        out.println(request.getParameter("inputNome"));
        out.println(request.getParameter("inputEmail"));
        out.println(request.getParameter("inputSenha") + " oi");

        InputStream inputStream = null; // input stream of the upload file
        Part filePart = request.getPart("inputFoto");
        if (filePart != null) {
            // prints out some information for debugging
            out.println(filePart.getName());
            out.println(filePart.getSize());
            out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            int bytesRead;
            ByteArrayOutputStream b = new ByteArrayOutputStream();
            while ((bytesRead = inputStream.read()) != -1) {
                b.write(bytesRead);
            }
            byte[] bytes = b.toByteArray();
            p.setFoto(bytes);
        }

        p.setNome(request.getParameter("inputNome"));
        p.setUsuario(request.getParameter("inputLogin"));
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
