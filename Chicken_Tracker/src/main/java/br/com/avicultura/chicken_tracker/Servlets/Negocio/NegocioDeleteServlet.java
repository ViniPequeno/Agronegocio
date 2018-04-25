/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Negocio;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Negocio;
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
public class NegocioDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Negocio n = Negocio.getInstance();
        HibernateUtil<Negocio> hup = new HibernateUtil<>();
        if (request.getParameter("inputEmpresaCNPJ") != null) {
            n.setEmpresaCNPJ(request.getParameter("inputEmpresaCNPJ"));
            String s = hup.deletar(n);
            response.sendRedirect("seusNegocios/negocios.jsp");
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }
            String[] cnpj = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                cnpj[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < cnpj.length; index++) {
                n.setEmpresaCNPJ(cnpj[index]);
                String s = hup.deletar(n);
            }
            response.sendRedirect("seusNegocios/negocios.jsp");
        }
    }

}
