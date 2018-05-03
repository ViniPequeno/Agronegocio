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

/**
 *
 * @author User
 */
public class PerfilDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Perfil p = Perfil.getInstance();
        HibernateUtil<Perfil> hup = new HibernateUtil<>();
        PrintWriter out = response.getWriter();
        if (request.getParameter("inputUsuario") != null) {
            p.setUsuario(request.getParameter("inputUsuario"));
            String s = hup.deletar(p);
            out.print(s);
            response.sendRedirect("seusNegocios/perfil.jsp");
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }
            out.println(chkBoxIds.size());
            String[] perfil = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                perfil[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < perfil.length; index++) {
                p.setUsuario(perfil[index]);
                String s = hup.deletar(p);
                out.print(s);
            }
        }
    }

}
