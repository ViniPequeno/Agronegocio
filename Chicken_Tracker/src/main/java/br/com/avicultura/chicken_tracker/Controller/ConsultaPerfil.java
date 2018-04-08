/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Controller;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author Pedro
 */
public class ConsultaPerfil {

    public static Perfil findById(String id) {
        Session s = HibernateFactory.getSession();
        return s.get(Perfil.class, id);
    }

    public static List<Perfil> returnList() {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("select * from Perfil");
        return query.getResultList();
    }
}
