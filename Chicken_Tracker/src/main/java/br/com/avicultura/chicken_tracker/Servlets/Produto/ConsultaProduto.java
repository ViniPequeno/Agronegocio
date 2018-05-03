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
        Produto p = s.get(Produto.class,new Integer(id));
        return p;
    }

    public static List<Produto> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Produto p where p.estabelecimento.sufixoCNPJ =:estabelecimento");
        query.setParameter("estabelecimento", estabelecimento);
        List<Produto> lista = query.getResultList();
        return lista;
    }
    
    public static List<Produto> returnListEstoque(String estabelecimento){//select do fornecedor
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Produto p where p.estabelecimento.sufixoCNPJ =:estabelecimento and p.tipo = 'E'");
        query.setParameter("estabelecimento", estabelecimento);
        List<Produto> lista = query.getResultList();
        return lista;
    }
    
    public static List<Produto> returnListProduto(String estabelecimento){//select do fornecedor
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Produto p where p.estabelecimento.sufixoCNPJ =:estabelecimento and p.tipo = 'P'");
        query.setParameter("estabelecimento", estabelecimento);
        List<Produto> lista = query.getResultList();
        return lista;
    }

    public static String returnValues(Produto p) {
        String a = "";
        a += p.getCodigo() + "#";
        a += p.getNome() + "#";
        a += p.getQuantidadeAtual() + "#";
        a += p.getQuantidadeMinima()+ "#";
        a += p.getQuantidadeMaxima()+ "#";
        a += p.getDescricao() + "#";
        a += p.getEstabelecimento().getSufixoCNPJ()+ "#";
        return a;
    }
}
