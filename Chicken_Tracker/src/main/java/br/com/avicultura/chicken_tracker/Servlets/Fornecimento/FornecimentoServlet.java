/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecimento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Fornecimento;
import br.com.avicultura.chicken_tracker.Models.Pagamento;
import br.com.avicultura.chicken_tracker.Models.Produto;
import br.com.avicultura.chicken_tracker.Servlets.Fornecedor.ConsultaFornecedores;
import br.com.avicultura.chicken_tracker.Servlets.Produto.ConsultaProduto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
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
        request.setCharacterEncoding("UTF-8");
        Fornecimento f = Fornecimento.getInstance();
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        String s = "";
        PrintWriter out = response.getWriter();
        if (request.getParameter("fornecimento").equals("pagar")) {
            Pagamento p = Pagamento.getInstance();
            GregorianCalendar gc = new GregorianCalendar();
            int dia = gc.get(GregorianCalendar.DAY_OF_MONTH);
            int mes = gc.get(GregorianCalendar.MONTH + 1);
            int ano = gc.get(GregorianCalendar.YEAR);
            String fornecedor = request.getParameter("fornecedor").substring(6);
            p.setDia(dia);
            p.setMes(mes);
            p.setAno(ano);
            p.setEstabelecimento(e);
            p.setTipo('G');
            f = ConsultaFornecedores.findById(fornecedor);
            p.setValor(f.getPagamento());
            p.setDescricao("Pagamento do fornecedor " + f.getCNPJ() + " no valor: " + p.getValor()
                    + "referente ao produto " + f.getProdutos().getNome() + " quantidade igual a"
                    + f.getQuantidade() + "na data " + p.getDia()
                    + "/" + p.getMes() + "/" + p.getAno());
            HibernateUtil<Pagamento> hup = new HibernateUtil<>();
            s = hup.salvar(p);
            if (s.equals("")) {
                response.sendRedirect("seusNegocios/fornecedor.jsp?estabelecimento=" + e.getSufixoCNPJ());
            } else {
                out.print(s);
            }
        } else {

            f.setCNPJ(request.getParameter("inputCNPJ"));
            f.setQuantidade(Integer.parseInt(request.getParameter("inputQtde")));
            f.setPagamento(Double.parseDouble(request.getParameter("inputValorPagamento")));

            DateFormat formatter = new SimpleDateFormat("dd/MM/YYYY");
            try {
                f.setVencimento(formatter.parse(request.getParameter("inputDataVencimento")));
            } catch (ParseException ex) {
            }

            f.setTipo('V');
            f.setProdutos(ConsultaProduto.findById(request.getParameter("inputProduto")));
            f.setEstabelecimento(e);
            HibernateUtil<Fornecimento> hup = new HibernateUtil<>();
            s = hup.salvar(f);
            if (s.equals("")) {
                response.sendRedirect("seusNegocios/fornecimentos.jsp?estabelecimento=" + e.getSufixoCNPJ());
            } else {
                out.print(s);
            }
        }
    }
}
