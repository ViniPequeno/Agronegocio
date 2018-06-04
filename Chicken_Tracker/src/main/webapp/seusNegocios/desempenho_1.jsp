<%@page import="br.com.avicultura.chicken_tracker.Models.Pagamento"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Pagamento.ConsultaPagamento"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<div class="container">

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
        String despesasSeteDias = ConsultaPagamento.seteDiasDespesas(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());
        String lucrosSeteDias = ConsultaPagamento.seteDiasLucros(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());
        String ganhosSeteDias = ConsultaPagamento.seteDiasGanhos(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());

    %>
    <h2 class="mt-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Desempenho</h2>
    <section>
        <h1 class="mt-5 mb-4">
            �ltimos 7 dias 
            <button class="btn btn-primary" type="button" id="downloadSeteDiasPDF"><i class="fa fa-download mr-1"></i>Baixar PDF</button>
        </h1>
        <div>
            <canvas id="cool-canvas" width="600" height="300"></canvas>
        </div>

        <div style="height:0; width:0; overflow:hidden;">
            <canvas id="supercool-canvas" width="1200" height="600"></canvas>
        </div>

        <button type="button" id="download-pdf" >
            Download PDF
        </button>

        <button type="button" id="download-pdf2" >
            Download Higher Quality PDF
        </button>
    </section>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/paginacaoTabelas.js"></script>
<script src="../js/Chart.min.js"></script>
<script>
    var chart_data = {
        labels: ['Player1', 'Player2', 'Player3', 'Player4'],
        datasets: [
            {
                fillColor: "rgba(6, 118, 152, 0.71)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [20, 34, 15, 64]
            }
        ]
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

//add event listener to button
    document.getElementById('download-pdf').addEventListener("click", downloadPDF);

//donwload pdf from original canvas
    function downloadPDF() {
        var canvas = document.querySelector('#cool-canvas');
        //creates image
        var canvasImg = canvas.toDataURL("image/png", 1.0);

        //creates PDF from img
        var doc = new jsPDF('landscape');
        doc.setFontSize(20);
        doc.text(15, 15, "Cool Chart");
        doc.addImage(canvasImg, 'PNG', 10, 10, 280, 150);
        doc.save('canvas.pdf');
    }

//add event listener to 2nd button
    document.getElementById('download-pdf2').addEventListener("click", downloadPDF2);

//download pdf form hidden canvas
    function downloadPDF2() {
        var newCanvas = document.querySelector('#supercool-canvas');

        //create image from dummy canvas
        var newCanvasImg = newCanvas.toDataURL("image/png", 1.0);

        //creates PDF from img
        var doc = new jsPDF('landscape');
        doc.setFontSize(20);
        doc.text(15, 15, "Super Cool Chart");
        doc.addImage(newCanvasImg, 'PNG', 10, 10, 280, 150);
        doc.save('new-canvas.pdf');
    }
</script>
</body>
</html>
