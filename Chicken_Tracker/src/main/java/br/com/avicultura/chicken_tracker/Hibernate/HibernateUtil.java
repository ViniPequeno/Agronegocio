package br.com.avicultura.chicken_tracker.Hibernate;

import Interfaces.InterfaceDAO;
import org.hibernate.Session;

/**
 *
 * @author Pedro
 * @param <T>
 */
public class HibernateUtil<T> implements InterfaceDAO<T> {

    private Session session;
    private String message = "";

    @Override
    public String salvar(T classe) {
        session = (Session) HibernateFactory.getSession();
        session.beginTransaction();
        try {
            session.save(classe);
            session.getTransaction().commit();
            message = "Salvo!";
        } catch (Exception e) {
            session.getTransaction().rollback();
            message = e.getMessage();
        } finally {
            session.close();
        }
        return message;
    }

    @Override
    public String deletar(T classe) {
        session = (Session) HibernateFactory.getSession();
        session.beginTransaction();
        try {
            this.session.flush();
            this.session.clear();
            session.delete(classe);
            session.getTransaction().commit();
            message = "Salvo!";
        } catch (Exception e) {
            session.getTransaction().rollback();
            message = e.getMessage();
        } finally {
            session.close();
            HibernateFactory.closeSession();
        }
        return message;
    }

    @Override
    public String atualizar(T classe) {
        session = (Session) HibernateFactory.getSession();
        session.beginTransaction();
        try {
            session.update(classe);
            session.getTransaction().commit();
            message = "Salvo!";
        } catch (Exception e) {
            session.getTransaction().rollback();
            message = e.getMessage();
        } finally {
            session.close();
        }
        return message;
    }

}
