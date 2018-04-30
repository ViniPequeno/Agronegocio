/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Vacina;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Vacina;
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
public class VacinaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Vacina v = Vacina.getInstance();
        v.setNome(request.getParameter("inputNome"));
        v.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
        
        DateFormat formatter = new SimpleDateFormat("dd/MM/YYYY");
        try {
            v.setDataRealizada(formatter.parse(request.getParameter("inputDataPrimeiraVacina")));
            v.setDataProxima(formatter.parse(request.getParameter("inputDataProximaVacina")));
        } catch (ParseException ex) {
        }
        
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        v.setEstabelecimento(e);
        v.setDescricao(request.getParameter("inputDescricao"));
        HibernateUtil<Vacina> hup = new HibernateUtil<>();
        String s = hup.salvar(v);
        PrintWriter out = response.getWriter();
        if (s.equals("")) {
            response.sendRedirect("seusNegocios/vacinas.jsp?estabelecimento="+e.getSufixoCNPJ());
        } else {
            out.print(s);
        }
    }

}
