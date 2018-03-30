package com.mycompany.chicken_tracker.Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "funcionario")
public class Funcionario implements Serializable{

    @Id
    private String CPF;
    @Column(unique = true)
    private String RG;
    @Column(unique = true)
    private String nome;
    private String cargo;
    private char situacao;

    @ManyToMany(mappedBy = "funcionarios")
    private List<Estabelecimento> estabelecimentos;

    private Funcionario() {
    }

    @Transient
    private static Funcionario getInstance;

    
    public static Funcionario getInstance() {
        if (getInstance == null) {
            getInstance = new Funcionario();
        }
        return getInstance;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String CPF) {
        this.CPF = CPF;
    }

    public String getRG() {
        return RG;
    }

    public void setRG(String RG) {
        this.RG = RG;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public char getSituacao() {
        return situacao;
    }

    public void setSituacao(char situacao) {
        this.situacao = situacao;
    }

    public List<Estabelecimento> getEstabelecimentos() {
        return estabelecimentos;
    }

    public void setEstabelecimentos(List<Estabelecimento> estabelecimentos) {
        this.estabelecimentos = estabelecimentos;
    }

}
