/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaEstabelecimento {

    public static Estabelecimento findById(String id) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Estabelecimento e = null;
        try {
            s.beginTransaction();
            e = s.get(Estabelecimento.class, id);
            s.getTransaction().commit();
            return e;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return e;
    }

    public static List<Estabelecimento> returnListOfNegocio(String negocio) {
        List<Estabelecimento> lista = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Estabelecimento e where e.negocio.empresaCNPJ=:negocio");
            query.setParameter("negocio", negocio);
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

    public static List<Estabelecimento> returnListOfUsuario(String usuario) {
        List<Estabelecimento> lista = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Estabelecimento where perfil.usuario=:usuario");
            query.setParameter("usuario", usuario);
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

    public static List<Estabelecimento> returnList() {
        List<Estabelecimento> lista = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Estabelecimento");
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

    public static String returnValues(Estabelecimento e) {
        String a = "";
        a += e.getNegocio().getNome() + "#";
        a += e.getPerfil().getNome() + "#";
        a += e.getSufixoCNPJ() + "#";
        a += e.getCNAE() + "#";
        a += e.getEndereco() + "#";
        a += e.getFuncionarios().size() + "#";

        return a;
    }
}
