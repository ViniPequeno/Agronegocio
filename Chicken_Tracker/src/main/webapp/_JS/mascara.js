$(document).ready(function () {
    var $seuCampoCpf = $("#inputCPF");
    $seuCampoCpf.mask('000.000.000-00', {reverse: true});
    $seuCampoCpf = $("#inputCNPJ");
    $seuCampoCpf.mask('00.000.000/0000-00', {reverse: true});
    $seuCampoCpf = $("#inputRG");
    $seuCampoCpf.mask('00.000.000-0', {reverse: true});
    $seuCampoCpf = $("#inputCNAE");
    $seuCampoCpf.mask('00000-0/00', {reverse: true});
});


