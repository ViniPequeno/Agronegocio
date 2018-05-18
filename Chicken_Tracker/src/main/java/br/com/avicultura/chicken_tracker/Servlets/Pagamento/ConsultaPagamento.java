/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Pagamento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Pagamento;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author vinic
 */
public class ConsultaPagamento {

    public static List<Pagamento> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        List<Pagamento> lista = null;
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Pagamento p where p.estabelecimento.sufixoCNPJ =:estabelecimento"
                    + " ORDER BY ano DESC, mes DESC, dia DESC, valor DESC");
            query.setParameter("estabelecimento", estabelecimento);
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
    
    public static String seteDias(){
        String st;
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
        */
        return st="";
    }
    
    public static String trintaDias(){
        String st;
        /* 
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
        */
        return st="";
    }
    
    public static String dozeMeses(){
        String st;
        /* 
        Formato:
        mes/ano/somatoria!mes/ano/somatoria...
        */
        return st="";
    }
}
