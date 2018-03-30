/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Hibernate;


import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;


/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author Pedro
 */
public class HibernateFactory {

    public static SessionFactory sessionFactory;
    public static StandardServiceRegistryBuilder builder;
    public static SessionFactory getSessionFactory() {
        if(sessionFactory==null){
            Configuration c = new Configuration().configure();
            
            builder = new StandardServiceRegistryBuilder().applySettings(c.getProperties());
            sessionFactory = c.buildSessionFactory(builder.build());
           
        }
        return sessionFactory;
    }
}
