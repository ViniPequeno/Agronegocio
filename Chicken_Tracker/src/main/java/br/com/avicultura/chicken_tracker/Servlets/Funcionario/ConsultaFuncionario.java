/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Funcionario;

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

    public static Funcionario findById(String id) {
        Session s = HibernateFactory.getSession();
        return s.get(Funcionario.class, id);
    }

    public static List<Funcionario> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Funcionario f where "
                + "f.Estabelecimento.sufixoCNPJ =:estabelecimento");
        query.setParameter("estabelecimento", estabelecimento);
        return query.getResultList();
    }
    
    public static List<Funcionario> returnList() {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Funcionario");
        return query.getResultList();
    }
}
