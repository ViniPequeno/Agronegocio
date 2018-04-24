package br.com.avicultura.chicken_tracker.Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "funcionario")
public class Funcionario implements Serializable {

    @Id
    private String CPF;
    @Column(unique = true)
    private String RG;
    @Column(unique = true)
    private String nome;
    private String cargo;
    private double salario;
    private char situacao;

    @ManyToMany(mappedBy = "funcionario")
    private List<EstabelecimentoFuncionario> estabelecimentos;

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

    public List<EstabelecimentoFuncionario> getEstabelecimentos() {
        return estabelecimentos;
    }

    public void setEstabelecimentos(List<EstabelecimentoFuncionario> estabelecimentos) {
        this.estabelecimentos = estabelecimentos;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

}
