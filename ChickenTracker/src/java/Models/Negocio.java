/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import Interfaces.Singleton;
import static javax.persistence.CascadeType.ALL;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "negocio")
public class Negocio implements Serializable, Singleton {

    @Id
    private String empresaCNPJ;
    @Column(unique = true)
    private String nome;
    private String linkFacebook;
    private String linkInstragram;
    private String linkEmail;
    @OneToMany(cascade = ALL, mappedBy = "negocio")
    private List<String> telefones;

    @ManyToOne
    @JoinColumn(name = "perfil_id")
    private Perfil perfil;
    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Estabelecimento> estabelecimentos;

    private Negocio() {
    }

    @Transient
    private static Negocio getInstance;

    
    public static Negocio getInstance() {
        if (getInstance == null) {
            getInstance = new Negocio();
        }
        return getInstance;
    }

    public String getEmpresaCNPJ() {
        return empresaCNPJ;
    }

    public void setEmpresaCNPJ(String empresaCNPJ) {
        this.empresaCNPJ = empresaCNPJ;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLinkFacebook() {
        return linkFacebook;
    }

    public void setLinkFacebook(String linkFacebook) {
        this.linkFacebook = linkFacebook;
    }

    public String getLinkInstragram() {
        return linkInstragram;
    }

    public void setLinkInstragram(String linkInstragram) {
        this.linkInstragram = linkInstragram;
    }

    public String getLinkEmail() {
        return linkEmail;
    }

    public void setLinkEmail(String linkEmail) {
        this.linkEmail = linkEmail;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public List<Estabelecimento> getEstabelecimentos() {
        return estabelecimentos;
    }

    public void setEstabelecimentos(List<Estabelecimento> estabelecimentos) {
        this.estabelecimentos = estabelecimentos;
    }

    public List<String> getTelefones() {
        return telefones;
    }

    public void setTelefones(List<String> telefones) {
        this.telefones = telefones;
    }

}
