/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.LocalAves;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.LocalAves;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        LocalAves l = LocalAves.getInstance();
        l.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
        l.setComprimento(Double.parseDouble(request.getParameter("inputComprimento")));
        l.setLargura(Double.parseDouble(request.getParameter("inputLargura")));
        l.setArea(Double.parseDouble(request.getParameter("inputArea")));
        l.setDataAbertura(request.getParameter("inputDataAbertura"));
        l.setFuncao(request.getParameter("inputFuncao"));
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        l.setEstabelecimento(e);
        e.getLocais().add(l);
        HibernateUtil<LocalAves> hup = new HibernateUtil<>();
        String s = hup.salvar(l);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/aviarios.jsp?estabelecimento="+e.getSufixoCNPJ());
    }

    

    

}
