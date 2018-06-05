/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Pagamento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Pagamento;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vinic
 */
public class PagamentoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("inputEstabelecimentoID");
        int ano = Integer.parseInt(request.getParameter("inputDataInicio"));
        PrintWriter out = response.getWriter();
        String anosDespesas = ConsultaPagamento.AnosDespesas(Long.parseLong(id), ano);
        String anosGanhos = ConsultaPagamento.AnosGanhos(Long.parseLong(id), ano);
        String anosLucros = ConsultaPagamento.AnosLucros(Long.parseLong(id), ano);
        request.getSession().setAttribute("anosDespesas", anosDespesas);
        request.getSession().setAttribute("anosGanhos", anosGanhos);
        request.getSession().setAttribute("anosLucros", anosLucros);
        response.sendRedirect("seusNegocios/desempenho.jsp?estabelecimento="
                +((Estabelecimento)request.getSession().getAttribute("estabelecimento")).getId()+"#graficosAnos");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pagamento p = Pagamento.getInstance();
        GregorianCalendar gc = new GregorianCalendar();
        int dia = gc.get(GregorianCalendar.DAY_OF_MONTH);
        int mes = gc.get(GregorianCalendar.MONTH) + 1;
        int ano = gc.get(GregorianCalendar.YEAR);
        p.setDia(dia);
        p.setMes(mes);
        p.setAno(ano);
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        p.setEstabelecimento(e);
        p.setDescricao(request.getParameter("inputDescricao"));
        p.setValor(Double.parseDouble(request.getParameter("inputValor")));
        p.setTipo(request.getParameter("inputTipo").charAt(0));
        if (p.getTipo() == 'G') {
            e.setSaldo(e.getSaldo() + p.getValor());
        } else {
            e.setSaldo(e.getSaldo() - p.getValor());
        }
        HibernateUtil<Pagamento> hup = new HibernateUtil<>();
        HibernateUtil<Estabelecimento> hue = new HibernateUtil<>();

        PrintWriter out = response.getWriter();
        String s = hup.salvar(p);
        out.println(s);
        s = hue.atualizar(e);
        out.println(s);

        response.sendRedirect("seusNegocios/pagamentos.jsp?estabelecimento=" + e.getId());
    }

}
