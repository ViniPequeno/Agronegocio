//line
Chart.pluginService.register({
    beforeDraw: function (chart, easing) {
        if (chart.config.options.chartArea && chart.config.options.chartArea.backgroundColor) {
            var ctx = chart.chart.ctx;
            var chartArea = chart.chartArea;

            ctx.save();
            ctx.fillStyle = chart.config.options.chartArea.backgroundColor;
            ctx.fillRect(chartArea.left, chartArea.top, chartArea.right - chartArea.left, chartArea.bottom - chartArea.top);
            ctx.restore();
        }
    }
});
var ctxL = document.getElementById("graficoTrintaDiasLucros").getContext('2d');
var dadosCadaDia = $('#graficoTrintaDiasLucros').data('info').split('!').reverse();
var datas = new Array();
var valores = new Array();
dadosCadaDia.forEach(function (item, indice, array) {
    var data = item.split('/');
    datas.push(data[0]+'/'+data[1]+'/'+data[2]);
    valores.push(parseFloat(data[3]));
});
var myLineChart = new Chart(ctxL, {
    type: 'line',
    data: {
        labels: datas,
        color: "rgba(0,0,0,1.0)",
        datasets: [
            {
                label: "Lucro",
                backgroundColor: "rgba(220,220,220,0.2)",
                borderWidth: 2,
                borderColor: "rgba(150,200,0,1)",
                pointBackgroundColor: "rgba(0,220,220,1)",
                pointBorderColor: "#fff",
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
            text: ['Período: '+datas[0]+' até '+datas[6]],
            fontSize: 14
        },
        scales: {
            yAxes: [{
                ticks: {
                    // Include a dollar sign in the ticks
                    callback: function(value, index, values) {
                        return 'R$ ' + value;
                    }
                }
            }]
        },
        responsive: true
    }
});
