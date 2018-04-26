/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecedor;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class FornecedorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Fornecimento f = Fornecimento.getInstance();
        f.setCNPJ(request.getParameter("inputCNPJ"));
        if (ConsultaFornecedores.findById(f.getCNPJ()) == null) {
            f.setQuantidade(Integer.parseInt(request.getParameter("inputQtde")));
            f.setPagamento(Double.parseDouble(request.getParameter("inputValorPagamento")));
            f.setVencimento(request.getParameter("inputDataVencimento"));
            f.setTipo('C');
        }
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        f.setEstabelecimentos(e);
        HibernateUtil<Fornecimento> hup = new HibernateUtil<>();
        String s = hup.salvar(f);
        PrintWriter out = response.getWriter();
        if (s.equals("")) {
            response.sendRedirect("seusNegocios/fornecedores.jsp?estabelecimento="+e.getSufixoCNPJ());
        } else {
            out.print(s);
        }
    }

}
