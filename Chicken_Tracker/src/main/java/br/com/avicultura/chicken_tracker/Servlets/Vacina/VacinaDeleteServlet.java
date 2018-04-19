/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Vacina;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Vacina;
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
public class VacinaDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Vacina v = Vacina.getInstance();
        HibernateUtil<Vacina> hup = new HibernateUtil<>();
        PrintWriter out = response.getWriter();
        if (request.getParameter("inputCodigo") != null) {
            v.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
            String s = hup.deletar(v);
            out.print(s);
            response.sendRedirect("seusNegocios/vacinas.jsp");
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }
            out.println(chkBoxIds.size());
            String[] codigo = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                codigo[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < codigo.length; index++) {
                v.setCodigo(Integer.parseInt(codigo[index]));
                String s = hup.deletar(v);
                out.print(s);
            }
        }

    }
}
