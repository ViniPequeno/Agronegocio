/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Models;

import javax.persistence.*;

@Entity
@Table(name="producao")
public class Producao {
    @Id
    @GeneratedValue
    private Long id;
    private int quantidade;
    private int dia;
    private int mes;
    private int ano;
    
    
    @ManyToOne
    @JoinColumn(name = "estabelecimento_id")
    private Estabelecimento estabelecimento;
    private String negocio;
    
    @ManyToOne
    @JoinColumn(name = "localaves_id")
    private LocalAves localave;
    
    @ManyToOne
    @JoinColumn(name = "´produto_id")
    private Produto produto;
    
    private Producao(){}
    @Transient
    private static Producao getInstance;
    public static Producao getInstance(){
        if(getInstance==null){
            getInstance = new Producao();
        }
        return getInstance;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public Estabelecimento getEstabelecimento() {
        return estabelecimento;
    }

    public void setEstabelecimento(Estabelecimento estabelecimento) {
        this.estabelecimento = estabelecimento;
    }


    public LocalAves getLocalaves() {
        return localave;
    }

    public void setLocalaves(LocalAves localaves) {
        this.localave = localaves;
    }

    public LocalAves getLocalave() {
        return localave;
    }

    public void setLocalave(LocalAves localave) {
        this.localave = localave;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public String getNegocio() {
        return negocio;
    }

    public void setNegocio(String negocio) {
        this.negocio = negocio;
    }
    
    
}
