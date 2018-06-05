/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.LocalAves;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.LocalAves;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaLocalAves {

    public static LocalAves findById(String codigo, String estabelecimentoID) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Long longID = Long.parseLong(estabelecimentoID);
        Integer intID = Integer.parseInt(codigo);
        Query query = s.createQuery("from LocalAves la where "
                + "la.estabelecimento.id =:id and la.codigo =:codigo");
        query.setParameter("codigo", intID);
        query.setParameter("id", longID);
         
        return (LocalAves) query.getSingleResult();
    }

    public static List<LocalAves> returnList(String estabelecimentoID) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Long longID = Long.parseLong(estabelecimentoID);
        Query query = s.createQuery("from LocalAves la where la.estabelecimento.id =:id");
        query.setParameter("id", longID);
         
        return query.getResultList();
    }

    public static String returnValues(LocalAves la) {
        String a = "";
        a += la.getCodigo() + "#";
        a += la.getArea() + "#";
        a += la.getDataAbertura() + "#";
        a += la.getDataFechamento() + "#";
        return a;
    }
}
