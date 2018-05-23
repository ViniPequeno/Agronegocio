function validarCNPJ(cnpj) {

    cnpj = cnpj.replace(/[^\d]+/g, '');

    if (cnpj === '')
        return false;

    if (cnpj.length !== 14)
        return false;

    // Elimina CNPJs invalidos conhecidos
    if (cnpj === "00000000000000" ||
            cnpj === "11111111111111" ||
            cnpj === "22222222222222" ||
            cnpj === "33333333333333" ||
            cnpj === "44444444444444" ||
            cnpj === "55555555555555" ||
            cnpj === "66666666666666" ||
            cnpj === "77777777777777" ||
            cnpj === "88888888888888" ||
            cnpj === "99999999999999")
        return false;

    //validando dv
    var verificadorCNPJ = ["5", "4", "3", "2", "9", "8", "7", "6", "5", "4", "3", "2"];

    cnpjCalculo = cnpj.length - 2;
    numerosCNPJ = cnpj.substring(0, cnpjCalculo);

    soma = 0;

    for (i = cnpjCalculo; i >= 1; i--) {
        soma += numerosCNPJ.charAt(cnpjCalculo - i) * verificadorCNPJ--;
    }

    if (soma % 11 > 2) {
        resultado = 11 - (soma % 11);
    } else {
        resultado = 0;
    }
    if (resultado !== digitosCNPJ.charAt(12))
        return false;

    //verificando o segundo dv
    var verificadorCNPJ2 = ["6", "5", "4", "3", "2", "9", "8", "7", "6", "5", "4", "3", "2"];
    cnpjCalculo = cnpjCalculo + 1;
    numerosCNPJ = cnpj.substring(0, cnpjCalculo);
    soma = 0;

    for (i = cnpjCalculo; i >= 1; i--) {
        soma += numeros.charAt(cnpjCalculo - i) * verificadorCNPJ2--;
    }
    if (soma % 11 > 2) {
        resultado = 11 - (soma % 11);
    } else {
        resultado = 0;
    }
    if (resultado !== digitos.charAt(13))
        return false;

    return true;

}