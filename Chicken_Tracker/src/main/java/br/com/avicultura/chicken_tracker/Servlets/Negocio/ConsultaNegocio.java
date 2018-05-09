/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Negocio;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaNegocio {

    public static Negocio findById(String id) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Negocio n = s.get(Negocio.class, id);
        return n;
    }

    public static List<Negocio> returnListOfPerfil(String usuario) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        List<Negocio> lista = null;
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Negocio n where n.perfil.usuario =:usuario order by n.nome asc");
            query.setParameter("usuario", usuario);
            lista = query.getResultList();
            s.getTransaction().commit();
            return lista;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        }finally{
            s.close();
        }
        return lista;
    }

    public static List<Negocio> returnListBySearch(String search) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = s.createQuery("from Negocio as n where n.nome like :search");
        query.setParameter("search", "%" + search + "%");
        List<Negocio> lista = query.getResultList();
        return lista;
    }

    public static List<Negocio> returnList() {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = s.createQuery("from Negocio");
        List<Negocio> lista = query.getResultList();
        return lista;
    }

    public static String returnValues(Negocio negocio) {
        String a = "";
        a += negocio.getNome() + "#";
        a += negocio.getPerfil().getNome() + "#";
        a += negocio.getEmpresaCNPJ() + "#";
        a += negocio.getLinkEmail() + "#";
        a += negocio.getLinkFacebook() + "#";
        a += negocio.getLinkInstagram() + "#";
        for (int i = 0; i < negocio.getTelefones().size(); i++) {
            a += negocio.getTelefones().get(i).getTelefone();
            if (i != negocio.getTelefones().size() - 1) {
                a += "&";
            }
        }
        a += "#";
        for (int i = 0; i < negocio.getEstabelecimentos().size(); i++) {
            a += negocio.getEstabelecimentos().get(i).getSufixoCNPJ() + "#";
            a += negocio.getEstabelecimentos().get(i).getCNAE() + "#";
        }
        a += "*";
        return a;
    }
}
