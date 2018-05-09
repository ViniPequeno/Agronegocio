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
        Session s = HibernateFactory.getSessionFactory().openSession();
        Estabelecimento e = s.get(Estabelecimento.class, id);
        return e;
    }

    public static List<Estabelecimento> returnListOfNegocio(String negocio) {
        List<Estabelecimento> lista;
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = s.createQuery("from Estabelecimento e where e.negocio.empresaCNPJ=:negocio");
        query.setParameter("negocio", negocio);
        lista = query.getResultList();
        return lista;
    }

    public static List<Estabelecimento> returnListOfUsuario(String usuario) {
        List<Estabelecimento> lista;
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = s.createQuery("from Estabelecimento where perfil.usuario=:usuario");
        query.setParameter("usuario", usuario);
        lista = query.getResultList();
        return lista;
    }

    public static List<Estabelecimento> returnList() {
        List<Estabelecimento> lista;
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = s.createQuery("from Estabelecimento");
        lista = query.getResultList();
        return lista;
    }

    public static String returnValues(Estabelecimento e) {
        String a = "";
        a += e.getNegocio().getNome() + "#";
        a += e.getPerfil().getNome() + "#";
        a += e.getSufixoCNPJ() + "#";
        a += e.getCNAE() + "#";
        a += e.getEndereco() + "#";
        a += e.getFuncionarios().size()+ "#";

        return a;
    }
}
