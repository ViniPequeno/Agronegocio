//line
var ctxL = document.getElementById("graficoDozeMesesGanhos").getContext('2d');
var dadosCadaMes = $('#graficoDozeMesesGanhos').data('info').split('!').reverse();
var datas = new Array();
var valores = new Array();
var meses= new Array("Jan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Sep","Out","Nov","Dez");
dadosCadaMes.forEach(function (item, indice, array) {
    var data = item.split('/');
    var mes = (parseInt(data[0])-1);
    datas.push(meses[mes]+'/'+data[1]);
    valores.push(parseFloat(data[2]));
});
var myLineChart = new Chart(ctxL, {
    type: 'line',
    data: {
        labels: datas,
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
                data:valores
            }
        ]
    },
    options: {
        title: {
            display: true,
            position: 'top',
            text: ['Período: '+datas[0]+' até '+datas[datas.length-1]],
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
