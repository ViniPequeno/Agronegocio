$(document).ready(function () {
    $("#inputCPF").mask('000.000.000-00', {reverse: false});
    $("#inputCNPJ, .CNPJ").mask('00.000.000', {reverse: false});
    $("#inputCNPJCompleto , .CNPJCompleto").mask('00.000.000/0000-00', {reverse: false});
    $("#inputSufixoCNPJ").mask('0000-00', {reverse: false});
    $(".sufixoCNPJ").mask('0000-00', {reverse: false});
    $("#inputRG").mask('00.000.000-0', {reverse: false});
    $("#inputCNAE").mask('00000-0/00', {reverse: false});
    $(".CNAE").mask('00000-0/00', {reverse: false});
    $("#inputDataPrimeiraVacina").mask('00/00/0000', {reverse: false});
    $("#inputDataProximaVacina").mask('00/00/0000', {reverse: false});
    $("#inputDataVencimento").mask('00/00/0000', {reverse: false});
    $("#inputDataAbertura").mask('00/00/0000', {reverse: false});
    $("#inputDataFechamento").mask('00/00/0000', {reverse: false});
    $("#inputData").mask('00/00/0000', {reverse: false});
    $(".CEP").mask('00000-000', {reverse: false});
});


