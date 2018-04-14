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
        add += parseInt(cpf.charAt(i)) * (10 - i);

    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpf.charAt(9)))
        return false;

    add = 0;
    for (i = 0; i < 10; i ++)
        add += parseInt(cpf.charAt(i)) * (11 - i);

    rev = 11 - (add % 11);

    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpf.charAt(10)))
        return false;

    return true;
}

function validateForm() {
    var name =  document.getElementById('inputNome').value;
    if (name == "") {
        document.getElementById('status').innerHTML = "Name cannot be empty";
        return false;
    }
    var email =  document.getElementById('inputCPF').value;
    if (email == "") {
        document.getElementById('status').innerHTML = "Email cannot be empty";
        return false;
    } else {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(!re.test(email)){
            document.getElementById('status').innerHTML = "Email format invalid";
            return false;
        }
    }
    var subject =  document.getElementById('inputCargo').value;
    if (subject == "") {
        document.getElementById('status').innerHTML = "Subject cannot be empty";
        return false;
    }
    var message =  document.getElementById('inputSituacao').value;
    if (message == "") {
        document.getElementById('status').innerHTML = "Message cannot be empty";
        return false;
    }
    document.getElementById('status').innerHTML = "Sending...";
    document.getElementById('funcio').submit();

}