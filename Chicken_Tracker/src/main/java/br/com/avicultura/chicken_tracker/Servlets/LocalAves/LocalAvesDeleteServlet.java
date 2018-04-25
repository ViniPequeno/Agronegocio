/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.LocalAves;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.LocalAves;
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
public class LocalAvesDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalAves la = LocalAves.getInstance();
        HibernateUtil<LocalAves> hup = new HibernateUtil<>();
        if (request.getParameter("inputCodigo") != null) {
            la.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
            String s = hup.deletar(la);
            response.sendRedirect("seusNegocios/aviarios.jsp");
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }
            String[] codigo = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                codigo[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < codigo.length; index++) {
                la.setCodigo(Integer.parseInt(codigo[index]));
                String s = hup.deletar(la);
            }
            Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
            response.sendRedirect("seusNegocios/aviarios.jsp?estabelecimento=" + e.getSufixoCNPJ());
        }
    }
}
