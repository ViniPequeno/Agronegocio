/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Transforma todas as tuplas em links
for (i = 0; i < document.querySelectorAll('td').length; i++) {
    document.querySelectorAll('td')[i].addEventListener('click', function () {
        window.location.href = this.getAttribute('data-link');
    });
}
//Inicializa tooltips de botões modal
$(function () {
    $('[data-tooltip="true"]').tooltip();
});
