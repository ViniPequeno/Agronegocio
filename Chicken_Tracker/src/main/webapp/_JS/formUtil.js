//Inicializa tooltips de botões modal
$(function () {
    $('[data-tooltip="true"]').tooltip();
});

$("td").not(function(){  
        return $("a", this).length != 0;}).click(function(){
    $("#detalhesNegocio").modal();
});