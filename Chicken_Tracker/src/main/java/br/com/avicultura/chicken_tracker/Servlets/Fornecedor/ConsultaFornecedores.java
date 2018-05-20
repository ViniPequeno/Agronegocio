/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecedor;

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
public class ConsultaFornecedores {

    public static Fornecimento findById(String id) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Fornecimento f = null;
        Long longID = Long.parseLong(id);
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Fornecimento f where"
                    + " f.id =:id and f.tipo ='c'");
            query.setParameter("id", longID);
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

    public static List<Fornecimento> returnList(String estabelecimento, Negocio negocio) {
        List<Fornecimento> lista = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Fornecimento f where f.negocio =:negocio and f.estabelecimento.sufixoCNPJ =:estabelecimento"
                    + " and tipo = 'c'");
            query.setParameter("estabelecimento", estabelecimento);
            query.setParameter("negocio", negocio.getEmpresaCNPJ());
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
        a += f.getCNPJ() + "#";
        a += f.getVencimento() + "#";
        a += f.getPagamento() + "#";
        a += f.getQuantidade() + "#";

        return a;
    }
}
