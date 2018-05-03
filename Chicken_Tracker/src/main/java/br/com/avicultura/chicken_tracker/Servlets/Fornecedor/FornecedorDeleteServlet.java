/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecedor;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Fornecimento;
import java.io.IOException;
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
public class FornecedorDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Fornecimento f = Fornecimento.getInstance();
        HibernateUtil<Fornecimento> hup = new HibernateUtil<>();
        if (request.getParameter("inputCNPJ") != null) {
            f.setCNPJ(request.getParameter("inputCNPJ"));
            String s = hup.deletar(f);
            response.sendRedirect("seusNegocios/fornecedor.jsp");
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
                f.setCNPJ(cnpj[index]);
                String s = hup.deletar(f);
            }
            Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
            response.sendRedirect("seusNegocios/fornecedores.jsp?estabelecimento=" + e.getSufixoCNPJ());
        }
    }

}
