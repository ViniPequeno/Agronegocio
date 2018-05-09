/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.ServletListener;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent servletContextEvent) {
        HibernateFactory.initSessionFactory();
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        if (HibernateFactory.getSessionFactory().isOpen()) {
            HibernateFactory.closeSession();
        }

    }

}
