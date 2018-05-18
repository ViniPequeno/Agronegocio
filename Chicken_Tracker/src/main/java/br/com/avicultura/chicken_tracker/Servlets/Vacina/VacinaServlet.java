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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
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
        request.setCharacterEncoding("UTF-8");
        Vacina v = Vacina.getInstance();
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
        HibernateUtil<Vacina> hup = new HibernateUtil<>();
        String butao = request.getParameter("Vacina");

        if (butao.equals("cadastrar")) {
            v.setNome(request.getParameter("inputNome"));
            v.setCodigo(Integer.parseInt(request.getParameter("inputCodigo")));

            DateFormat formatter = new SimpleDateFormat("dd/MM/YYYY");
            try {
                v.setDataRealizada(formatter.parse(request.getParameter("inputDataPrimeiraVacina")));
                v.setDataProxima(formatter.parse(request.getParameter("inputDataProximaVacina")));
            } catch (ParseException ex) {
            }

            v.setEstabelecimento(e);
            v.setDescricao(request.getParameter("inputDescricao"));
            hup.salvar(v);
            response.sendRedirect("seusNegocios/vacinas.jsp?estabelecimento=" + e.getSufixoCNPJ());
        } else if (butao.equals("alterar")) {
            v.setNome(request.getParameter("inputNome"));
            v.setCodigo(Integer.parseInt(request.getParameter("inputUsuario")));
            DateFormat formatter = new SimpleDateFormat("dd/MM/YYYY");
            try {
                v.setDataRealizada(formatter.parse(request.getParameter("inputDataPrimeiraVacina")));
                v.setDataProxima(formatter.parse(request.getParameter("inputDataProximaVacina")));
            } catch (ParseException ex) {
            }
            v.setDescricao(request.getParameter("inputDescricao"));
            hup.atualizar(v);
            response.sendRedirect("seusNegocios/vacinas.jsp?estabelecimento=" + e.getSufixoCNPJ());
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }
            String[] codigo = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                codigo[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < codigo.length; index++) {
                v.setCodigo(Integer.parseInt(codigo[index]));
                String s = hup.deletar(v);
            }
            response.sendRedirect("seusNegocios/vacinas.jsp?estabelecimento=" + e.getSufixoCNPJ());
        }
    }

}
