/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Utils;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ExcluirTudo<T> extends HttpServlet {

    public boolean excluirTudo(List<T> lista) {
        Session s = HibernateFactory.getSession();
        for (T t : lista) {
            s.delete(t);
        }
        return false;
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter p = resp.getWriter();
        ArrayList<String> chkBoxIds = new ArrayList<String>();
        Enumeration enumeration = req.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String parameterName = (String) enumeration.nextElement();
            chkBoxIds.add(parameterName);
            p.println(parameterName);
        }
        p.println(chkBoxIds.size());
        String[] cnpj = new String[chkBoxIds.size()];
        int index = 0;
        for(String s : chkBoxIds){
            cnpj[index] = s.split("!")[1];
            p.println(cnpj[index]);
            index++;
        }
    }
}
