/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// Limpa valores do formulário de cep.
function limpa_formulário_cep() {
    $("#inputRua").val("");
    $("#inputBairro").val("");
    $("#inputCidade").val("");
    $("#inputEstado").val("");
}

//Quando o campo cep perde o foco.
function initCEP() {
    $("#inputCEP").blur(function () {

        //Nova variável "cep" somente com dígitos.
        var cep = $(this).val().replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if (validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                $("#inputRua").val("...");
                $("#inputBairro").val("...");
                $("#inputCidade").val("...");
                $("#inputEstado").val("...");

                //Consulta o webservice viacep.com.br/
                $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                    if (!("erro" in dados)) {
                        //Atualiza os campos com os valores da consulta.
                        $("#inputRua").val(dados.logradouro);
                        $("#inputRua").trigger('change');
                        $("#inputBairro").val(dados.bairro);
                        $("#inputBairro").trigger('change');
                        $("#inputCidade").val(dados.localidade);
                        $("#inputCidade").trigger('change');
                        $("#inputEstado").val(dados.uf);
                        $("#inputEstado").trigger('change');
                    } //end if.
                    else {
                        //CEP pesquisado não foi encontrado.
                        limpa_formulário_cep();
                        alert("CEP não encontrado.");
                    }
                });
            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    });
}
$(document).ready(function () {
    initCEP();
});


