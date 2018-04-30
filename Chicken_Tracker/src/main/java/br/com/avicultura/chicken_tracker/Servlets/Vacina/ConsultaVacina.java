/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Vacina;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Vacina;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaVacina {

    public static Vacina findById(String id) {
        Session s = HibernateFactory.getSession();
        return s.get(Vacina.class, id);
    }

    public static List<Vacina> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Vacina v where v.estabelecimento.sufixoCNPJ =:estabelecimento");
        query.setParameter("estabelecimento", estabelecimento);
        return query.getResultList();
    }

    public static String returnValues(Vacina v) {
        String a = "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        a += v.getCodigo() + "#";
        a += v.getNome() + "#";
        a += v.getDescricao() + "#";
        a += dateFormat.format(v.getDataRealizada()) + "#";
        a += dateFormat.format(v.getDataProxima()) + "#";
        a += v.getEstabelecimento().getSufixoCNPJ()+ "#";

        return a;
    }
}
