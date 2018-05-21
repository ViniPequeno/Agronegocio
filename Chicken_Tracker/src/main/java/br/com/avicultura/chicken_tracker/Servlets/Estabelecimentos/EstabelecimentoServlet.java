/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class EstabelecimentoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Estabelecimento e = Estabelecimento.getInstance();
        Negocio n = (Negocio) request.getSession().getAttribute("negocio");
        HibernateUtil<Estabelecimento> hup = new HibernateUtil<>();
        String butao = request.getParameter("estabelecimento");
        String string = "";
        PrintWriter out = response.getWriter();
        
        if (butao.equals("cadastrar")) {
            e.setSufixoCNPJ(request.getParameter("inputSufixoCNPJ"));
            e.setCNAE(request.getParameter("inputCNAE"));
            e.setCEP(request.getParameter("inputCEP"));
            e.setRua(request.getParameter("inputRua"));
            e.setBairro(request.getParameter("inputBairro"));
            e.setCidade(request.getParameter("inputCidade"));
            e.setEstado(request.getParameter("inputEstado"));
            e.setSaldo(Double.parseDouble(request.getParameter("inputSaldo")));
            HttpSession sessao = request.getSession();
            e.setPerfil((Perfil) sessao.getAttribute("usuario"));
            e.setNegocio(n);
            string = hup.salvar(e);
            if (string.equals("")) {
                response.sendRedirect("seusNegocios/estabelecimentos.jsp?negocio=" + n.getEmpresaCNPJ());
            } else {
                out.println(string);
            }
            
        } else if (butao.equals("alterar")) {
            e.setSufixoCNPJ(request.getParameter("inputSuficoCNPJ"));
            e.setCNAE(request.getParameter("inputCNAE"));
            e.setCEP(request.getParameter("inputCEP"));
            e.setRua(request.getParameter("inputRua"));
            e.setBairro(request.getParameter("inputBairro"));
            e.setCidade(request.getParameter("inputCidade"));
            e.setEstado(request.getParameter("inputEstado"));
            e.setNegocio(n);
            string = hup.atualizar(e);
            response.sendRedirect("seusNegocios/estabelecimentos.jsp?negocio=" + n.getEmpresaCNPJ());
        } else if (butao.equals("excluir")) {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();

            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }

            String[] cnpj = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                cnpj[index] = s.split("!")[1];
                index++;
            }

            for (index = 0; index < cnpj.length; index++) {
                e.setSufixoCNPJ(cnpj[index]);
                String s = hup.deletar(e);
            }

            response.sendRedirect("seusNegocios/estabelecimentos.jsp?negocio=" + n.getEmpresaCNPJ());
        }
    }

}
