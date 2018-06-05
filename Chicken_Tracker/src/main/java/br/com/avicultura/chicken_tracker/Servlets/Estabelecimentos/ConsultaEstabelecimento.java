/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.Pagamento;
import java.util.ArrayList;
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
        Long longID = Long.parseLong(id);
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Estabelecimento e where e.id =:id");
            query.setParameter("id", longID);
            e = (Estabelecimento) query.getSingleResult();
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
        List<Pagamento> list = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Estabelecimento e where e.negocio.empresaCNPJ=:negocio");
            query.setParameter("negocio", negocio);
            lista = query.getResultList();
            s.getTransaction().commit();
        } catch (HibernateException e) {
            lista = null;
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

    public static List<Pagamento> returnDespesas(String estabelecimento, int tipo, int tempo) {
        // 1 - 7 dias
        // 2 - 30 dias
        // 3 - Anos - tempo
        // 4 tempo
        List<Pagamento> lista = null;
        List<Pagamento> list = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = null;
        String codigo = "";
        try {
            s.beginTransaction();
            switch (tipo) {
                case 1:
                    codigo = "from Pagamento p where p.estabelecimento=: establecimento and tipo = D order by ano desc, "
                            + "mes desc, dia desc limit 7";
                    query = s.createQuery(codigo);
                    query.setParameter("estabelecimnento", estabelecimento);
                    lista = query.getResultList();
                    break;
                case 2:
                    codigo = "from Pagamento p where p.estabelecimento=: establecimento and tipo = D order by ano desc, "
                            + "mes desc, dia desc limit 30";
                    query = s.createQuery(codigo);
                    query.setParameter("estabelecimnento", estabelecimento);
                    lista = query.getResultList();
                    break;
                case 3:
                    codigo = "from Pagamento p where p.estabelecimento=: establecimento and tipo = D order by ano desc, "
                            + "mes desc, dia desc";
                    query = s.createQuery(codigo);
                    query.setParameter("estabelecimnento", estabelecimento);
                    list = query.getResultList();
                    for (int i = 0; i < lista.size(); i += tempo) {
                        lista.add(list.get(i));
                    }
                    break;
                default:
                    break;
            }
            s.getTransaction().commit();
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return lista;
    }
    
    
        /* 
        
        Formato:
        dia/mes/ano/somatoria!dia/mes/ano/somatoria...
        */

    public static List<Pagamento> returnGanhos(String estabelecimento, int tipo, int tempo) {
        // 1 - 7 dias
        // 2 - 30 dias
        // 3 - Anos - tempo
        // 4 tempo
        List<Pagamento> lista = null;
        List<Pagamento> list = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        Query query = null;
        String codigo = "";
        try {
            s.beginTransaction();
            switch (tipo) {
                case 1:
                    codigo = "from Pagamento p where p.estabelecimento=: establecimento and tipo = G order by ano desc, "
                            + "mes desc, dia desc limit 7";
                    query = s.createQuery(codigo);
                    query.setParameter("estabelecimnento", estabelecimento);
                    lista = query.getResultList();
                    break;
                case 2:
                    codigo = "from Pagamento p where p.estabelecimento=: establecimento and tipo = G order by ano desc, "
                            + "mes desc, dia desc limit 30";
                    query = s.createQuery(codigo);
                    query.setParameter("estabelecimnento", estabelecimento);
                    lista = query.getResultList();
                    break;
                case 3:
                    codigo = "from Pagamento p where p.estabelecimento=: establecimento and tipo = G order by ano desc, "
                            + "mes desc, dia desc";
                    query = s.createQuery(codigo);
                    query.setParameter("estabelecimnento", estabelecimento);
                    list = query.getResultList();
                    for (int i = 0; i < lista.size(); i += tempo) {
                        lista.add(list.get(i));
                    }
                    break;
                default:
                    break;
            }
            s.getTransaction().commit();
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return lista;
    }

    public static List<Double> returnLucro(String estabelecimento, int tipo, int tempo) {
        // 1 - 7 dias
        // 2 - 30 dias
        // 3 - Anos - tempo
        // 4 tempo
        List<Pagamento> listaDespesa = returnDespesas(estabelecimento, tipo, tempo);
        List<Pagamento> listaGanho = returnGanhos(estabelecimento, tipo, tempo);
        List<Double> listaLucro = new ArrayList<>();
        for (int i = 0; i < listaGanho.size(); i++) {
            listaLucro.add(listaGanho.get(i).getValor() - listaDespesa.get(i).getValor());
        }
        return listaLucro;
    }

    public static String returnValues(Estabelecimento e) {
        String a = "";
        a += e.getNegocio().getNome() + "#";
        a += e.getNegocio().getPerfil().getNome()+ "#";
        a += e.getSufixoCNPJ() + "#";
        a += e.getCNAE() + "#";
        a += e.getCEP()+ "#";
        a += e.getRua()+ "#";
        a += e.getBairro()+ "#";
        a += e.getCidade()+ "#";
        a += e.getEstado()+ "#";
        a += e.getFuncionarios().size() + "#";

        return a;
    }
}
