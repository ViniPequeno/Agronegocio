/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Negocio;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaNegocio {

    public static Negocio findById(String id) {
        Session s = HibernateFactory.getSession();
        Negocio n = s.get(Negocio.class, id);
        return n;
    }

    public static List<Negocio> returnList(String usuario) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Negocio n where n.perfil.usuario =:usuario");
        query.setParameter("usuario", usuario);
        List<Negocio> lista = query.getResultList();
        return lista;
    }

    public static String returnValues(Negocio negocio) {
        String a = "";
        a += negocio.getNome() + "#";
        a += negocio.getPerfil().getNome() + "#";
        a += negocio.getEmpresaCNPJ() + "#";
        a += negocio.getLinkEmail() + "#";
        a += negocio.getLinkFacebook()+ "#";
        a += negocio.getLinkInstragram()+ "#";
        for (int i = 0; i < negocio.getTelefones().size(); i++) {
            a += negocio.getTelefones().get(i).getTelefone();
           if(i!= negocio.getTelefones().size()-1){
               a+="&";
           }
        }
        a += "#";
        for (int i = 0; i < negocio.getEstabelecimentos().size(); i++) {
            a += negocio.getEstabelecimentos().get(i).getSufixoCNPJ() + "#";
            a += negocio.getEstabelecimentos().get(i).getCNAE()+ "#";
        }
        a += "*";
        return a;
    }
}
