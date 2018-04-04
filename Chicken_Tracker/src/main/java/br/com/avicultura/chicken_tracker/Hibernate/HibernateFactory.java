package br.com.avicultura.chicken_tracker.Hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HibernateFactory {

    private static SessionFactory sessionFactory;
    private static final ThreadLocal sessionThread;

    static {
        sessionThread = new ThreadLocal();
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

    public static Session getSession() {
        Session session = (Session) sessionThread.get();
        if (session == null) {
            session = sessionFactory.openSession();
            sessionThread.set(session);
        }
        return session;
    }

    public static void closeSession() {
            Session session = (Session) sessionThread.get();
        sessionThread.set(null);
        if (session != null && session.isOpen()) {
            session.flush();
            session.close();
        }
    }
}
