/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecedor;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.*;
import br.com.avicultura.chicken_tracker.Servlets.Produto.ConsultaProduto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;
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
        request.setCharacterEncoding("UTF-8");

        PrintWriter o = response.getWriter();

        Fornecimento f = Fornecimento.getInstance();
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        HibernateUtil<Pagamento> hup = new HibernateUtil<>();
        HibernateUtil<Fornecimento> huf = new HibernateUtil<>();
        HibernateUtil<Estabelecimento> hue = new HibernateUtil<>();
        HibernateUtil<Produto> hupro = new HibernateUtil<>();
        String butao = request.getParameter("fornecedor");
        o.println(butao);
        if (butao.equals("pagar")) {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                if (parameterName.contains("checkbox")) {
                    chkBoxIds.add(parameterName);
                }
            }
            String[] cnpj = new String[chkBoxIds.size()];
            int index = 0;
            for (String s1 : chkBoxIds) {
                cnpj[index] = s1.split("!")[1];
                o.println(cnpj[index]);
                index++;
            }
            for (index = 0; index < cnpj.length; index++) {
                f = ConsultaFornecedores.findById(cnpj[index]);
                Pagamento p = Pagamento.getInstance();
                GregorianCalendar gc = new GregorianCalendar();
                int dia = gc.get(GregorianCalendar.DAY_OF_MONTH);
                int mes = gc.get(GregorianCalendar.MONTH + 1);
                int ano = gc.get(GregorianCalendar.YEAR);
                p.setDia(dia);
                p.setMes(mes);
                p.setAno(ano);
                p.setEstabelecimento(e);
                p.setTipo('D');
                p.setValor(f.getPagamento());
                p.setDescricao("Pagamento do fornecedor " + f.getCNPJ()
                        + "referente ao produto " + f.getProdutos().getNome() + " de quantidade igual a"
                        + f.getQuantidade());
                e.setSaldo(e.getSaldo() - p.getValor());
                if (e.getSaldo() >= 0) {
                    f.getProdutos().setQuantidadeAtual(f.getProdutos().getQuantidadeAtual() + f.getQuantidade());
                    hup.salvar(p);
                    hue.atualizar(e);
                    hupro.atualizar(f.getProdutos());
                    response.sendRedirect("seusNegocios/fornecedores.jsp?estabelecimento=" + e.getId());
                } else {
                    response.getWriter().println("ERRO!");
                }//SALDO INSUFICINTE

            }

        } else if (butao.equals("cadastrar")) {
            f.setCNPJ(request.getParameter("inputCNPJCompleto"));
            if (ConsultaFornecedores.findById(f.getCNPJ()) == null) {
                f.setNome(request.getParameter("inputNome"));
                f.setEmail(request.getParameter("inputEmail"));
                f.setQuantidade(Integer.parseInt(request.getParameter("inputQtde")));
                f.setPagamento(Double.parseDouble(request.getParameter("inputValorPagamento")));
                DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                try {
                    f.setVencimento(formatter.parse(request.getParameter("inputDataVencimento")));
                } catch (ParseException ex) {
                }
                f.setTipo('C');
                f.setProdutos(ConsultaProduto.findById(request.getParameter("inputProduto")));
                f.setEstabelecimento(e);
                huf.salvar(f);
                response.sendRedirect("seusNegocios/fornecedores.jsp?estabelecimento=" + e.getId());

            }
        } else if (butao.equals("alterar")) {
            f.setCNPJ(request.getParameter("inputCNPJCompleto"));
            f.setNome(request.getParameter("inputNome"));
            f.setEmail(request.getParameter("inputEmail"));
            f.setQuantidade(Integer.parseInt(request.getParameter("inputQtde")));
            f.setPagamento(Double.parseDouble(request.getParameter("inputValorPagamento")));
            DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            try {
                f.setVencimento(formatter.parse(request.getParameter("inputDataVencimento")));
            } catch (ParseException ex) {
            }

            f.setTipo('C');
            f.setEstabelecimento(e);
            huf.atualizar(f);
            response.sendRedirect("seusNegocios/fornecedores.jsp?estabelecimento=" + e.getId());
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                if (parameterName.contains("checkbox")) {
                    chkBoxIds.add(parameterName);
                }
            }
            String[] id = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                id[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < id.length; index++) {
                Long longID = Long.parseLong(id[index]);
                f.setId(longID);
                huf.deletar(f);
            }
            response.sendRedirect("seusNegocios/fornecedores.jsp?estabelecimento=" + e.getId());
        }
    }
}
