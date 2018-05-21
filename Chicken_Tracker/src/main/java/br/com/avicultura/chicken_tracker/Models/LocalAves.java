package br.com.avicultura.chicken_tracker.Models;


import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.*;
import static javax.persistence.CascadeType.ALL;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "localaves")
public class LocalAves implements Serializable {

    @Id
    private int codigo;
    private double largura;
    private double comprimento;
    private double area;
    private String dataAbertura;
    @Column(nullable = true)
    private String dataFechamento;
    private int quantidade;
    
    @ManyToOne
    @JoinColumn(name = "estabelecimento_id")
    private Estabelecimento estabelecimento;
    private String negocio;
    
    
    @ManyToOne
    @JoinColumn(name ="produto_id")
    private Produto produto;
    
    @OneToMany(cascade = ALL, mappedBy = "localave")
    private List<Producao> producoes;
    
    private LocalAves() {
    }

    @Transient
    private static LocalAves getInstance;

    
    public static LocalAves getInstance() {
        if (getInstance == null) {
            getInstance = new LocalAves();
        }
        return getInstance;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public double getLargura() {
        return largura;
    }

    public void setLargura(double largura) {
        this.largura = largura;
    }

    public double getComprimento() {
        return comprimento;
    }

    public void setComprimento(double comprimento) {
        this.comprimento = comprimento;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getDataAbertura() {
        return dataAbertura;
    }

    public void setDataAbertura(String dataAbertura) {
        this.dataAbertura = dataAbertura;
    }

    public String getDataFechamento() {
        return dataFechamento;
    }

    public void setDataFechamento(String dataFechamento) {
        this.dataFechamento = dataFechamento;
    }

    public Estabelecimento getEstabelecimento() {
        return estabelecimento;
    }

    public void setEstabelecimento(Estabelecimento estabelecimento) {
        this.estabelecimento = estabelecimento;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public List<Producao> getProducoes() {
        return producoes;
    }

    public void setProducoes(List<Producao> producoes) {
        this.producoes = producoes;
    }

    public String getNegocio() {
        return negocio;
    }

    public void setNegocio(String negocio) {
        this.negocio = negocio;
    }
    
    
    
}
