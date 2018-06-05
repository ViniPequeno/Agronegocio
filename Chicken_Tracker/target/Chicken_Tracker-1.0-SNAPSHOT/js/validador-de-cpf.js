var CPFvalido = false;

function validarCPF(cpfEnviado) {
    cpfEnviado = cpfEnviado.replace(/[^\d]+/g, '');
    if (cpfEnviado == '')
        return false;
    if (cpfEnviado.length != 11)
        return false;

    if (cpfEnviado == "00000000000" || cpfEnviado == "11111111111" || cpfEnviado == "22222222222" || cpfEnviado == "33333333333" || cpfEnviado == "44444444444"
            || cpfEnviado == "55555555555" || cpfEnviado == "66666666666" || cpfEnviado == "77777777777" || cpfEnviado == "88888888888" || cpfEnviado == "99999999999") {
        return false;
    }

    add = 0;
    for (i = 0; i < 9; i ++)
        add += parseInt(cpfEnviado.charAt(i)) * (10 - i);

    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpfEnviado.charAt(9)))
        return false;

    add = 0;
    for (i = 0; i < 10; i ++)
        add += parseInt(cpfEnviado.charAt(i)) * (11 - i);

    rev = 11 - (add % 11);

    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpfEnviado.charAt(10)))
        return false;

    return true;
}
$('#inputCPF').blur(function(){
    CPFvalido = validarCPF($(this).val());
    if(CPFvalido==false && $(this).val()!=""){
        $(this).removeClass('valid');
        $(this).addClass('invalid');
    }
});