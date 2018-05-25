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
        List<Pagamento> lista = ConsultaPagamento.returnList(((Estabelecimento)sessao.getAttribute("estabelecimento")).getSufixoCNPJ(), n);
        String despesaSetedias = ConsultaPagamento.seteDiasDespesas(((Estabelecimento)sessao.getAttribute("estabelecimento")).getId(), n);
    %>
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Desempenho</h2>
    <div class="card border-light">
        <div class="card-header">
            Lucro di�rio
        </div>
        <div class="card-body">
            <canvas style="align-content: center;" id="graficoLucro"></canvas>
        </div>
    </div>
    <div class="card border-light">
        <div class="card-header">
            Despesas dos �ltimos 7 dias
        </div>
        <div class="card-body">
            <%=despesaSetedias%>
            <canvas style="align-content: center;" id="graficoSeteDiasDespesas" data-info="<%=despesaSetedias%>"></canvas>
        </div>
    </div>
    <div class="card border-light">
        <div class="card-header">
            Lucro di�rio
        </div>
        <div class="card-body">
            <canvas style="align-content: center;" id="graficoLucro"></canvas>
        </div>
    </div>
    <div class="card border-light">
        <div class="card-header">
            Lucro di�rio
        </div>
        <div class="card-body">
            <canvas style="align-content: center;" id="graficoLucro"></canvas>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/paginacaoTabelas.js"></script>
<script src="../_JS/graficoLucro.js"></script>
<script src="../_JS/graficos/graficoSeteDiasDespesas.js"></script>
</body>
</html>
