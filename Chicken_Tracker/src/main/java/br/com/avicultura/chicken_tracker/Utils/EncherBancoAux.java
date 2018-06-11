/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Utils;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.*;

/**
 *
 * @author vinic
 */
public class EncherBancoAux {

    public EncherBancoAux() {
        Perfil p = Perfil.getInstance();
        Negocio n = Negocio.getInstance();
        Estabelecimento e = Estabelecimento.getInstance();
        EstabelecimentoFuncionario ef = EstabelecimentoFuncionario.getInstance();
        Funcionario f = Funcionario.getInstance();
        Fornecimento f2 = Fornecimento.getInstance();
        LocalAves la = LocalAves.getInstance();
        Pagamento pag = Pagamento.getInstance();
        Producao pro = Producao.getInstance();
        Produto prod = Produto.getInstance();
        Vacina v = Vacina.getInstance();
        HibernateUtil<Perfil> hup = new HibernateUtil<>();
        HibernateUtil<Negocio> hun = new HibernateUtil<>();
        HibernateUtil<Estabelecimento> hue = new HibernateUtil<>();
        HibernateUtil<EstabelecimentoFuncionario> huef = new HibernateUtil<>();
        HibernateUtil<Funcionario> huf = new HibernateUtil<>();
        HibernateUtil<Fornecimento> huf2 = new HibernateUtil<>();
        HibernateUtil<LocalAves> hula = new HibernateUtil<>();
        HibernateUtil<Pagamento> hupag = new HibernateUtil<>();
        HibernateUtil<Producao> hupro = new HibernateUtil<>();
        HibernateUtil<Produto> huprod = new HibernateUtil<>();
        HibernateUtil<Vacina> huv = new HibernateUtil<>();

        p.setUsuario("pedro");
        p.setEmail("pedro@gmail.com");
        p.setNome("Pedro Vinícius");
        p.setSenha("pedro123");
        p.setFoto("../imagensUsuario/pedro.png");
        hup.salvar(p);
        //////////////////////////////////////////////////7
        n.setEmpresaCNPJ("11111111");
        n.setEmail("negocio1@gmail.com");
        n.setLinkFacebook("facebook.com/negocio1");
        n.setLinkInstagram("negocio1");
        n.setLucroTotal(0.0);
        n.setNome("negocio1");
        n.setTelefone1("989879");
        n.setTelefone2("123456");
        n.setPerfil(p);
        hun.salvar(n);
        ////////////////////////////////////////////////////
        e.setCEP("67253-234");
        e.setSufixoCNPJ("132456");
        e.setCNAE("1234567");
        e.setBairro("Distrito");
        e.setCidade("Manaus");
        e.setEstado("Amazonas");
        e.setRua("Rua das Flores Violetas");
        e.setSaldo(10.0);
        e.setNegocio(n);
        hue.salvar(e);
        ////////////////////////////////////////////////////
        f.setCPF("50418263906");
        f.setRG("320023059");
        f.setNome("funcionario1");
        huf.salvar(f);
        ef.setCargo("seila1");
        ef.setFuncionario(f);
        ef.setEstabelecimento(e);
        ef.setSituacao('p');
        ef.setSalario(1000);
        huef.salvar(ef);
        ////////////////////////////////////////////////
        f.setCPF("08953614260");
        f.setRG("189194443");
        f.setNome("funcionario2");
        huf.salvar(f);
        ef.setCargo("seila2");
        ef.setFuncionario(f);
        ef.setEstabelecimento(e);
        ef.setSituacao('r');
        ef.setSalario(5000);
        huef.salvar(ef);
        ///////////////////////////////////////////////////
        prod.setCodigo(11);
        prod.setDescricao("Seila123");
        prod.setEstabelecimento(e);
        prod.setNome("Seila132");
        prod.setQuantidadeMinima(0);
        prod.setQuantidadeAtual(100);
        prod.setQuantidadeMaxima(1000);
        huprod.salvar(prod);
        f2.setCNPJ("1234");
        f2.setPagamento(1000);
        f2.setTipo('V');
        f2.setProduto(prod);
        f2.setEstabelecimento(e);
        f2.setQuantidade(100);
        huf2.salvar(f2);
        ////////////////////////////////////////////////////////////////
        prod.setCodigo(23);
        prod.setDescricao("seila12342");
        prod.setEstabelecimento(e);
        prod.setNome("Seila2332");
        prod.setQuantidadeMinima(0);
        prod.setQuantidadeAtual(100);
        prod.setQuantidadeMaxima(1000);
        huprod.salvar(prod);
        f2.setCNPJ("1234");
        f2.setPagamento(1000);
        f2.setTipo('C');
        f2.setProduto(prod);
        f2.setEstabelecimento(e);
        f2.setQuantidade(100);
        huf2.salvar(f2);
        //////////////////////////////////////////////////////////////////
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(1234);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(2345);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(3456);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(4567);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(26);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(5678);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(26);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(6789);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(25);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(7890);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(25);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(9879);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(24);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(5467);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(24);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(3456);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(23);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(2346);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(23);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(3456);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(22);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(1236);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(22);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(6789);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(21);
        pag.setMes(4);
        pag.setTipo('D');
        pag.setValor(6785);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(21);
        pag.setMes(4);
        pag.setTipo('G');
        pag.setValor(7896);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        ///////////////////////////////////////////////////////////
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(3);
        pag.setTipo('D');
        pag.setValor(9833);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(3);
        pag.setTipo('G');
        pag.setValor(4672);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(2);
        pag.setTipo('D');
        pag.setValor(4672);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(2);
        pag.setTipo('G');
        pag.setValor(4673);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(1);
        pag.setTipo('D');
        pag.setValor(3562);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(1);
        pag.setTipo('G');
        pag.setValor(8753);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(12);
        pag.setTipo('D');
        pag.setValor(4563);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(12);
        pag.setTipo('G');
        pag.setValor(4563);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        ////////////////////////////////////////////////////////////////
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(11);
        pag.setTipo('D');
        pag.setValor(1092);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(10);
        pag.setTipo('G');
        pag.setValor(6753);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(9);
        pag.setTipo('D');
        pag.setValor(8080);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(8);
        pag.setTipo('G');
        pag.setValor(9090);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(7);
        pag.setTipo('D');
        pag.setValor(3421);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(6);
        pag.setTipo('G');
        pag.setValor(2341);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(1224);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(4);
        pag.setTipo('G');
        pag.setValor(1112);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(3);
        pag.setTipo('D');
        pag.setValor(4432);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2017);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(5643);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        /////////////////////////////////////////////////////////////////////
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(20);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(4534);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(20);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(5534);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(19);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(5567);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(19);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(2352);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(18);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(3343);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(18);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(3030);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(17);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(2020);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(17);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(1010);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(16);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(6789);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(16);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(6574);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(15);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(5637);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(15);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(4637);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(14);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(2353);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(14);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(6373);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(13);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(4637);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(13);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(5674);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(12);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(5673);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(12);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(9863);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(11);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(4536);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(11);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(4732);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(10);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(4432);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(10);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(4536);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(9);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(6754);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(9);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(9874);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(8);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(2468);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(8);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(5463);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(7);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(2316);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(7);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(3452);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(6);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(9875);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(6);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(3672);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(5);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(9780);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(5);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(8902);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(4);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(5467);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(4);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(9865);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(3);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(3425);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(3);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(5463);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(2);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(7865);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(2);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(6547);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(1);
        pag.setMes(5);
        pag.setTipo('D');
        pag.setValor(1235);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(1);
        pag.setMes(5);
        pag.setTipo('G');
        pag.setValor(5321);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        ////////////////////////////////////////////////////////
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(30);
        pag.setMes(4);
        pag.setTipo('D');
        pag.setValor(4324);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(30);
        pag.setMes(4);
        pag.setTipo('G');
        pag.setValor(5643);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(29);
        pag.setMes(4);
        pag.setTipo('D');
        pag.setValor(1245);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(29);
        pag.setMes(4);
        pag.setTipo('G');
        pag.setValor(3453);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(4);
        pag.setTipo('D');
        pag.setValor(9879);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(28);
        pag.setMes(4);
        pag.setTipo('G');
        pag.setValor(5646);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(4);
        pag.setTipo('D');
        pag.setValor(2134);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(27);
        pag.setMes(4);
        pag.setTipo('G');
        pag.setValor(4567);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(26);
        pag.setMes(4);
        pag.setTipo('D');
        pag.setValor(8974);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(26);
        pag.setMes(4);
        pag.setTipo('G');
        pag.setValor(4563);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(25);
        pag.setMes(4);
        pag.setTipo('D');
        pag.setValor(7896);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(25);
        pag.setMes(4);
        pag.setTipo('G');
        pag.setValor(5674);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(24);
        pag.setMes(4);
        pag.setTipo('D');
        pag.setValor(4532);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
        
        pag.setAno(2018);
        pag.setDescricao("q");
        pag.setDia(24);
        pag.setMes(4);
        pag.setTipo('G');
        pag.setValor(1234);
        pag.setEstabelecimento(e);
        hupag.salvar(pag);
       
        
    }

}
