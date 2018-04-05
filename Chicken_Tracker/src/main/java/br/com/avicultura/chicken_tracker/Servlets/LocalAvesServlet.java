/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets;

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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LocalAvesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LocalAvesServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        try {
            LocalAves e = LocalAves.getInstance();
            e.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));
            e.setComprimento(Double.parseDouble(request.getParameter("inputComprimento")));
            e.setLargura(Double.parseDouble(request.getParameter("inputLargura")));
            e.setArea(Double.parseDouble(request.getParameter("inputArea")));
            e.setFuncao(request.getParameter("inputFuncao"));

            Date dataAbertura = formato.parse(request.getParameter("inputDataAbertura"));
            e.setDataAbertura(dataAbertura);
            Date dataFechamento = formato.parse(request.getParameter("inputDataFechamento"));
            e.setDataFechamento(dataFechamento);

            HibernateUtil<LocalAves> hup = new HibernateUtil<>();
            String s = hup.salvar(e);
            PrintWriter out = response.getWriter();
            out.print(formato.format(dataAbertura));
            out.print(formato.format(dataFechamento));
            out.print(s);
        } catch (ParseException ex) {
            Logger.getLogger(LocalAvesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
