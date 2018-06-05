var ctxL = document.getElementById("graficoTrintaDiasLucros").getContext('2d');
var ctxLHD = document.getElementById("graficoTrintaDiasLucrosHD").getContext('2d');
var dadosCadaDia = $('#graficoTrintaDiasLucros').data('info').split('!').reverse();
var datas = new Array();
var valores = new Array();
dadosCadaDia.forEach(function (item, indice, array) {
    var data = item.split('/');
    datas.push(data[0] + '/' + data[1] + '/' + data[2]);
    valores.push(parseFloat(data[3]));
});
var chartData = {
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
    };
var chartOpt = {
    title: {
        display: true,
        position: 'top',
        text: ['Período: ' + datas[0] + ' até ' + datas[6]],
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
        text: ['Período: ' + datas[0] + ' até ' + datas[6]],
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
    data:chartData,
    options: chartOptHD
});