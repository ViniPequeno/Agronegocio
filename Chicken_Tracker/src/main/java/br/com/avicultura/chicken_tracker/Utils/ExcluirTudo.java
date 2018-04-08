/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Utils;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ExcluirTudo<T> {
    
    public boolean excluirTudo(List<T> lista) {
        Session s = HibernateFactory.getSession();
        for (T t : lista) {
            s.delete(t);
        }
        
        return false;
    }
}
