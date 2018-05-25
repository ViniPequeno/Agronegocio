/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecimento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Fornecimento;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import java.util.List;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaFornecimento {

    public static Fornecimento findById(String id, String estabelecimento) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Fornecimento f = null;
        Long longID = Long.parseLong(id);
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Fornecimento f where"
                    + " f.id =:id and f.tipo = 'v'");
            query.setParameter("id", longID);
            try {
                f = (Fornecimento) query.getSingleResult();
            } catch (NoResultException e) {
                f = null;
            }
            s.getTransaction().commit();
            return f;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return f;
    }

    public static List<Fornecimento> returnList(String estabelecimento, Negocio negocio) {
        List<Fornecimento> lista = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Fornecimento f where f.estabelecimento.sufixoCNPJ =:estabelecimento"
                    + " and tipo = 'v'");
            query.setParameter("estabelecimento", estabelecimento);
             
            lista = query.getResultList();
            s.getTransaction().commit();
            return lista;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return lista;
    }

    public static String returnValues(Fornecimento e) {
        String a = "";
        a += e.getCNPJ() + "#";
        a += e.getVencimento() + "#";
        a += e.getPagamento() + "#";
        a += e.getQuantidade() + "#";
        return a;
    }

}
