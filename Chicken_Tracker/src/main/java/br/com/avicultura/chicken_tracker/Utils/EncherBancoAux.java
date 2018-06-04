/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Utils;

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
    }

}
