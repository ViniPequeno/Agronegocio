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
            e = ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"),n);
            sessao.setAttribute("estabelecimento", e);
        } else if (!e.toString().equals(request.getParameter("estabelecimento"))) {
            e = ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"),n);
            sessao.setAttribute("estabelecimento", e);
        }
        String despesasSeteDias = ConsultaPagamento.seteDiasDespesas(((Estabelecimento)sessao.getAttribute("estabelecimento")).getId(), n);
        String lucrosSeteDias = ConsultaPagamento.seteDiasLucros(((Estabelecimento)sessao.getAttribute("estabelecimento")).getId(), n);
        String ganhosSeteDias = ConsultaPagamento.seteDiasGanhos(((Estabelecimento)sessao.getAttribute("estabelecimento")).getId(), n);
    %>
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Desempenho</h2>
    <div class="card border-light">
        <div class="card-header">
            Lucro dos últimos sete dias
        </div>
        <div class="card-body">
            <canvas style="align-content: center;" id="graficoSeteDiasLucros" data-info="<%=lucrosSeteDias%>"></canvas>
        </div>
    </div>
    <div class="card border-light">
        <div class="card-header">
            Despesas dos últimos 7 dias
        </div>
        <div class="card-body">
            <canvas style="align-content: center;" id="graficoSeteDiasDespesas" data-info="<%=despesasSeteDias%>"></canvas>
        </div>
    </div>
    <div class="card border-light">
        <div class="card-header">
            Ganhos dos últimos sete dias
        </div>
        <div class="card-body">
            <canvas style="align-content: center;" id="graficoSeteDiasGanhos" data-info="<%=ganhosSeteDias%>"></canvas>
        </div>
    </div>
    <div class="card border-light">
        <div class="card-header">
            Lucro diário
        </div>
        <div class="card-body">
            <canvas style="align-content: center;" id="graficoLucro"></canvas>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/paginacaoTabelas.js"></script>
<script src="../_JS/graficos/graficoSeteDiasLucros.js"></script>
<script src="../_JS/graficos/graficoSeteDiasDespesas.js"></script>
<script src="../_JS/graficos/graficoSeteDiasGanhos.js"></script>
</body>
</html>
