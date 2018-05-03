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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class VacinaAlterarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Vacina v = Vacina.getInstance();
        v.setNome(request.getParameter("inputNome"));
        v.setCodigo(Integer.parseInt(request.getParameter("inputUsuario")));
        //v.setDataProxima(request.getParameter("inputDataProxima"));
        //v.setDataRealizada(request.getParameter("inputDataRealizada"));
        v.setDescricao(request.getParameter("inputDescricao"));
        HibernateUtil<Vacina> hup = new HibernateUtil<>();
        String s = hup.atualizar(v);
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        response.sendRedirect("seusNegocios/vacinas.jsp?estabelecimento=" + e.getSufixoCNPJ());

    }
}
