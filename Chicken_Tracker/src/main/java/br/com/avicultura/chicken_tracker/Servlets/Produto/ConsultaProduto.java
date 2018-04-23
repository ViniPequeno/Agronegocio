/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Produto;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Produto;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaProduto {

    public static Produto findById(String id) {
        Session s = HibernateFactory.getSession();
        return s.get(Produto.class, id);
    }

    public static List<Produto> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Produto p where p.Estabelecimento.sufixoCNPJ =:estabelecimento");
        query.setParameter("estabelecimento", estabelecimento);
        return query.getResultList();
    }

    public static String returnValues(Produto p) {
        String a = "";
        a += p.getCodigo() + "#";
        a += p.getNome() + "#";
        a += p.getQuantidadeAtual() + "#";
        a += p.getQuantidadeMinima()+ "#";
        a += p.getQuantidadeMaxima()+ "#";
        a += p.getDescricao() + "#";
        a += p.getEstabelecimento().getCNAE()+ "#";
        return a;
    }
}
