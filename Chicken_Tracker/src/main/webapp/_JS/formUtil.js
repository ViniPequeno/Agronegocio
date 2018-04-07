//Inicializa tooltips de botões modal
var id;
$(function () {
    $('[data-tooltip="true"]').tooltip();
});

$("td").not(function () {
    return $("a", this).length != 0;
}).click(function () {
    $("#detalhesNegocio").modal();
    var linha = $(this).closest('tr');
    var celula = $(linha).children('td').eq(0);
    $("#nome").text("Nome: "+celula.text());
    
    celula = $(linha).children('td').eq(1);
    $("#email").text("Email: "+celula.text());
    
    celula = $(linha).children('td').eq(2);
    $("#linkFB").text("Link da página do Facebook: "+celula.text());
    
    celula = $(linha).children('td').eq(3);
    $("#linkInstagram").text("Link da página do Instagram: "+celula.text());
    
    celula = $(linha).children('td').eq(4);
    $("#empresaCNPJ").text("CNPJ da empresa: "+celula.text());
    
    celula = $(linha).children('td').eq(5);
    $("#fone1").text("Fone 1: "+celula.text());
    $("#fone2").text("Fone 2: "+celula.text());
});