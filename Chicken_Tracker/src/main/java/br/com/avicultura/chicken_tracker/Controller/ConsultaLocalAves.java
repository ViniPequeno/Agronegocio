/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Controller;

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

    public static LocalAves findById(String id, String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("select * from LocalAves la where "
                + "la.Estabelecimento.suficoCNPJ := estabelecimento and la.codigo := id");
        query.setParameter("id", id);
        query.setParameter("estabelecimento", estabelecimento);
        return (LocalAves) query.getSingleResult();
    }

    public static List<LocalAves> returnList(String estabeleciemento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("select * from LocalAves la where la.Estabelecimento.suficoCNPJ= estabelecimento");
        query.setParameter("estabelecimento", estabeleciemento);
        return query.getResultList();
    }
}
