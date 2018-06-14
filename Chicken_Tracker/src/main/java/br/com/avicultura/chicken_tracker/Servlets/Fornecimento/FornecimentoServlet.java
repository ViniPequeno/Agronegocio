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
public class FornecimentoServlet extends HttpServlet {

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
        HibernateUtil<Produto> hupro = new HibernateUtil<>();
        HibernateUtil<Estabelecimento> hue = new HibernateUtil<>();
        HibernateUtil<Fornecimento> huf = new HibernateUtil<>();
        String butao = request.getParameter("fornecimento");
        o.println(butao);
        switch (butao) {
            case "pagar": {
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
                    index++;
                }
                for (index = 0; index < cnpj.length; index++) {
                    o.println("oi");
                    f = ConsultaFornecimento.findById(cnpj[index], e.getId().toString());

                    Pagamento p = Pagamento.getInstance();
                    GregorianCalendar gc = new GregorianCalendar();
                    int dia = gc.get(GregorianCalendar.DAY_OF_MONTH);
                    int mes = gc.get(GregorianCalendar.MONTH + 1);
                    int ano = gc.get(GregorianCalendar.YEAR);
                    p.setDia(dia);
                    p.setMes(mes);
                    p.setAno(ano);
                    p.setEstabelecimento(e);
                    p.setTipo('G');
                    p.setValor(f.getPagamento());
                    o.println("ola");
                    p.setDescricao("Pagamento do fornecimento " + f.getCNPJ() + " no valor: " + p.getValor()
                            + "referente ao produto " + f.getProduto().getNome() + " quantidade igual a"
                            + f.getQuantidade() + "na data " + p.getDia()
                            + "/" + p.getMes() + "/" + p.getAno());
                    e.setSaldo(e.getSaldo() + p.getValor());
                    f.getProduto().setQuantidadeAtual(f.getProduto().getQuantidadeAtual() - f.getQuantidade());
                    if (f.getProduto().getQuantidadeAtual() >= 0) { // FOI POSSIVEL
                        hup.salvar(p);
                        hue.atualizar(e);
                        hupro.atualizar(f.getProduto());
                        response.sendRedirect("seusNegocios/fornecimento.jsp?estabelecimento=" + e.getId());
                    } else {///NÃO FOI POSSIVEL E CANCENLA ESSA E OUTRAS OPERAÇÕES
                        response.getWriter().println("ERRADO");
                    }
                }

                break;
            }
            case "cadastrar": {
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
                f.setTipo('V');
                f.setProduto(ConsultaProduto.findById(request.getParameter("inputProduto")));
                f.setEstabelecimento(e);
                huf.salvar(f);
                response.sendRedirect("seusNegocios/fornecimentos.jsp?estabelecimento=" + e.getId());
                break;
            }
            case "alterar": {
                f = ConsultaFornecimento.findByCPF(request.getParameter("inputCNPJCompleto"));
                if (f != null) {
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
                    f.setTipo('V');
                    f.setEstabelecimento(e);
                    huf.atualizar(f);
                    response.sendRedirect("seusNegocios/fornecimentos.jsp?estabelecimento=" + e.getId());
                    break;
                }
            }
            default: {
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
                response.sendRedirect("seusNegocios/fornecimentos.jsp?estabelecimento=" + e.getId());
                break;
            }
        }
    }
}
