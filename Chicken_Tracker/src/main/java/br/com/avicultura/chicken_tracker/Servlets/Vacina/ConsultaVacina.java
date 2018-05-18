/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Vacina;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Vacina;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaVacina {

    public static Vacina findById(String id) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Vacina v = null;
        try {
            s.beginTransaction();
            v = s.get(Vacina.class, id);
            s.getTransaction().commit();
            return v;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return v;
    }

    public static List<Vacina> returnList(String estabelecimento) {
        List<Vacina> lista = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Vacina v where v.estabelecimento.sufixoCNPJ =:estabelecimento");
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

    public static String returnValues(Vacina v) {
        String a = "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        a += v.getCodigo() + "#";
        a += v.getNome() + "#";
        a += v.getDescricao() + "#";
        a += dateFormat.format(v.getDataRealizada()) + "#";
        a += dateFormat.format(v.getDataProxima()) + "#";
        a += v.getEstabelecimento().getSufixoCNPJ()+ "#";

        return a;
    }
}
