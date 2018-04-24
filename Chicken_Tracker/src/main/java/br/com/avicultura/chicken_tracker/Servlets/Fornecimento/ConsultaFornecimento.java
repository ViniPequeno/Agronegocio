/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Fornecimento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Fornecimento;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaFornecimento {

    public static Fornecimento findById(String id, String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Fornecimento f where f.estabelecimento.sufixoCNPJ =:estabelecimento"
                + " and e.CNPJ=:id and tipo = v");
        query.setParameter("estabelecimento", estabelecimento);
        query.setParameter("id", id);
        return (Fornecimento) query.getSingleResult();
    }

    public static List<Fornecimento> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Fornecimento f where f.estabelecimento.sufixoCNPJ =:estabelecimento and tipo='v'");
        query.setParameter("estabelecimento", estabelecimento);
        return query.getResultList();
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
