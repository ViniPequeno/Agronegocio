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
    
    
}
