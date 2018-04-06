/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Controller;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Funcionario;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaFuncionario {

    public Funcionario findById(String id) {
        Session s = HibernateFactory.getSession();
        return s.get(Funcionario.class, id);
    }

    public List<Funcionario> returnList() {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from funcionario");
        return query.getResultList();
    }
}