/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('#btnBaixarPDF').click(function () {
    //creates PDF from img
    var tabela = $('#tableDados');
    var doc = new jsPDF('portrait');
    doc.setFontSize(20);
    doc.text(15, 15, "Lista");

    var width = doc.internal.pageSize.width;
    var height = doc.internal.pageSize.height;
    var x= 15 ,y = 20;

    $($(tabela).find('tbody tr')).each(function () {
        doc.setFontSize(12);
        var linhaAtual = $(this);
        var dados = "";
        $($(linhaAtual).find('td:not(:has(a.btn))')).each(function () {
            dados += $(this).text() + " ";
        });
        var splitTitle = doc.splitTextToSize(dados, 180);
        doc.text(x, y, splitTitle);
        y+=8;
    });
    doc.save('lista.pdf');
});

