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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class FornecimentoAlterarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Fornecimento f = Fornecimento.getInstance();
        f.setCNPJ(request.getParameter("inputCNPJ"));
        f.setQuantidade(Integer.parseInt(request.getParameter("inputQtde")));
        f.setPagamento(Double.parseDouble(request.getParameter("inputValorPagamento")));

        DateFormat formatter = new SimpleDateFormat("dd/MM/YYYY");
        try {
            f.setVencimento(formatter.parse(request.getParameter("inputDataVencimento")));
        } catch (ParseException ex) {
        }

        f.setTipo('V');

        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        f.setEstabelecimento(e);
        HibernateUtil<Fornecimento> hup = new HibernateUtil<>();
        String s = hup.atualizar(f);
        response.sendRedirect("seusNegocios/fornecimentos.jsp?estabelecimento=" + e.getSufixoCNPJ());

    }
}
