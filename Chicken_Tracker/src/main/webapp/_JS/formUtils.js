//Cor do ícone verde ao focar em input
    $('input').focus(function () {
        $(this).prev().removeClass('grey-text');
        $(this).prev().addClass('light-green-text');
    });
    $('input').blur(function () {
        $(this).prev().removeClass('light-green-text');
        $(this).prev().addClass('grey-text');
    });
