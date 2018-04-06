package br.com.avicultura.chicken_tracker.Models;


import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

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
    private String funcao;
    private String dataAbertura;
    private String dataFechamento;
    
    @ManyToOne
    @JoinColumn(name = "Estabelecimento_id")
    private Estabelecimento estabelecimento;

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

    public String getFuncao() {
        return funcao;
    }

    public void setFuncao(String funcao) {
        this.funcao = funcao;
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

}