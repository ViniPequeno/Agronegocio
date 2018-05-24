//line
var ctxL = document.getElementById("graficoSeteDiasDespesas").getContext('2d');
var myLineChart = new Chart(ctxL, {
    type: 'line',
    data: {
        labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho"],
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
                data: [65, 59, 80, 81, 56, 55, 40]
            },
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
                data: [28, 48, 40, 19, 86, 27, 90]
            }
        ]
    },
    options: {
        title: {
            display: true,
            position: 'top',
            text: ['Título'],
            fontSize: 14
        },
        responsive: true
    }
});
