/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecedor;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Fornecimento;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaFornecedores {

    public static Fornecimento findById(String estabelecimento, String id) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Fornecimento f where  f.Estabelecimento.sufixoCNPJ =:estabelecimento"
                + " and f.CNPJ =: id and tipo = c");
        query.setParameter("estabelecimento", estabelecimento);
        query.setParameter("CNPJ", id);
        return (Fornecimento) query.getSingleResult();
    }

    public static List<Fornecimento> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Fornecimento f where  f.Estabelecimento.sufixoCNPJ =:estabelecimento"
                + " and tipo = c");
        query.setParameter("estabelecimento", estabelecimento);
        return query.getResultList();
    }
}
