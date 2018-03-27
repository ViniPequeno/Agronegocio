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
@Table(name = "perfil")
public class Perfil implements Serializable, Singleton {

    @Id
    private String usuario;
    @Column(unique = true)
    private String nome;
    @Column(unique = true)
    private String email;
    private String senha;
    @Lob
    private byte[] foto;

    @OneToMany(cascade = ALL, mappedBy = "negocio")
    private List<Negocio> negocios;
    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Estabelecimento> estabelecimentos;

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

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public List<Negocio> getNegocios() {
        return negocios;
    }

    public void setNegocios(List<Negocio> negocios) {
        this.negocios = negocios;
    }

    public List<Estabelecimento> getEstabelecimentos() {
        return estabelecimentos;
    }

    public void setEstabelecimentos(List<Estabelecimento> estabelecimentos) {
        this.estabelecimentos = estabelecimentos;
    }

    
}
