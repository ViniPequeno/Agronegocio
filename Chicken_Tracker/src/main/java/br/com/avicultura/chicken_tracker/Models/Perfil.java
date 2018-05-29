package br.com.avicultura.chicken_tracker.Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import static javax.persistence.CascadeType.ALL;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "perfil")
public class Perfil implements Serializable {

    @Id
    private String usuario;
    @Column(unique = true)
    private String nome;
    @Column(unique = true)
    private String email;
    private String senha;

    private String foto;
    private char confirmacaoEmail; //S ou N
    @OneToMany(cascade = ALL, mappedBy = "perfil")
    private List<Negocio> negocios;

    @Transient
    private static Perfil getInstance;

    private Perfil() {
    }

    public static Perfil getInstance() {
        if (getInstance == null) {
            getInstance = new Perfil();
        }
        return getInstance;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public List<Negocio> getNegocios() {
        return negocios;
    }

    public void setNegocios(List<Negocio> negocios) {
        this.negocios = negocios;
    }

    public char getConfirmacaoEmail() {
        return confirmacaoEmail;
    }

    public void setConfirmacaoEmail(char confirmacaoEmail) {
        this.confirmacaoEmail = confirmacaoEmail;
    }

}
