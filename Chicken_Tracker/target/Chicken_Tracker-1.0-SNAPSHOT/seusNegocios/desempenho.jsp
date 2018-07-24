<% String css = "../css/desempenho.css";
   String titulo ="Desempenho";%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Pagamento"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Pagamento.ConsultaPagamento"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <% Estabelecimento e = (Estabelecimento) sessao.getAttribute("estabelecimento");
        if (e == null) {
            e = ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"));
            sessao.setAttribute("estabelecimento", e);
        } else if (!e.toString().equals(request.getParameter("estabelecimento"))) {
            e = ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"));
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
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Desempenho 
    </h2>
    <section class="mt-4">
        <p>
            Aqui serão mostrados gráficos que permitem que você acompanhe o desempenho econômico de seu estabelecimento.
            Você pode ver gráficos de desemepenho em relação aos últimos 7 dias, 30 dias, 12 meses e intervalos de tempo maiores(anos).
            Também possibilitamos salvar os gráficos em documentos pdf, assim como pode baixar apenas os gráficos desejados com o botão abaixo. 
        </p>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#baixarSelecionados">Baixar selecionados</button>
    </section>
    <!-- Modal -->
    <div class="modal fade" id="baixarSelecionados" tabindex="-1" role="dialog" aria-labelledby="labelBaixar" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelBaixar">Baixar gráficos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Escolha os gráficos desejados para baixar em um único documento pdf:</p>
                    <div class="row">
                        <div class="col-12 col-lg-4">
                            <h5>Lucro</h5>
                            <div class="form-check">
                                <input type="checkbox" id="chkBoxL7dias" name="chkBoxL7dias" value="#graficoSeteDiasLucrosHD">
                                <label for="chkBoxL7dias" class="label-table">Últimos 7 dias</label>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" id="chkBoxL30dias" name="chkBoxL30dias" value="#graficoTrintaDiasLucrosHD">
                                <label for="chkBoxL30dias" class="label-table">Últimos 30 dias</label>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" id="chkBoxL12meses" name="chkBoxL12meses" value="#graficoDozeMesesLucrosHD">
                                <label for="chkBoxL12meses" class="label-table">Últimos 12 meses</label>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4 mt-lg-0 mt-4">
                            <h5>Despesas</h5>
                            <div class="form-check">
                                <input type="checkbox" id="chkBoxD7dias" name="chkBoxD7dias" value="#graficoSeteDiasDespesasHD">
                                <label for="chkBoxD7dias" class="label-table">Últimos 7 dias</label>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" id="chkBoxD30dias" name="chkBoxD30dias" value="#graficoTrintaDiasDespesasHD">
                                <label for="chkBoxD30dias" class="label-table">Últimos 30 dias</label>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" id="chkBoxD12meses" name="chkBoxD12meses" value="#graficoDozeMesesDespesasHD">
                                <label for="chkBoxD12meses" class="label-table">Últimos 12 meses</label>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4 mt-lg-0 mt-4">
                            <h5>Ganhos</h5>
                            <div class="form-check">
                                <input type="checkbox" id="chkBoxG7dias" name="chkBoxG7dias" value="#graficoSeteDiasGanhosHD">
                                <label for="chkBoxG7dias" class="label-table">Últimos 7 dias</label>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" id="chkBoxG30dias" name="chkBoxG30dias" value="#graficoTrintaDiasGanhosHD">
                                <label for="chkBoxG30dias" class="label-table">Últimos 30 dias</label>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" id="chkBoxG12meses" name="chkBoxG12meses" value="#graficoDozeMesesGanhosHD">
                                <label for="chkBoxG12meses" class="label-table">Últimos 12 meses</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <button id="btnBaixar" type="button" class="btn btn-primary">
                        <i class="fa fa-download mr-1"></i>Baixar
                    </button>
                </div>
            </div>
        </div>
    </div>
    <section>
        <h1 class="mt-5 mb-4">
            Últimos 7 dias 
            <button class="btn btn-primary" type="button" id="downloadSeteDiasPDF"><i class="fa fa-download mr-1"></i>Baixar PDF</button>
        </h1>

        <div class="card border-light">
            <div class="card-header light-green lighten-4">
                Lucro dos últimos sete dias
            </div>
            <div class="card-body">
                <div>
                    <canvas style="align-content: center;" id="graficoSeteDiasLucros" data-info="<%=lucrosSeteDias%>"></canvas>
                </div>
                <div style="height:0; width:0; overflow:hidden;">
                    <canvas id="graficoSeteDiasLucrosHD" width="1200" height="600" data-info="<%=lucrosSeteDias%>"></canvas>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header red lighten-4">
                        Despesas dos últimos sete dias
                    </div>
                    <div class="card-body">
                        <div>
                            <canvas style="align-content: center;" id="graficoSeteDiasDespesas" data-info="<%=despesasSeteDias%>"></canvas>
                        </div>
                        <div style="height:0; width:0; overflow:hidden;">
                            <canvas id="graficoSeteDiasDespesasHD" width="1200" height="600" data-info="<%=lucrosSeteDias%>"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header blue lighten-4">
                        Ganhos dos últimos sete dias
                    </div>
                    <div class="card-body">
                        <div>
                            <canvas style="align-content: center;" id="graficoSeteDiasGanhos" data-info="<%=ganhosSeteDias%>"></canvas>
                        </div>
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
            <div class="card-header light-green lighten-4">
                Lucro dos últimos trinta dias
            </div>
            <div class="card-body">
                <div>
                    <canvas style="align-content: center;" id="graficoTrintaDiasLucros" data-info="<%=lucrosTrintaDias%>"></canvas>
                </div>
                <div style="height:0; width:0; overflow:hidden;">
                    <canvas id="graficoTrintaDiasLucrosHD" width="1200" height="600" data-info="<%=lucrosTrintaDias%>"></canvas>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header red lighten-4">
                        Despesas dos últimos trinta dias
                    </div>
                    <div class="card-body">
                        <div>
                            <canvas style="align-content: center;" id="graficoTrintaDiasDespesas" data-info="<%=despesasTrintaDias%>"></canvas>
                        </div>
                        <div style="height:0; width:0; overflow:hidden;">
                            <canvas id="graficoTrintaDiasDespesasHD" width="1200" height="600" data-info="<%=despesasTrintaDias%>"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header blue lighten-4">
                        Ganhos dos últimos trinta dias
                    </div>
                    <div class="card-body">
                        <div>
                            <canvas style="align-content: center;" id="graficoTrintaDiasGanhos" data-info="<%=ganhosTrintaDias%>"></canvas>
                        </div>
                        <div style="height:0; width:0; overflow:hidden;">
                            <canvas id="graficoTrintaDiasGanhosHD" width="1200" height="600" data-info="<%=ganhosTrintaDias%>"></canvas>
                        </div>
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
            <div class="card-header light-green lighten-4">
                Lucro dos últimos doze meses
            </div>
            <div class="card-body">
                <div>
                    <canvas style="align-content: center;" id="graficoDozeMesesLucros" data-info="<%=lucrosDozeMeses%>"></canvas>
                </div>
                <div style="height:0; width:0; overflow:hidden;">
                    <canvas id="graficoDozeMesesLucrosHD" width="1200" height="600" data-info="<%=lucrosDozeMeses%>"></canvas>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header red lighten-4">
                        Despesas dos últimos doze meses
                    </div>
                    <div class="card-body">
                        <div>
                            <canvas style="align-content: center;" id="graficoDozeMesesDespesas" data-info="<%=despesasDozeMeses%>"></canvas>
                        </div>
                        <div style="height:0; width:0; overflow:hidden;">
                            <canvas id="graficoDozeMesesDespesasHD" width="1200" height="600" data-info="<%=despesasDozeMeses%>"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header blue lighten-4">
                        Ganhos dos últimos doze meses
                    </div>
                    <div class="card-body">
                        <div>
                            <canvas style="align-content: center;" id="graficoDozeMesesGanhos" data-info="<%=ganhosDozeMeses%>"></canvas>
                        </div>
                        <div style="height:0; width:0; overflow:hidden;">
                            <canvas id="graficoDozeMesesGanhosHD" width="1200" height="600" data-info="<%=ganhosDozeMeses%>"></canvas>
                        </div>
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
            <%if (lucrosAnos != null) {%>
            <button class="btn btn-primary" type="button" id="downloadAnosPDF"><i class="fa fa-download mr-1"></i>Baixar PDF</button>
            <%}%>
        </form>
        <%if (lucrosAnos != null) {%>
        <div class="card border-light">
            <div class="card-header light-green lighten-4">
                Lucro dos últimos anos
            </div>
            <div class="card-body">
                <div>
                    <canvas style="align-content: center;" id="graficoAnosLucros" data-info="<%=lucrosAnos%>"></canvas>
                </div>
                <div style="height:0; width:0; overflow:hidden;">
                    <canvas id="graficoAnosLucrosHD" width="1200" height="600" data-info="<%=lucrosAnos%>"></canvas>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header red lighten-4">
                        Despesas dos últimos anos
                    </div>
                    <div class="card-body">
                        <div>
                            <canvas style="align-content: center;" id="graficoAnosDespesas" data-info="<%=despesasAnos%>"></canvas>
                        </div>
                        <div style="height:0; width:0; overflow:hidden;">
                            <canvas id="graficoAnosDespesasHD" width="1200" height="600" data-info="<%=despesasAnos%>"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header blue lighten-4">
                        Ganhos dos últimos anos
                    </div>
                    <div class="card-body">
                        <div>
                            <canvas style="align-content: center;" id="graficoAnosGanhos" data-info="<%=ganhosAnos%>"></canvas>
                        </div>
                        <div style="height:0; width:0; overflow:hidden;">
                            <canvas id="graficoAnosGanhosHD" width="1200" height="600" data-info="<%=ganhosAnos%>"></canvas>
                        </div>
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
<script src="../js/paginacaoTabelas.js"></script>
<script src="../js/graficos/graficoSeteDiasLucros.js"></script>
<script src="../js/graficos/graficoSeteDiasDespesas.js"></script>
<script src="../js/graficos/graficoSeteDiasGanhos.js"></script>
<script src="../js/graficos/graficoTrintaDiasLucros.js"></script>
<script src="../js/graficos/graficoTrintaDiasDespesas.js"></script>
<script src="../js/graficos/graficoTrintaDiasGanhos.js"></script>
<script src="../js/graficos/graficoDozeMesesLucros.js"></script>
<script src="../js/graficos/graficoDozeMesesDespesas.js"></script>
<script src="../js/graficos/graficoDozeMesesGanhos.js"></script>
<script src="../js/graficos/graficoAnosLucros.js"></script>
<script src="../js/graficos/graficoAnosDespesas.js"></script>
<script src="../js/graficos/graficoAnosGanhos.js"></script>
<script>
    //Conf. do background
    Chart.plugins.register({
        beforeDraw: function (chartInstance) {
            var ctx = chartInstance.chart.ctx;
            ctx.fillStyle = "white";
            ctx.fillRect(0, 0, chartInstance.chart.width, chartInstance.chart.height);
        }
    });

    //Determina valor máximo do ano ao buscar gráfico por ano
    var dataAtual = new Date();
    $('#inputDataInicio').attr('max', dataAtual.getFullYear() - 1);

    //adiciona evento ao botão
    document.getElementById('downloadSeteDiasPDF').addEventListener("click", downloadSeteDiasPDF);
    //donwload pdf a partir do gráfico em alta resolução
    function downloadSeteDiasPDF() {
        //creates PDF from img
        var doc = new jsPDF('portrait');
        doc.setFontSize(20);
        doc.text(15, 15, "Gráficos dos últimos 7 dias");

        var width = doc.internal.pageSize.width;
        var height = doc.internal.pageSize.height;

        var canvas;

        canvas = document.querySelector('#graficoSeteDiasLucrosHD');
        //creates image
        canvasImg = canvas.toDataURL("image/jpg", 1.0);
        doc.addImage(canvasImg, 'JPEG', 10, 20, 182, 97.5);

        canvas = document.querySelector('#graficoSeteDiasDespesasHD');
        //creates image
        canvasImg = canvas.toDataURL("image/jpg", 1.0);
        doc.addImage(canvasImg, 'JPEG', 10, 117.5, 182, 97.5);

        doc.addPage();

        canvas = document.querySelector('#graficoSeteDiasGanhosHD');
        //creates image
        canvasImg = canvas.toDataURL("image/jpg", 1.0);
        doc.addImage(canvasImg, 'JPEG', 10, 20, 182, 97.5);

        doc.save('relatórioSemanal.pdf');
    }

    //adiciona evento ao botão
    document.getElementById('downloadTrintaDiasPDF').addEventListener("click", downloadTrintaDiasPDF);
    //donwload pdf a partir do gráfico em alta resolução
    function downloadTrintaDiasPDF() {
        //creates PDF from img
        var doc = new jsPDF('portrait');
        doc.setFontSize(20);
        doc.text(15, 15, "Gráficos dos últimos 30 dias");

        var width = doc.internal.pageSize.width;
        var height = doc.internal.pageSize.height;

        var canvas;
        canvas = document.querySelector('#graficoTrintaDiasLucrosHD');
        //creates image
        var canvasImg = canvas.toDataURL("image/jpeg", 1.0);
        doc.addImage(canvasImg, 'JPEG', 10, 20, 182, 97.5);

        canvas = document.querySelector('#graficoTrintaDiasDespesasHD');
        //creates image
        canvasImg = canvas.toDataURL("image/jpeg", 1.0);
        doc.addImage(canvasImg, 'JPEG', 10, 127.5, 182, 97.5);

        doc.addPage();

        canvas = document.querySelector('#graficoTrintaDiasGanhosHD');
        //creates image
        canvasImg = canvas.toDataURL("image/jpeg", 1.0);
        doc.addImage(canvasImg, 'JPEG', 10, 20, 182, 97.5);

        doc.save('relatórioMensal.pdf');
    }

    //adiciona evento ao botão
    document.getElementById('downloadDozeMesesPDF').addEventListener("click", downloadDozeMesesPDF);
    //donwload pdf a partir do gráfico em alta resolução
    function downloadDozeMesesPDF() {
        //creates PDF from img
        var doc = new jsPDF('portrait');
        doc.setFontSize(20);
        doc.text(15, 15, "Gráficos dos últimos 12 meses");

        var width = doc.internal.pageSize.width;
        var height = doc.internal.pageSize.height;

        var canvas;
        canvas = document.querySelector('#graficoDozeMesesLucrosHD');
        //creates image
        var canvasImg = canvas.toDataURL("image/jpeg", 1.0);
        doc.addImage(canvasImg, 'JPEG', 10, 20, 182, 97.5);

        canvas = document.querySelector('#graficoDozeMesesDespesasHD');
        //creates image
        canvasImg = canvas.toDataURL("image/jpeg", 1.0);
        doc.addImage(canvasImg, 'JPEG', 10, 127.5, 182, 97.5);

        doc.addPage();

        canvas = document.querySelector('#graficoDozeMesesGanhosHD');
        //creates image
        canvasImg = canvas.toDataURL("image/jpeg", 1.0);
        doc.addImage(canvasImg, 'JPEG', 10, 20, 182, 97.5);

        doc.save('relatórioAnual.pdf');
    }

    //adiciona evento ao botão
    if (document.getElementById('downloadAnosPDF') !== null) {
        document.getElementById('downloadAnosPDF').addEventListener("click", downloadAnosPDF);
        //donwload pdf a partir do gráfico em alta resolução
        function downloadAnosPDF() {
            //creates PDF from img
            var doc = new jsPDF('portrait');
            doc.setFontSize(20);
            doc.text(15, 15, "Gráficos - " + anos[0] + "/" + anos[anos.length - 1]);

            var width = doc.internal.pageSize.width;
            var height = doc.internal.pageSize.height;

            var canvas;

            canvas = document.querySelector('#graficoAnosLucrosHD');
            //creates image
            var canvasImg = canvas.toDataURL("image/jpeg", 1.0);
            doc.addImage(canvasImg, 'JPEG', 10, 20, 182, 97.5);

            canvas = document.querySelector('#graficoAnosDespesasHD');
            //creates image
            canvasImg = canvas.toDataURL("image/jpeg", 1.0);
            doc.addImage(canvasImg, 'JPEG', 10, 127.5, 182, 97.5);

            doc.addPage();

            canvas = document.querySelector('#graficoAnosGanhosHD');
            //creates image
            canvasImg = canvas.toDataURL("image/jpeg", 1.0);
            doc.addImage(canvasImg, 'JPEG', 10, 20, 182, 97.5);

            doc.save('relatórioAnualVariado.pdf');
        }
    }
    $('#btnBaixar').click(function () {
        if ($('input[type="checkbox"]:checked').length > 0) {
            var doc = new jsPDF('portrait');
            doc.setFontSize(20);
            doc.text(15, 15, "Gráficos - Selecionados");
            var canvas;
            var canvasImg;
            var y = 20, i = 0;
            $('input[type="checkbox"]:checked').each(function () {
                canvas = document.querySelector($(this).val());
                //creates image
                canvasImg = canvas.toDataURL("image/jpeg", 1.0);
                doc.addImage(canvasImg, 'JPEG', 10, y, 182, 97.5);
                y += 117.5;
                i++;
                if (i > 0 && i % 2 === 0) {
                    doc.addPage();
                    y = 20;
                }
            });
            doc.save('RelatórioPersonalizado.pdf');
        }
    });
</script>
</body>
</html>
