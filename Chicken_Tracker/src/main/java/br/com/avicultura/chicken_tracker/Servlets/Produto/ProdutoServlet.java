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
public class ProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manterProduto");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Produto p = Produto.getInstance();
        String butao = request.getParameter("produto");
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        HibernateUtil<Produto> hup = new HibernateUtil<>();
        if (butao.equals("cadastrar")) {
            p.setNome(request.getParameter("inputNome"));
            p.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
            p.setDescricao(request.getParameter("inputDescricao"));
            p.setQuantidadeMinima(Integer.parseInt(request.getParameter("inputMinQtde")));
            p.setQuantidadeMaxima(Integer.parseInt(request.getParameter("inputMaxQtde")));
            p.setQuantidadeAtual(Integer.parseInt(request.getParameter("inputQtdeAtual")));
            p.setNegocio(e.getNegocio().getEmpresaCNPJ());
            if (request.getParameter("inputTipo").equals("1")) {
                p.setTipo('P');
            } else {
                p.setTipo('E');
            }
            p.setEstabelecimento(e);
            hup.salvar(p);
            response.sendRedirect("seusNegocios/produtos.jsp?estabelecimento=" + e.getSufixoCNPJ());
        } else if (butao.equals("alterar")) {
            p.setNome(request.getParameter("inputNome"));
            p.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
            p.setDescricao(request.getParameter("inputDescricao"));
            p.setQuantidadeMinima(Integer.parseInt(request.getParameter("inputMinimo")));
            p.setQuantidadeMaxima(Integer.parseInt(request.getParameter("inputMaxima")));
            p.setQuantidadeAtual(Integer.parseInt(request.getParameter("inputAtual")));
            p.setEstabelecimento(e);
            p.setNegocio(e.getNegocio().getEmpresaCNPJ());
            hup.atualizar(p);
            response.sendRedirect("seusNegocios/produtos.jsp?estabelecimento=" + e.getSufixoCNPJ());
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
                p.setCodigo(Integer.parseInt(codigo[index]));
                hup.deletar(p);
            }
            response.sendRedirect("seusNegocios/produtos.jsp?estabelecimento=" + e.getSufixoCNPJ());
        }
    }

}
