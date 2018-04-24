package br.com.avicultura.chicken_tracker.Models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author User
 */
@Entity
@Table(name = "fornecimento")
public class Fornecimento implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    private String CNPJ;
    private int quantidade;
    private double pagamento;
    private String vencimento;
    private char tipo;

    @ManyToOne
    @JoinColumn(name = "produto_id")
    private Produto produto;

    @ManyToOne
    @JoinColumn(name = "estabelecimento_id")
    private Estabelecimento estabelecimento;

    private Fornecimento() {
    }

    @Transient
    private static Fornecimento getInstance;

    public static Fornecimento getInstance() {
        if (getInstance == null) {
            getInstance = new Fornecimento();
        }
        return getInstance;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCNPJ() {
        return CNPJ;
    }

    public void setCNPJ(String CNPJ) {
        this.CNPJ = CNPJ;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getPagamento() {
        return pagamento;
    }

    public void setPagamento(double pagamento) {
        this.pagamento = pagamento;
    }

    public String getVencimento() {
        return vencimento;
    }

    public void setVencimento(String vencimento) {
        this.vencimento = vencimento;
    }

    public char getTipo() {
        return tipo;
    }

    public void setTipo(char tipo) {
        this.tipo = tipo;
    }

    public Produto getProdutos() {
        return produto;
    }

    public void setProdutos(Produto produto) {
        this.produto = produto;
    }

    public Estabelecimento getEstabelecimentos() {
        return estabelecimento;
    }

    public void setEstabelecimentos(Estabelecimento estabelecimento) {
        this.estabelecimento = estabelecimento;
    }

}
