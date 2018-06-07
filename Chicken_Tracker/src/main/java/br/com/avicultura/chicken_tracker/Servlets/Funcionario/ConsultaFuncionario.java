/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Funcionario;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.EstabelecimentoFuncionario;
import br.com.avicultura.chicken_tracker.Models.Funcionario;
import br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaFuncionario {

    public static Funcionario findById(String id) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        Funcionario f = null;
        try {
            s.beginTransaction();
            f = s.get(Funcionario.class, id);
            s.getTransaction().commit();
            return f;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return f;
    }

    public static List<Funcionario> returnList(String estabelecimentoID) {
        List<Funcionario> lista = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        Long longID = Long.parseLong(estabelecimentoID);
        try {
            s.beginTransaction();
            Query query = s.createQuery("from EstabelecimentoFuncionario ef where "
                    + "ef.estabelecimento.id =:id");
            query.setParameter("id", longID);
             
            List<EstabelecimentoFuncionario> listaEF = query.getResultList();
            s.getTransaction().commit();

            lista = new ArrayList<>();
            for (EstabelecimentoFuncionario ef : listaEF) {
                lista.add(ef.getFuncionario());
            }
            return lista;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return lista;
    }

    public static List<EstabelecimentoFuncionario> returnListFuncionario(String estabelecimentoID) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        List<EstabelecimentoFuncionario> listaEF = null;
        Long longID = Long.parseLong(estabelecimentoID);
        try {
            s.beginTransaction();
            Query query = s.createQuery("from EstabelecimentoFuncionario ef where "
                    + "ef.estabelecimento.id =:id");
            query.setParameter("id", longID);
             
            listaEF = query.getResultList();
            s.getTransaction().commit();
            return listaEF;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return listaEF;
    }

    public static EstabelecimentoFuncionario returnFuncionario(String estabelecimentoID, String f) {
        Session s = HibernateFactory.getSessionFactory().openSession();
        EstabelecimentoFuncionario ef = null;
        Long longID = Long.parseLong(estabelecimentoID);
        try {
            s.beginTransaction();
            Query query = s.createQuery("from EstabelecimentoFuncionario ef where "
                    + "ef.estabelecimento.id =:id and ef.funcionario.CPF=:f");
            query.setParameter("id", longID);
            query.setParameter("f", f);
             
            ef = (EstabelecimentoFuncionario) query.getResultList().get(0);
            s.getTransaction().commit();
            return ef;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
        } finally {
            s.close();
        }
        return ef;
    }

    public static List<Funcionario> returnList() {
        List<Funcionario> lista = null;
        Session s = HibernateFactory.getSessionFactory().openSession();
        try {
            s.beginTransaction();
            Query query = s.createQuery("from Funcionario");
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

    public static String returnValues(Funcionario f, String estabelecimento) {
        String a = "";
        a += f.getCPF() + "#";
        a += f.getNome() + "#";
        a += f.getRG() + "#";
        Estabelecimento e = ConsultaEstabelecimento.findById(estabelecimento);
        for (EstabelecimentoFuncionario ef : e.getFuncionarios()) {
            if (f.getCPF().equals(ef.getFuncionario().getCPF())) {
                a += ef.getCargo() + "#";
                a += ef.getSituacao() + "#";
                a += ef.getSalario() + "#";
            }
        }

        return a;
    }
}
