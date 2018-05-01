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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.List;
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
        PrintWriter out = response.getWriter();
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        String s = "";
        if (request.getParameter("fornecedor").contains("pagar-")) {
            Pagamento p = Pagamento.getInstance();
            GregorianCalendar gc = new GregorianCalendar();
            int dia = gc.get(GregorianCalendar.DAY_OF_MONTH);
            int mes = gc.get(GregorianCalendar.MONTH+1);
            int ano = gc.get(GregorianCalendar.YEAR);
            String fornecedor = request.getParameter("fornecedor").substring(6);
            p.setDia(dia);
            p.setMes(mes);
            p.setAno(ano);
            p.setEstabelecimento(e);
            p.setTipo('G');
            List<Fornecimento> list = ConsultaFornecedores.returnList(e.getSufixoCNPJ());
            f = ConsultaFornecedores.findById(fornecedor);
            for(Fornecimento f1 :list){
                p.setValor(f.getPagamento());
                
            }
            
        } else {
            f.setCNPJ(request.getParameter("inputCNPJ"));
            if (ConsultaFornecedores.findById(f.getCNPJ()) == null) {
                f.setQuantidade(Integer.parseInt(request.getParameter("inputQtde")));
                f.setPagamento(Double.parseDouble(request.getParameter("inputValorPagamento")));

                DateFormat formatter = new SimpleDateFormat("dd/MM/YYYY");
                try {
                    f.setVencimento(formatter.parse(request.getParameter("inputDataVencimento")));
                } catch (ParseException ex) {
                }

                f.setTipo('C');
                
                f.setEstabelecimento(e);
                HibernateUtil<Fornecimento> hup = new HibernateUtil<>();
                s = hup.salvar(f);
                if (s.equals("")) {
                    response.sendRedirect("seusNegocios/fornecedores.jsp?estabelecimento=" + e.getSufixoCNPJ());
                } else {
                    out.print(s);
                }
            }
        }
    }

}
