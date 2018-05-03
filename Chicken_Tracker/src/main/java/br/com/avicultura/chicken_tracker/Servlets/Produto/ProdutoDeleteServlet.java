/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Produto;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Produto;
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
public class ProdutoDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Produto p = Produto.getInstance();
        HibernateUtil<Produto> hup = new HibernateUtil<>();
        PrintWriter w = response.getWriter();
        if (request.getParameter("inputCodigo") != null) {
            p.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
            String s = hup.deletar(p);
            response.sendRedirect("seusNegocios/produtos.jsp");
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
                w.println(parameterName);
            }
            String[] codigo = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                codigo[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < codigo.length; index++) {
                p.setCodigo(Integer.parseInt(codigo[index]));
                String s = hup.deletar(p);
                w.print(s);
            }
            Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
            response.sendRedirect("seusNegocios/produtos.jsp?estabelecimento=" + e.getSufixoCNPJ());
        }
    }

}
