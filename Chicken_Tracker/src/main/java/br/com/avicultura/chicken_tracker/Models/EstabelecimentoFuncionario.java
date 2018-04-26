package br.com.avicultura.chicken_tracker.Models;

import javax.persistence.*;

@Entity
@Table(name = "estabelecimentofuncionario")
public class EstabelecimentoFuncionario {
    
    @Id
    @GeneratedValue
    private Long Id;
    
    @ManyToOne
    @JoinColumn(name = "estabelecimento_id")
    private Estabelecimento estabelecimento;
    @ManyToOne
    @JoinColumn(name = "funcionario_id")
    private Funcionario funcionario;
    
    private String cargo;
    private double salario;
    private char situacao;
    
    private EstabelecimentoFuncionario(){}
    @Transient
    private static EstabelecimentoFuncionario getInstance;

    public static EstabelecimentoFuncionario getInstance() {
        if (getInstance == null) {
            getInstance = new EstabelecimentoFuncionario();
        }
        return getInstance;
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long Id) {
        this.Id = Id;
    }

    public Estabelecimento getEstabelecimento() {
        return estabelecimento;
    }

    public void setEstabelecimento(Estabelecimento estabelecimento) {
        this.estabelecimento = estabelecimento;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
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
    
    
    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

}
