package br.com.avicultura.chicken_tracker.Servlets.Funcionario;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.EstabelecimentoFuncionario;
import br.com.avicultura.chicken_tracker.Models.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
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
public class FuncionarioDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        EstabelecimentoFuncionario ef = EstabelecimentoFuncionario.getInstance();
        Funcionario f = Funcionario.getInstance();
        Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");

        HibernateUtil<EstabelecimentoFuncionario> hup = new HibernateUtil<>();
        PrintWriter out = response.getWriter();
        if (request.getParameter("inputCPF") != null) {
            ef.setId(Long.parseLong(request.getParameter("inputCPF")));
            String s = hup.deletar(ef);
            response.sendRedirect("seusNegocios/funcionario.jsp");
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }
            String[] cpf = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                cpf[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < cpf.length; index++) {
                f = ConsultaFuncionario.findById(cpf[index]);
                ef = ConsultaFuncionario.returnFuncionario(e.getSufixoCNPJ(), f.getCPF());
                String s = hup.deletar(ef);
            }
            response.sendRedirect("seusNegocios/funcionarios.jsp?estabelecimento=" + e.getSufixoCNPJ());
        }
    }

}
