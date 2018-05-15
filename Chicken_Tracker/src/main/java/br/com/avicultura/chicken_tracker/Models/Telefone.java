/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Models;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author User
 */
@Entity
@Table(name = "telefone")
public class Telefone implements Serializable{

    @Id
    private String telefone;
    
    @ManyToOne
    @JoinColumn(name = "perfil_id")
    private Negocio negocio;

    private Telefone() {
    }

    @Transient
    private static Telefone getInstance;
    
    public static Telefone getInstance() {
        if (getInstance == null) {
            getInstance = new Telefone();
        }
        return getInstance;
    }
    
    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Negocio getNegocio() {
        return negocio;
    }

    public void setNegocio(Negocio negocio) {
        this.negocio = negocio;
    }

}
