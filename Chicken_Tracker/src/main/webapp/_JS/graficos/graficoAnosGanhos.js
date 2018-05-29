//line
var ctxL = document.getElementById("graficoAnosGanhos");
if (ctxL != null) {
    ctxL = ctxL.getContext('2d');
    var dadosCadaDia = $('#graficoAnosGanhos').data('info').split('!').reverse();
    var anos = new Array();
    var valores = new Array();
    dadosCadaDia.forEach(function (item, indice, array) {
        var ano = item.split('/');
        anos.push(ano[0]);
        valores.push(parseFloat(ano[1]));
    });
    var myLineChart = new Chart(ctxL, {
        type: 'line',
        data: {
            labels: anos,
            color: "rgba(0,0,0,1.0)",
            datasets: [
                {
                    label: "Ganhos",
                    backgroundColor: "rgba(220,220,220,0.2)",
                    borderWidth: 2,
                    borderColor: "rgba(0,150,250,1)",
                    pointBackgroundColor: "rgba(0,255,255,1)",
                    pointBorderColor: "#aaa",
                    pointBorderWidth: 1,
                    pointRadius: 4,
                    pointHoverBackgroundColor: "#fff",
                    pointHoverBorderColor: "rgba(220,0,220,1)",
                    data: valores
                }
            ]
        },
        options: {
            title: {
                display: true,
                position: 'top',
                text: ['Período: ' + anos[0] + ' até ' + anos[anos.length - 1]],
                fontSize: 14
            },
            scales: {
                yAxes: [{
                        ticks: {
                            // Include a dollar sign in the ticks
                            callback: function (value, index, values) {
                                return 'R$ ' + value;
                            }
                        }
                    }]
            },
            responsive: true
        }
    });
}