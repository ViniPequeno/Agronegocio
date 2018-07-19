/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('#btnBaixarPDF').click(function () {
    //creates PDF from img
    var tabela = $('#tableDados');
    var doc = new jsPDF('portrait');

    var width = doc.internal.pageSize.width;
    var height = doc.internal.pageSize.height;
    var x = 15, y = 25;
    var columns = [];
    var data = [];
    var totalPagesExp = "{total_pages_count_string}";

    var pageContent = function (data) {
        // HEADER
        doc.setFontSize(20);
        doc.setTextColor(40);
        doc.setFontStyle('normal');
        doc.text(document.title, data.settings.margin.left + 15, 22);

        // FOOTER
        var str = "Página " + data.pageCount;
        // Total page number plugin only available in jspdf v1.0+
        if (typeof doc.putTotalPages === 'function') {
            str = str + " de " + totalPagesExp;
        }
        doc.setFontSize(10);
        var pageHeight = doc.internal.pageSize.height || doc.internal.pageSize.getHeight();
        doc.text(str, data.settings.margin.left, pageHeight - 10);
    };
    $($(tabela).find('thead tr')).each(function () {
        doc.setFontSize(12);
        var linhaAtual = $(this);
        $($(linhaAtual).find('th:not(.check-column)')).each(function () {
            columns.push($(this).text());
        });
    });
    
    $($(tabela).find('tbody tr')).each(function () {
        doc.setFontSize(12);
        var linhaAtual = $(this);
        var dataLine = [];
        $($(linhaAtual).find('td:not(:has(a.btn))')).each(function () {
            dataLine.push($(this).text());
        });
        data.push(dataLine);
    });
    
    doc.autoTable(columns, data, {
        addPageContent: pageContent,
        margin: {top: 30}
    });
    if (typeof doc.putTotalPages === 'function') {
        doc.putTotalPages(totalPagesExp);
    }
    doc.save('lista.pdf');
});

