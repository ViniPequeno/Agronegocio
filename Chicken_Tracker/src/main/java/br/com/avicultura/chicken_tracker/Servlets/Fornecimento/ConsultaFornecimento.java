/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecimento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Fornecimento;
import java.text.SimpleDateFormat;
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
    
    public static Fornecimento findByCPF(String cnpj) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Fornecimento f = null;
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Fornecimento f where"
                    + " f.CNPJ =:CNPJ and f.tipo ='v'");
            query.setParameter("CNPJ", cnpj);
            try{
            f = (Fornecimento) query.getSingleResult();
            }catch(NoResultException e){
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

    public static List<Fornecimento> returnList(String estabelecimentoID) {
        List<Fornecimento> lista = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        Long longID = Long.parseLong(estabelecimentoID);
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Fornecimento f where f.estabelecimento.id =:id"
                    + " and f.tipo = 'v'");
            query.setParameter("id", longID);
             
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

    public static String returnValues(Fornecimento f) {
        String a = "";
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        a += f.getNome() + "#";
        a += f.getCNPJ() + "#";
        a += f.getEmail() + "#";
        a += f.getProduto().getNome() + "#";
        a += f.getPagamento() + "#";
        a += f.getQuantidade() + "#";
        a += formatter.format(f.getVencimento())+ "#";

        return a;
    }
}
