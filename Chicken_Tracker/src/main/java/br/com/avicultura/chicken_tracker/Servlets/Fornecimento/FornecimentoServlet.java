/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecimento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Fornecimento;
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
public class FornecimentoServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Fornecimento f = Fornecimento.getInstance();
        f.setCNPJ(request.getParameter("inputCNPJ"));
        f.setQuantidade(Integer.parseInt(request.getParameter("inputQtde")));
        f.setPagamento(Double.parseDouble(request.getParameter("inputValorPagamento")));
        f.setVencimento(request.getParameter("inputDataVencimento"));
        f.setTipo('V');
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        f.getEstabelecimentos().add(e);
        e.getFornecimentos().add(f);
        HibernateUtil<Fornecimento> hup = new HibernateUtil<>();
        String s = hup.salvar(f);
        PrintWriter out = response.getWriter();
        if (s.equals("")) {
            response.sendRedirect("seusNegocios/fornecimentos.jsp");
        } else {
            out.print(s);
        }
    }
    
}
