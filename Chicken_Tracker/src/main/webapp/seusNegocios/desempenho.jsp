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
        <h1 class="mt-5 mb-4">�ltimos 7 dias</h1>
        <div class="card border-light">
            <div class="card-header">
                Lucro dos �ltimos sete dias
            </div>
            <div class="card-body">
                <canvas style="align-content: center;" id="graficoSeteDiasLucros" data-info="<%=lucrosSeteDias%>"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Despesas dos �ltimos sete dias
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoSeteDiasDespesas" data-info="<%=despesasSeteDias%>"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Ganhos dos �ltimos sete dias
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoSeteDiasGanhos" data-info="<%=ganhosSeteDias%>"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <h1 class="mt-5 mb-4">�ltimos 30 dias</h1>
        <div class="card border-light">
            <div class="card-header">
                Lucro dos �ltimos trinta dias
            </div>
            <div class="card-body">
                <canvas style="align-content: center;" id="graficoTrintaDiasLucros" data-info="<%=lucrosTrintaDias%>"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Despesas dos �ltimos trinta dias
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoTrintaDiasDespesas" data-info="<%=despesasTrintaDias%>"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Ganhos dos �ltimos trinta dias
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoTrintaDiasGanhos" data-info="<%=ganhosTrintaDias%>"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <h1 class="mt-5 mb-4">�ltimos 12 meses</h1>
        <div class="card border-light">
            <div class="card-header">
                Lucro dos �ltimos doze meses
            </div>
            <div class="card-body">
                <canvas style="align-content: center;" id="graficoDozeMesesLucros" data-info="<%=lucrosDozeMeses%>"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Despesas dos �ltimos doze meses
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoDozeMesesDespesas" data-info="<%=despesasDozeMeses%>"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Ganhos dos �ltimos doze meses
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoDozeMesesGanhos" data-info="<%=ganhosDozeMeses%>"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="graficosAnos">
        <h1 class="mt-5 mb-4">�ltimos anos</h1>
        <form action="/Chicken_Tracker/PagamentoServlet" method="get" class="form-inline mb-2">
            <label class="mr-3" for="inputDataInicio">Escolha o ano de in�cio</label>
            <input class="form-control mr-3" type="number" name="inputDataInicio" id="inputDataInicio" required min="1950">
            <input type="hidden" name="inputEstabelecimentoID" value="<%=e.getId()%>">
            <input class="btn btn-primary" type="submit">
        </form>
        <div class="card border-light">
            <div class="card-header">
                Lucro dos �ltimos anos
            </div>
            <div class="card-body">
                <canvas style="align-content: center;" id="graficoAnosLucros" data-info="<%=lucrosAnos%>"></canvas>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Despesas dos �ltimos anos
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoAnosDespesas" data-info="<%=despesasAnos%>"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-light">
                    <div class="card-header">
                        Ganhos dos �ltimos anos
                    </div>
                    <div class="card-body">
                        <canvas style="align-content: center;" id="graficoAnosGanhos" data-info="<%=ganhosAnos%>"></canvas>
                    </div>
                </div>
            </div>
        </div>
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
</script>
</body>
</html>
