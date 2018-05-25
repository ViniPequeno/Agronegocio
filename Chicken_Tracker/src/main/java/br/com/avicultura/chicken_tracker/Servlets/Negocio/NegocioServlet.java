
package br.com.avicultura.chicken_tracker.Servlets.Negocio;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
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
public class NegocioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Negocio n = Negocio.getInstance();
        String butao = request.getParameter("negocio");
        HibernateUtil<Negocio> hup = new HibernateUtil<>();
        if (butao!=null && butao.equals("cadastrar")) {
            n.setNome(request.getParameter("inputNome"));
            n.setEmpresaCNPJ(request.getParameter("inputCNPJ"));
            n.setEmail(request.getParameter("inputEmail"));
            n.setLinkInstagram(request.getParameter("inputUserInstagram"));
            n.setLinkFacebook(request.getParameter("inputLinkFB"));

            HttpSession sessao = request.getSession();
            n.setPerfil((Perfil) sessao.getAttribute("usuario"));

            n.setTelefone1(request.getParameter("inputTelefone1"));
            n.setTelefone2(request.getParameter("inputTelefone2"));
            String s = hup.salvar(n);
            response.sendRedirect("seusNegocios/negocios.jsp");
        } else if (butao.equals("alterar")) {
            n.setNome(request.getParameter("inputNome"));
            n.setEmpresaCNPJ(request.getParameter("inputCNPJ"));
            n.setEmail(request.getParameter("inputEmail"));
            n.setLinkInstagram(request.getParameter("inputUserInstagram"));
            n.setLinkFacebook(request.getParameter("inputLinkFB"));

            HttpSession sessao = request.getSession();
            n.setPerfil((Perfil) sessao.getAttribute("usuario"));
            String s = hup.atualizar(n);
            PrintWriter out = response.getWriter();
            out.print(s);
            response.sendRedirect("seusNegocios/negocios.jsp");
        } else {
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
                n.setEmpresaCNPJ(cnpj[index]);
                String s = hup.deletar(n);
            }
            response.sendRedirect("seusNegocios/negocios.jsp");
        }
    }

}