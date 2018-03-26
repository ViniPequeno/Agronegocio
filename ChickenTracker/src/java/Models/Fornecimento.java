package Models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.*;
import Interfaces.Singleton;

/**
 *
 * @author User
 */
@Entity
@Table(name = "fornecimento")
public class Fornecimento implements Serializable, Singleton {

    @Id
    private String CNPJ;
    private int quantidade;
    private double pagamento;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date vencimento;
    private char tipo;

    @ManyToMany
    private List<Produto> produtos;
    @ManyToMany(mappedBy = "fornecimentos")
    private List<Estabelecimento> estabelecimentos;

    private Fornecimento() {
    }

    @Transient
    private Fornecimento getInstance;

    @Override
    public Fornecimento getInstance() {
        if (getInstance == null) {
            getInstance = new Fornecimento();
        }
        return getInstance;
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

    public Date getVencimento() {
        return vencimento;
    }

    public void setVencimento(Date vencimento) {
        this.vencimento = vencimento;
    }

    public char getTipo() {
        return tipo;
    }

    public void setTipo(char tipo) {
        this.tipo = tipo;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }

    public List<Estabelecimento> getEstabelecimentos() {
        return estabelecimentos;
    }

    public void setEstabelecimentos(List<Estabelecimento> estabelecimentos) {
        this.estabelecimentos = estabelecimentos;
    }

}
