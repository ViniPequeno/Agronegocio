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
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaEstabelecimento {

    public static Estabelecimento findById(String id) {
        Session s = HibernateFactory.getSession();
        return s.get(Estabelecimento.class, id);
    }

    public static List<Estabelecimento> returnListOfNegocio(String negocio) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Estabelecimento e where e.negocio.empresaCNPJ=:negocio");
        query.setParameter("negocio", negocio);
        return query.getResultList();
    }

    public static List<Estabelecimento> returnListOfUsuario(String usuario) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Estabelecimento where perfil.usuario=:usuario");
        query.setParameter("usuario", usuario);
        return query.getResultList();
    }
    
    public static List<Estabelecimento> returnList() {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Estabelecimento");
        return query.getResultList();
    }
}
