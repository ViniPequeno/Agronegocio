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
initInputs();