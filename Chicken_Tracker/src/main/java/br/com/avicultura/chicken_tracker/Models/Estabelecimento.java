package br.com.avicultura.chicken_tracker.Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import static javax.persistence.CascadeType.ALL;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "estabelecimento")
public class Estabelecimento implements Serializable {

    @Id
    private String sufixoCNPJ;
    private String CNAE;
    private String endereco;
    private double saldo;

    @ManyToOne
    @JoinColumn(name = "perfil_id")
    private Perfil perfil;
    
    @ManyToOne
    @JoinColumn(name = "negocio_id")
    private Negocio negocio;
    
    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Produto> produtos;
    
    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Pagamento> pagamentos;
    
    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Fornecimento> fornecimentos;
    
    
    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<EstabelecimentoFuncionario> funcionarios;

    
    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<LocalAves> locais;
    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Vacina> vacinas;

    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Producao> producoes;
    
    
    private Estabelecimento() {
    }

    @Transient
    private static Estabelecimento getInstance;

    public static Estabelecimento getInstance() {
        if (getInstance == null) {
            getInstance = new Estabelecimento();
        }
        return getInstance;
    }

    public String getSufixoCNPJ() {
        return sufixoCNPJ;
    }

    public void setSufixoCNPJ(String sufixoCNPJ) {
        this.sufixoCNPJ = sufixoCNPJ;
    }

    public String getCNAE() {
        return CNAE;
    }

    public void setCNAE(String CNAE) {
        this.CNAE = CNAE;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public Negocio getNegocio() {
        return negocio;
    }

    public void setNegocio(Negocio negocio) {
        this.negocio = negocio;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }

    public List<Fornecimento> getFornecimentos() {
        return fornecimentos;
    }

    public void setFornecimentos(List<Fornecimento> fornecimentos) {
        this.fornecimentos = fornecimentos;
    }

    public List<EstabelecimentoFuncionario> getFuncionarios() {
        return funcionarios;
    }

    public void setFuncionarios(List<EstabelecimentoFuncionario> funcionarios) {
        this.funcionarios = funcionarios;
    }

    public List<LocalAves> getLocais() {
        return locais;
    }

    public void setLocais(List<LocalAves> locais) {
        this.locais = locais;
    }

    public List<Vacina> getVacinas() {
        return vacinas;
    }

    public void setVacinas(List<Vacina> vacinas) {
        this.vacinas = vacinas;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public List<Pagamento> getPagamentos() {
        return pagamentos;
    }

    public void setPagamentos(List<Pagamento> pagamentos) {
        this.pagamentos = pagamentos;
    }

    
}
