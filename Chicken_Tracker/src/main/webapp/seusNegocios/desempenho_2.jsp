<%@page import="br.com.avicultura.chicken_tracker.Models.Pagamento"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Pagamento.ConsultaPagamento"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<%
    Negocio n = (Negocio) request.getSession().getAttribute("negocio");
    Estabelecimento e = (Estabelecimento) sessao.getAttribute("estabelecimento");
    if (e == null) {
        e = ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"), n);
        sessao.setAttribute("estabelecimento", e);
    } else if (!e.toString().equals(request.getParameter("estabelecimento"))) {
        e = ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"), n);
        sessao.setAttribute("estabelecimento", e);
    }
    String lucrosSeteDias = ConsultaPagamento.seteDiasLucros(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());
%>
<div class="container">

    <button type="button" id="download-pdf2" >
        Download Higher Quality PDF
    </button>
    <div>
        <canvas style="align-content: center;" id="cool-canvas" data-info="<%=lucrosSeteDias%>"></canvas>
    </div>
    <div style="height:0; width:0; overflow:hidden;">
        <canvas id="supercool-canvas" width="1200" height="600" data-info="<%=lucrosSeteDias%>"></canvas>
    </div>

</div>
<%@include file="../rodape.jsp" %>
<script src="../js/paginacaoTabelas.js"></script>
<script src="../js/Chart.min.js"></script>
<script>
    var ctxL = document.getElementById("cool-canvas").getContext('2d');
    var dadosCadaDia = $('#cool-canvas').data('info').split('!').reverse();
    var datas = new Array();
    var valores = new Array();
    dadosCadaDia.forEach(function (item, indice, array) {
        var data = item.split('/');
        datas.push(data[0] + '/' + data[1] + '/' + data[2]);
        valores.push(parseFloat(data[3]));
    });
    var chart_data = {
        labels: datas,
        datasets: [
            {
                label: "Lucro",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(150,200,0,1)",
                pointColor: "rgba(0,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,0,220,1)",
                borderColor: "rgba(0,250,0,1)",
                pointBackgroundColor: "rgba(0,220,0,1)",
                data: valores
            }
        ]
    };
var chartOpt = {
    responsive: true
};


//original canvas
    var canvas = document.querySelector('#cool-canvas');
    var context = canvas.getContext('2d');

    new Chart(context).Line(chart_data);


//hidden canvas

    var newCanvas = document.querySelector('#supercool-canvas');
    newContext = newCanvas.getContext('2d');

    var supercoolcanvas = new Chart(newContext).Line(chart_data);
    supercoolcanvas.defaults.global = {
        scaleFontSize: 600
    };

//add event listener to 2nd button
    document.getElementById('download-pdf2').addEventListener("click", downloadPDF2);

//download pdf form hidden canvas
    function downloadPDF2() {
        var newCanvas = document.querySelector('#supercool-canvas');

        //create image from dummy canvas
        var newCanvasImg = newCanvas.toDataURL("image/jpeg", 1.0);

        //creates PDF from img
        var doc = new jsPDF('landscape');
        doc.setFontSize(20);
        doc.text(15, 15, "Super Cool Chart");
        doc.addImage(newCanvasImg, 'JPEG', 10, 10, 280, 150);
        doc.save('new-canvas.pdf');
    }
</script>
</body>
</html>
