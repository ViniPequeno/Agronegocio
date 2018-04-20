/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Produto;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Produto;
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
public class ProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manterProduto");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Produto p = Produto.getInstance();
        p.setNome(request.getParameter("inputNome"));
        p.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
        p.setDescricao(request.getParameter("inputDescricao"));
        p.setQuantidadeMinima(Integer.parseInt(request.getParameter("inputMinimo")));
        p.setQuantidadeMaxima(Integer.parseInt(request.getParameter("inputMaxima")));
        p.setQuantidadeAtual(Integer.parseInt(request.getParameter("inputAtual")));
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        p.setEstabelecimento(e);
        e.getProdutos().add(p);
        //p.setFoto(foto);
        HibernateUtil<Produto> hup = new HibernateUtil<>();
        String s = hup.salvar(p);
        PrintWriter out = response.getWriter();
        if (s.equals("")) {
            response.sendRedirect("seusNegocios/produtos.jsp");
        } else {
            out.print(s);
        }
    }

}
