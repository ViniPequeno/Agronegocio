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

    public static Fornecimento findById(String id) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = s.createQuery("from Fornecimento f where"
                + " f.CNPJ =: id and tipo = c");
        query.setParameter("id", id);
        Fornecimento f = (Fornecimento)query.getSingleResult();
        return f;
    }

    public static List<Fornecimento> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = s.createQuery("from Fornecimento f where f.estabelecimento.sufixoCNPJ =:estabelecimento"
                + " and tipo = 'c'");
        query.setParameter("estabelecimento", estabelecimento);
        List<Fornecimento> lista = query.getResultList();
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
