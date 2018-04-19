//Inicializa tooltips de botões modal
$(function () {
    $('[data-tooltip="true"]').tooltip();
});


$(document).ready(function () {
    var rowsShown = 2;
    var rowsTotal = $('#tableDados tbody tr').length;
    var numPages = rowsTotal / rowsShown;
    for (i = 0; i < numPages; i++) {
        var pageNum = i + 1;
        $('#next').before('<li class="page-item number"><a class="page-link" rel="' + i + '">' + pageNum + '</a></li> ');
    }
    $('#tableDados tbody tr').hide();
    $('#tableDados tbody tr').slice(0, rowsShown).show();
    $('#pg-link li:nth-child(3)').addClass('active');

    //Quando clicar em algum índice de página da tabela
    $('#pg-link li.number').bind('click', function () {
        navigationButtons($(this),numPages);
        $('#pg-link li').removeClass('active');
        $(this).addClass('active');
        var currPage = $(this).children('a').attr('rel');
        var startItem = currPage * rowsShown;
        var endItem = startItem + rowsShown;
        $('#tableDados tbody tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                css('display', 'table-row').animate({opacity: 1}, 300);
    });

    //Quando clicar no botão de última página da tabela
    $('#last-item').bind('click', function () {
        $('#first-item').removeClass('disabled');
        $('#previous').removeClass('disabled');
        $('#last-item').addClass('disabled');
        $('#next').addClass('disabled');
        $('#pg-link li').removeClass('active');
        $('#pg-link li.number:last').addClass('active');
        var currPage = $('#pg-link li.number:last').children('a').attr('rel');
        var startItem = currPage * rowsShown;
        var endItem = startItem + rowsShown;
        $('#tableDados tbody tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                css('display', 'table-row').animate({opacity: 1}, 300);
    });

    //Quando clicar no botão de primeira página da tabela
    $('#first-item').bind('click', function () {
        $('#last-item').removeClass('disabled');
        $('#next').removeClass('disabled');
        $('#first-item').addClass('disabled');
        $('#previous').addClass('disabled');
        $('#pg-link li').removeClass('active');
        $('#pg-link li.number:first').addClass('active');
        var currPage = $('#pg-link li.number:first').children('a').attr('rel');
        var startItem = currPage * rowsShown;
        var endItem = startItem + rowsShown;
        $('#tableDados tbody tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                css('display', 'table-row').animate({opacity: 1}, 300);
    });
    
    
    //Quando clicar no botão de próxima página da tabela
    $('#next').bind('click', function () {
        $('#pg-link li.active').next().addClass('active');
        $('#pg-link li.active:first').removeClass('active');

        navigationButtons($('#pg-link li.active'),numPages);

        var currPage = $('#pg-link li.active').children('a').attr('rel');
        var startItem = currPage * rowsShown;
        var endItem = startItem + rowsShown;
        $('#tableDados tbody tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                css('display', 'table-row').animate({opacity: 1}, 300);
    });

    //Quando clicar no botão de página anterior da tabela
    $('#previous').bind('click', function () {
        $('#pg-link li.active').prev().addClass('active');
        $('#pg-link li.active:last').removeClass('active');
        
        navigationButtons($('#pg-link li.active'),numPages);

        var currPage = $('#pg-link li.active').children('a').attr('rel');
        var startItem = currPage * rowsShown;
        var endItem = startItem + rowsShown;
        $('#tableDados tbody tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                css('display', 'table-row').animate({opacity: 1}, 300);
    });
});

function navigationButtons(element, numPages) {
    if ($(element).text() == '1') {
        $('#first-item').addClass('disabled');
        $('#previous').addClass('disabled');
    } else {
        $('#first-item').removeClass('disabled');
        $('#previous').removeClass('disabled');
    }
    if ($(element).text() == (Math.ceil(numPages))) {
        $('#last-item').addClass('disabled');
        $('#next').addClass('disabled');
    } else {
        $('#last-item').removeClass('disabled');
        $('#next').removeClass('disabled');
    }
}