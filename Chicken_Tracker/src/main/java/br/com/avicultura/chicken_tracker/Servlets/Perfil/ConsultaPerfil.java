/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Perfil;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author Pedro
 */
public class ConsultaPerfil {

    public static Perfil findById(String id) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Perfil p = null;
        try {
            s.beginTransaction();
            p = s.get(Perfil.class, id);
            s.getTransaction().commit();
            return p;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        }finally{
            s.close();
        }
        return p;
    }

    public static List<Perfil> returnList() {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = s.createQuery("from Perfil");
        return query.getResultList();
    }

    public static String returnValues(Perfil p) {
        String a = "";
        a += p.getNome() + "#";
        a += p.getEmail() + "#";
        a += p.getUsuario() + "#";
        return a;
    }
}
