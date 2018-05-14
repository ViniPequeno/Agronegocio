//Cor do ícone verde ao focar em input
function initInputs() {
    $('input').focus(function () {
        $(this).prev().removeClass('grey-text');
        $(this).prev().addClass('green-text');
    });
    $('input').blur(function () {
        $(this).prev().removeClass('green-text');
        $(this).prev().addClass('grey-text');
    });
}

$('.proprietario').each(function () {
    var nome = $(this).html().split(" ");
    $(this).html(nome[0] + " " + nome[1]);
});
initInputs();