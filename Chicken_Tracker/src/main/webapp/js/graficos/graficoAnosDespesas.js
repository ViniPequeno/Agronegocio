var ctxL = document.getElementById("graficoAnosDespesas");
if (ctxL !== null) {
    ctxL = ctxL.getContext('2d');
    var ctxLHD = document.getElementById("graficoAnosDespesasHD").getContext('2d');
    var dadosCadaDia = $('#graficoAnosDespesas').data('info').split('!').reverse();
    var anos = new Array();
    var valores = new Array();
    dadosCadaDia.forEach(function (item, indice, array) {
        var ano = item.split('/');
        anos.push(ano[0]);
        valores.push(parseFloat(ano[1]));
    });
    var chartData = {
        labels: anos,
        color: "rgba(0,0,0,1.0)",
        datasets: [
            {
                label: "Despesas",
                backgroundColor: "rgba(220,220,220,0.2)",
                borderWidth: 2,
                borderColor: "rgba(250,100,0,1)",
                pointBackgroundColor: "rgba(255,255,0,1)",
                pointBorderColor: "#aaa",
                pointBorderWidth: 1,
                pointRadius: 4,
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "rgba(220,0,220,1)",
                data: valores
            }
        ]
    };
    var chartOpt = {
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
    };
    var chartOptHD = {
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
        responsive: false
    };
    var myLineChart = new Chart(ctxL, {
        type: 'line',
        data: chartData,
        options: chartOpt
    });
    var myLineChartHD = new Chart(ctxLHD, {
        type: 'line',
        data: chartData,
        options: chartOptHD
    });
}