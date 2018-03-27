/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;


import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import Interfaces.Singleton;

/**
 *
 * @author User
 */
@Entity
@Table(name = "vacina")
public class Vacina implements Serializable, Singleton {

    @Id
    private int codigo;
    @Column(unique = true)
    private String nome;
    private String descricao;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataRealizada;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataProxima;
    @ManyToOne
    @JoinColumn(name = "estabelecimento_id")
    private Estabelecimento estabelecimento;

    private Vacina() {
    }

    @Transient
    private static Vacina getInstance;

    
    public static Vacina getInstance() {
        if (getInstance == null) {
            getInstance = new Vacina();
        }
        return getInstance;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getDataRealizada() {
        return dataRealizada;
    }

    public void setDataRealizada(Date dataRealizada) {
        this.dataRealizada = dataRealizada;
    }

    public Date getDataProxima() {
        return dataProxima;
    }

    public void setDataProxima(Date dataProxima) {
        this.dataProxima = dataProxima;
    }

    public Estabelecimento getEstabelecimento() {
        return estabelecimento;
    }

    public void setEstabelecimento(Estabelecimento estabelecimento) {
        this.estabelecimento = estabelecimento;
    }

}
