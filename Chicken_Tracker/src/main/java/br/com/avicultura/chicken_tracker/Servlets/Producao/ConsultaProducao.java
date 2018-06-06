/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Producao;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Producao;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author vinic
 */
public class ConsultaProducao {
    
    public static List<Producao> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        List<Producao> lista = null;
        Long longID = Long.parseLong(estabelecimento);
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Producao p where p.estabelecimento.id =:estabelecimento");
            query.setParameter("estabelecimento", longID);

            lista = query.getResultList();
            s.getTransaction().commit();
            return lista;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return lista;
    }

    
}
