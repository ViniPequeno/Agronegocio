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
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaProduto {

    public static Produto findById(String id) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Produto p = null;
        Integer intID = Integer.parseInt(id);
        try {
            s.beginTransaction();
            p = s.get(Produto.class, intID);
            s.getTransaction().commit();
            return p;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return p;
    }

    public static List<Produto> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        List<Produto> lista = null;
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Produto p where p.estabelecimento.sufixoCNPJ =:estabelecimento");
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

    public static List<Produto> returnListEstoque(String estabelecimento) {//select do fornecedor
        Session s = HibernateFactory.getSessionFactory().openSession();
        List<Produto> lista = null;
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Produto p where p.estabelecimento.sufixoCNPJ =:estabelecimento and p.tipo = 'E'");
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

    public static List<Produto> returnListProduto(String estabelecimento) {//select do fornecedor
        Session s = HibernateFactory.getSessionFactory().openSession();
        List<Produto> lista = null;
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Produto p where p.estabelecimento.sufixoCNPJ =:estabelecimento and p.tipo = 'P'");
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

    public static String returnValues(Produto p) {
        String a = "";
        a += p.getCodigo() + "#";
        a += p.getNome() + "#";
        a += p.getQuantidadeAtual() + "#";
        a += p.getQuantidadeMinima() + "#";
        a += p.getQuantidadeMaxima() + "#";
        a += p.getDescricao() + "#";
        a += p.getEstabelecimento().getSufixoCNPJ() + "#";
        return a;
    }
}
