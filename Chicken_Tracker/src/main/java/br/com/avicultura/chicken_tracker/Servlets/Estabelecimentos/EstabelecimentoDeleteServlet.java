/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
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
public class EstabelecimentoDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Estabelecimento e = Estabelecimento.getInstance();
        HibernateUtil<Estabelecimento> hup = new HibernateUtil<>();
        PrintWriter out = response.getWriter();
        if (request.getParameter("inputSufixoCNPJ") != null) {
            e.setSufixoCNPJ(request.getParameter("inputSufixoCNPJ"));
            String s = hup.deletar(e);
            out.print(s);
            response.sendRedirect("seusNegocios/estabelecimentos.jsp");
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }
            out.println(chkBoxIds.size());
            String[] cnpj = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                cnpj[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < cnpj.length; index++) {
                e.setSufixoCNPJ(cnpj[index]);
                String s = hup.deletar(e);
                out.print(s);
            }
        }
    }
}
