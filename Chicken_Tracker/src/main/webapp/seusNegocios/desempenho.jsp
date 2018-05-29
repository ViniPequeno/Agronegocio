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
        String despesasTrintaDias = ConsultaPagamento.trintaDiasDespesas(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());
        String lucrosTrintaDias = ConsultaPagamento.trintaDiasLucros(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());
        String ganhosTrintaDias = ConsultaPagamento.trintaDiasGanhos(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());
        String despesasDozeMeses = ConsultaPagamento.dozeMesesDespesas(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());
        String lucrosDozeMeses = ConsultaPagamento.dozeMesesLucros(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());
        String ganhosDozeMeses = ConsultaPagamento.dozeMesesGanhos(((Estabelecimento) sessao.getAttribute("estabelecimento")).getId());
        String despesasAnos = (String) sessao.getAttribute("anosDespesas");
        String ganhosAnos = (String) sessao.getAttribute("anosGanhos");
        String lucrosAnos = (String) sessao.getAttribute("anosLucros");
    %>
    <h2 class="mt-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Desempenho</h2>
    <section>
        <h1 class="mt-5 mb-4">
            Últimos 7 dias 
            <button class="btn btn-primary" type="button" id="downloadSeteDiasPDF"><i class="fa fa-download mr-1"></i>Baixar PDF</button>
        </h1>

        <div class="card border-light">
            <div class="card-header">
                Lucro dos últimos sete dias
            </div>
            <div class="card-body">
                <canvas style="align-content: center;" id="graficoSeteDiasLucros" data-info="<%=lucrosSeteDias%>"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Despesas dos últimos sete dias
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoSeteDiasDespesas" data-info="<%=despesasSeteDias%>"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Ganhos dos últimos sete dias
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoSeteDiasGanhos" data-info="<%=ganhosSeteDias%>"></canvas>
                        <div style="height:0; width:0; overflow:hidden;">
                            <canvas id="graficoSeteDiasGanhosHD" data-info="<%=ganhosSeteDias%>" width="1200" height="600"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <h1 class="mt-5 mb-4">
            Últimos 30 dias
            <button class="btn btn-primary" type="button" id="downloadTrintaDiasPDF"><i class="fa fa-download mr-1"></i>Baixar PDF</button>
        </h1>
        <div class="card border-light">
            <div class="card-header">
                Lucro dos últimos trinta dias
            </div>
            <div class="card-body">
                <canvas style="align-content: center;" id="graficoTrintaDiasLucros" data-info="<%=lucrosTrintaDias%>"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Despesas dos últimos trinta dias
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoTrintaDiasDespesas" data-info="<%=despesasTrintaDias%>"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Ganhos dos últimos trinta dias
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoTrintaDiasGanhos" data-info="<%=ganhosTrintaDias%>"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <h1 class="mt-5 mb-4">
            Últimos 12 meses
            <button class="btn btn-primary" type="button" id="downloadDozeMesesPDF"><i class="fa fa-download mr-1"></i>Baixar PDF</button>
        </h1>
        <div class="card border-light">
            <div class="card-header">
                Lucro dos últimos doze meses
            </div>
            <div class="card-body">
                <canvas style="align-content: center;" id="graficoDozeMesesLucros" data-info="<%=lucrosDozeMeses%>"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Despesas dos últimos doze meses
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoDozeMesesDespesas" data-info="<%=despesasDozeMeses%>"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Ganhos dos últimos doze meses
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoDozeMesesGanhos" data-info="<%=ganhosDozeMeses%>"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="graficosAnos">
        <h1 class="mt-5 mb-4">Últimos anos</h1>
        <form action="/Chicken_Tracker/PagamentoServlet" method="get" class="form-inline mb-2">
            <label class="mr-3" for="inputDataInicio">Escolha o ano de início</label>
            <input class="form-control mr-3" type="number" name="inputDataInicio" id="inputDataInicio" required min="1950">
            <input type="hidden" name="inputEstabelecimentoID" value="<%=e.getId()%>">
            <button class="btn btn-primary" type="submit"><i class="fa fa-search mr-1"></i>Pesquisar</button>
        </form>
        <%if (lucrosAnos != null) {%>
        <div class="card border-light">
            <div class="card-header">
                Lucro dos últimos anos
            </div>
            <div class="card-body">
                <canvas style="align-content: center;" id="graficoAnosLucros" data-info="<%=lucrosAnos%>"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Despesas dos últimos anos
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoAnosDespesas" data-info="<%=despesasAnos%>"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Ganhos dos últimos anos
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoAnosGanhos" data-info="<%=ganhosAnos%>"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="card border-light">
            <div class="card-header">
                Gráficos dos últimos n anos
            </div>
            <div class="card-body">
                <h2 class="my-5 ml-5">Insira um período de tempo</h2>
            </div>
        </div>

        <%}%>
    </section>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/paginacaoTabelas.js"></script>
<script src="../_JS/graficos/graficoAnosLucros.js"></script>
<script src="../_JS/graficos/graficoAnosGanhos.js"></script>
<script src="../_JS/graficos/graficoAnosDespesas.js"></script>
<script src="../_JS/graficos/graficoSeteDiasLucros.js"></script>
<script src="../_JS/graficos/graficoSeteDiasDespesas.js"></script>
<script src="../_JS/graficos/graficoSeteDiasGanhos.js"></script>
<script src="../_JS/graficos/graficoDozeMesesLucros.js"></script>
<script src="../_JS/graficos/graficoDozeMesesDespesas.js"></script>
<script src="../_JS/graficos/graficoDozeMesesGanhos.js"></script>
<script src="../_JS/graficos/graficoTrintaDiasLucros.js"></script>
<script src="../_JS/graficos/graficoTrintaDiasDespesas.js"></script>
<script src="../_JS/graficos/graficoTrintaDiasGanhos.js"></script>
<script>
    var dataAtual = new Date();
    $('#inputDataInicio').attr('max', dataAtual.getFullYear() - 1);
    //if ($('#inputDataInicio').val() == "")
    //    alert('oi');

    //add event listener to button
    document.getElementById('downloadSeteDiasPDF').addEventListener("click", downloadSeteDiasPDF);

//donwload pdf from original canvas
    function downloadSeteDiasPDF() {
        //creates PDF from img
        var doc = new jsPDF('portrait');
        doc.setFontSize(20);
        doc.text(15, 15, "Gráficos dos últimos 7 dias");

        var width = doc.internal.pageSize.width;
        var height = doc.internal.pageSize.height;

        var canvas = document.querySelector('#graficoSeteDiasLucros');
        //creates image
        var canvasImg = canvas.toDataURL("image/png", 1.0);
        doc.addImage(canvasImg, 'PNG', 10, 20, 182, 97.5);

        canvas = document.querySelector('#graficoSeteDiasDespesas');
        //creates image
        canvasImg = canvas.toDataURL("image/png", 1.0);
        doc.addImage(canvasImg, 'PNG', 10, 127.5, 182, 97.5);

        canvas = document.querySelector('#graficoSeteDiasGanhos');
        //creates image
        canvasImg = canvas.toDataURL("image/png", 1.0);
        doc.addImage(canvasImg, 'PNG', 10, 235, 182, 97.5);

        doc.save('graficos.pdf');
    }

    document.getElementById('downloadTrintaDiasPDF').addEventListener("click", downloadTrintaDiasPDF);
    function downloadTrintaDiasPDF() {
        //creates PDF from img
        var doc = new jsPDF('portrait');
        doc.setFontSize(20);
        doc.text(15, 15, "Gráficos dos últimos 30 dias");

        var width = doc.internal.pageSize.width;
        var height = doc.internal.pageSize.height;

        var canvas = document.querySelector('#graficoTrintaDiasLucros');
        //creates image
        var canvasImg = canvas.toDataURL("image/png", 1.0);
        doc.addImage(canvasImg, 'PNG', 10, 20, 182, 97.5);

        canvas = document.querySelector('#graficoTrintaDiasDespesas');
        //creates image
        canvasImg = canvas.toDataURL("image/png", 1.0);
        doc.addImage(canvasImg, 'PNG', 10, 127.5, 182, 97.5);

        canvas = document.querySelector('#graficoTrintaDiasGanhos');
        //creates image
        canvasImg = canvas.toDataURL("image/png", 1.0);
        doc.addImage(canvasImg, 'PNG', 10, 235, 182, 97.5);

        doc.save('graficos.pdf');
    }
    
    document.getElementById('downloadDozeMesesPDF').addEventListener("click", downloadDozeMesesPDF);
    function downloadDozeMesesPDF() {
        //creates PDF from img
        var doc = new jsPDF('portrait');
        doc.setFontSize(20);
        doc.text(15, 15, "Gráficos dos últimos 12 meses");

        var width = doc.internal.pageSize.width;
        var height = doc.internal.pageSize.height;

        var canvas = document.querySelector('#graficoDozeMesesLucros');
        //creates image
        var canvasImg = canvas.toDataURL("image/png", 1.0);
        doc.addImage(canvasImg, 'PNG', 10, 20, 182, 97.5);

        canvas = document.querySelector('#graficoDozeMesesDespesas');
        //creates image
        canvasImg = canvas.toDataURL("image/png", 1.0);
        doc.addImage(canvasImg, 'PNG', 10, 127.5, 182, 97.5);

        canvas = document.querySelector('#graficoDozeMesesGanhos');
        //creates image
        canvasImg = canvas.toDataURL("image/png", 1.0);
        doc.addImage(canvasImg, 'PNG', 10, 235, 182, 97.5);

        doc.save('graficos.pdf');
    }
</script>
</body>
</html>
