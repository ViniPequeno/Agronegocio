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
import java.io.IOException;
import java.io.PrintWriter;
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
        String s = "";
        PrintWriter out = response.getWriter();
        String param = request.getParameter("aviario");
        if (param != null && param.equals("cadastrar")) {
            l.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
            l.setComprimento(Double.parseDouble(request.getParameter("inputComprimento")));
            l.setLargura(Double.parseDouble(request.getParameter("inputLargura")));
            l.setArea(Double.parseDouble(request.getParameter("inputArea")));
            l.setDataAbertura(request.getParameter("inputDataAbertura"));
            l.setFuncao(request.getParameter("inputFuncao"));
            l.setEstabelecimento(e);
            e.getLocais().add(l);
            HibernateUtil<LocalAves> hup = new HibernateUtil<>();
            s = hup.salvar(l);
            out.print(s);
            response.sendRedirect("seusNegocios/aviarios.jsp?estabelecimento=" + e.getSufixoCNPJ());
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
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
            HibernateUtil<Producao> hup = new HibernateUtil<>();
            for (index = 0; index < codigo.length; index++) {
                l = ConsultaLocalAves.findById(codigo[index], e.getSufixoCNPJ());
                p.setProduto(l.getProduto());
                p.setQuantidade(l.getQuantidade());
                s = hup.salvar(p);
            }
            if (s.equals("")) {
                response.sendRedirect("seusNegocios/aviarios.jsp?estabelecimento=" + e.getSufixoCNPJ());

            } else {
                out.println(s);
            }
        }
    }

}
