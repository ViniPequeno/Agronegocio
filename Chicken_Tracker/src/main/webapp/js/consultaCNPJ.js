$(document).ready(function () {
    $("#inputCNPJCompleto").change(function () {

        var cnpj = $(this).val().replace(/\D/g, '');
        if (cnpj != "") {
            $("#inputCNAE").val("...");
            $("#inputNome").val("...");
            $("#inputEmail").val("...");
            $("#inputNomeFantasia").val("...");
            $("#inputCEP").val("...");
            $("#inputEstado").val("...");
            $("#inputCidade").val("...");
            $("#inputBairro").val("...");
            $("#inputRua").val("...");
            $("#inputNumero").val("...");
            $("#inputComplemento").val("...");

            /////////////////////////

            $("#inputCNAE").trigger('change');
            $("#inputNome").trigger('change');
            $("#inputEmail").trigger('change');
            $("#inputNomeFantasia").trigger('change');
            $("#inputCEP").trigger('change');
            $("#inputEstado").trigger('change');
            $("#inputCidade").trigger('change');
            $("#inputBairro").trigger('change');
            $("#inputRua").trigger('change');
            $("#inputNumero").trigger('change');
            $("#inputComplemento").trigger('change');
            $.ajax({
                url: "https://www.receitaws.com.br/v1/cnpj/" + cnpj,
                type: "GET",
                crossDomain: true,
                dataType: 'jsonp',
                success: function (dados) {
                    console.log(dados);
                    console.log(dados.status);
                    var status = dados.status;
                    if (status != "ERROR") {
                        $("#inputCNAE").val(dados.atividade_principal[0].code);
                        if (dados.fantasia != "") {
                            $("#inputNome").val(dados.fantasia);
                        } else {
                            $("#inputNome").val(dados.nome);
                            $("#inputNomeFantasia").val(dados.fantasia);
                        }
                        $("#inputEmail").val(dados.email);
                        $("#inputCEP").val(dados.cep);
                        $("#inputEstado").val(dados.uf);
                        $("#inputCidade").val(dados.municipio);
                        $("#inputBairro").val(dados.bairro);
                        $("#inputRua").val(dados.logradouro);
                        $("#inputNumero").val(dados.numero);
                        $("#inputComplemento").val(dados.complemento);
                    } else {
                        $("#inputCNAE").val("");
                        $("#inputNome").val("");
                        $("#inputEmail").val("");
                        $("#inputNomeFantasia").val("");
                        $("#inputCEP").val("");
                        $("#inputEstado").val("");
                        $("#inputCidade").val("");
                        $("#inputBairro").val("");
                        $("#inputRua").val("");
                        $("#inputNumero").val("");
                        $("#inputComplemento").val("");
                        alert("CNPJ não encontrado.");
                    }
                }, error: function (e) {
                    console.log(e);
                }
            });
        } else {
            //CNPJ é inválido.
            //$("#endereco").val("");
            //alert("Formato de CEP inválido.");

        } //end if.
    });
});


