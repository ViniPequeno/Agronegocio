$(document).ready(function () {
    var $seuCampoCpf = $("#inputCPF");
    $seuCampoCpf.mask('000.000.000-00', {reverse: false});
    $seuCampoCpf = $("#inputCNPJ");
    $seuCampoCpf.mask('00.000.000', {reverse: false});
    $seuCampoCpf = $("#inputSufixoCNPJ");
    $seuCampoCpf.mask('0000-00', {reverse: false});
    $seuCampoCpf = $("#inputRG");
    $seuCampoCpf.mask('00.000.000-0', {reverse: false});
    $seuCampoCpf = $("#inputCNAE");
    $seuCampoCpf.mask('00000-0/00', {reverse: false});
    $('#inputSalario').mask("R$ 000.000.000.000.000,00", {reverse: false});
});


