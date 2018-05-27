//line
var ctxL = document.getElementById("graficoDozeMesesDespesas").getContext('2d');
var dadosCadaMes = $('#graficoDozeMesesDespesas').data('info').split('!').reverse();;
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
