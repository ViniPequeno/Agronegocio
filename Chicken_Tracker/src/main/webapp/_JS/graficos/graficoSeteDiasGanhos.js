//line
var ctxL = document.getElementById("graficoSeteDiasGanhos").getContext('2d');
var dadosCadaDia = $('#graficoSeteDiasGanhos').data('info').split('!');
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
        labels: [datas[6], datas[5], datas[4], datas[3], datas[2], datas[1], datas[0]],
        color: "rgba(0,0,0,1.0)",
        datasets: [
            {
                label: "Ganhos",
                backgroundColor: "rgba(220,220,220,0.2)",
                borderWidth: 2,
                borderColor: "rgba(250,100,0,1)",
                pointBackgroundColor: "rgba(255,255,0,1)",
                pointBorderColor: "#aaa",
                pointBorderWidth: 1,
                pointRadius: 4,
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "rgba(220,0,220,1)",
                data: [valores[6], valores[5], valores[4], valores[3], valores[2], valores[1], valores[0]]
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
        responsive: true
    }
});
