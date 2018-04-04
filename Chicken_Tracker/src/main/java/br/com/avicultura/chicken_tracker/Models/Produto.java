package br.com.avicultura.chicken_tracker.Models;


import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "produto")
public class Produto implements Serializable {

    @Id
    private int codigo;
    @Column(unique = true)
    private String nome;
    private String descricao;
    private int quantidadeAtual;
    private int quantidadeMinima;
    private int quantidadeMaxima;
    @ManyToMany(mappedBy = "produtos")
    private List<Fornecimento> fornecimentos;
    @ManyToOne
    @JoinColumn(name = "estabelecimento_id")
    private Estabelecimento estabelecimento;

    private Produto() {
    }

    @Transient
    private static Produto getInstance;

    
    public static Produto getInstance() {
        if (getInstance == null) {
            getInstance = new Produto();
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

    public int getQuantidadeAtual() {
        return quantidadeAtual;
    }

    public void setQuantidadeAtual(int quantidadeAtual) {
        this.quantidadeAtual = quantidadeAtual;
    }

    public int getQuantidadeMinima() {
        return quantidadeMinima;
    }

    public void setQuantidadeMinima(int quantidadeMinima) {
        this.quantidadeMinima = quantidadeMinima;
    }

    public int getQuantidadeMaxima() {
        return quantidadeMaxima;
    }

    public void setQuantidadeMaxima(int quantidadeMaxima) {
        this.quantidadeMaxima = quantidadeMaxima;
    }

    public List<Fornecimento> getFornecimentos() {
        return fornecimentos;
    }

    public void setFornecimentos(List<Fornecimento> fornecimentos) {
        this.fornecimentos = fornecimentos;
    }

    public Estabelecimento getEstabelecimento() {
        return estabelecimento;
    }

    public void setEstabelecimento(Estabelecimento estabelecimento) {
        this.estabelecimento = estabelecimento;
    }

}
