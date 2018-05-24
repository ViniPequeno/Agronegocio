/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import static javax.persistence.CascadeType.ALL;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "negocio")
public class Negocio implements Serializable {

    @Id
    private String empresaCNPJ;

    @Column(unique = true)
    private String nome;
    private String linkFacebook;
    private String userInstagram;
    private String linkEmail;
    private double lucroTotal;
    private String telefone1;
    private String telefone2;
    @ManyToOne
    @JoinColumn(name = "perfil_id")
    private Perfil perfil;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(cascade = ALL, mappedBy = "negocio")
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

    public String getUserInstagram() {
        return userInstagram;
    }

    public void setLinkInstagram(String linkInstagram) {
        this.userInstagram = linkInstagram;
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
    public String getTelefone1() {
        return telefone1;
    }

    public void setTelefone1(String telefone1) {
        this.telefone1 = telefone1;
    }

    public String getTelefone2() {
        return telefone2;
    }

    public void setTelefone2(String telefone2) {
        this.telefone2 = telefone2;
    }

    public double getLucroTotal() {
        return lucroTotal;
    }

    public void setLucroTotal(double lucroTotal) {
        this.lucroTotal = lucroTotal;
    }

}
