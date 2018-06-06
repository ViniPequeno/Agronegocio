/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.LocalAves;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.LocalAves;
import br.com.avicultura.chicken_tracker.Models.Producao;
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
public class LocalAvesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        LocalAves l = LocalAves.getInstance();
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        String butao = request.getParameter("aviario");
        HibernateUtil<LocalAves> hup = new HibernateUtil<>();
        HibernateUtil<Producao> hupro = new HibernateUtil<>();
        PrintWriter out = response.getWriter();
        if (butao != null && butao.equals("atualizarEstoque")) {
            ArrayList<String> chkBoxIds = new ArrayList<>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                if (parameterName.contains("checkbox")) {
                    chkBoxIds.add(parameterName);
                }
            }
            String[] codigo = new String[chkBoxIds.size()];
            int index = 0;
            for (String s1 : chkBoxIds) {
                codigo[index] = s1.split("!")[1];
                index++;
            }
            Producao p = Producao.getInstance();
            GregorianCalendar gc = new GregorianCalendar();
            int dia = gc.get(GregorianCalendar.DAY_OF_MONTH);
            int mes = gc.get(GregorianCalendar.MONTH + 1);
            int ano = gc.get(GregorianCalendar.YEAR);
            p.setDia(dia);
            p.setMes(mes);
            p.setAno(ano);
            p.setEstabelecimento(e);
            for (index = 0; index < codigo.length; index++) {
                out.println("io");
                l = ConsultaLocalAves.findById(codigo[index], e.getId().toString());
                p.setProduto(l.getProduto());
                p.setLocalave(l);
                p.setQuantidade(l.getQuantidade());
                out.println(hupro.salvar(p));
            }
            response.sendRedirect("seusNegocios/aviarios.jsp?estabelecimento=" + e.getId());

        } else if (butao.equals("cadastrar")) {
            l.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
            l.setComprimento(Double.parseDouble(request.getParameter("inputComprimento")));
            l.setLargura(Double.parseDouble(request.getParameter("inputLargura")));
            l.setArea(Double.parseDouble(request.getParameter("inputArea")));
            
            DateFormat formatter = new SimpleDateFormat("dd/MM/YYYY");
            try {
                l.setDataAbertura(formatter.parse(request.getParameter("inputDataAbertura")));
                if(request.getParameter("inputDataFechamento")!=null){
                    l.setDataFechamento(formatter.parse(request.getParameter("inputDataFechamento")));
                }
            } catch (ParseException ex) {
            }
            
            l.setEstabelecimento(e);
            Produto p = ConsultaProduto.findById(request.getParameter("inputProduto"));
            l.setProduto(p);
            hup.salvar(l);
            response.sendRedirect("seusNegocios/aviarios.jsp?estabelecimento=" + e.getId());
        } else if (butao.equals("alterar")) {
            l.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
            l.setComprimento(Double.parseDouble(request.getParameter("inputComprimento")));
            l.setLargura(Double.parseDouble(request.getParameter("inputLargura")));
            l.setArea(Double.parseDouble(request.getParameter("inputArea")));
            
            DateFormat formatter = new SimpleDateFormat("dd/MM/YYYY");
            try {
                l.setDataAbertura(formatter.parse(request.getParameter("inputDataAbertura")));
                if(request.getParameter("inputDataFechamento")!=null){
                    l.setDataFechamento(formatter.parse(request.getParameter("inputDataFechamento")));
                }
            } catch (ParseException ex) {
            }
            
            l.setEstabelecimento(e);
            hup.atualizar(l);
            response.sendRedirect("seusNegocios/aviarios.jsp?estabelecimento=" + e.getId());
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                if (parameterName.contains("checkbox")) {
                    chkBoxIds.add(parameterName);
                }
            }
            String[] codigo = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                codigo[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < codigo.length; index++) {
                l.setCodigo(Integer.parseInt(codigo[index]));
                hup.deletar(l);
            }
            response.sendRedirect("seusNegocios/aviarios.jsp?estabelecimento=" + e.getId());
        }
    }

}
