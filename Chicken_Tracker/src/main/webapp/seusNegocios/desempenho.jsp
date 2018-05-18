<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<div class="container">

    <%
        Negocio n = (Negocio) request.getSession().getAttribute("negocio");
        if (sessao.getAttribute("estabelecimento") == null) {
            sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"), n));
        } else if (!sessao.getAttribute("estabelecimento").toString().equals(request.getParameter("negocio").toString())) {
            sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"), n));
        }
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
    <div class="card border-light">
        <div class="card-header">
            Lucro di�rio
        </div>
        <div class="card-body">
            <canvas style="align-content: center;" id="graficoLucro"></canvas>
        </div>
    </div>
    <a href="../cadastro/negocio.jsp" class="btn btn-light-green btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Novo neg�cio" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir neg�cios selecionados" role="button">
        <i class="fa fa-trash mr-1" aria-hidden="true"></i></a>

    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="confirmarExclusao" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirmar exclus�o?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Todos os estabelecimentos associados a este neg�cio tamb�m ser�o apagados</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Confirmar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/paginacaoTabelas.js"></script>
<script src="../_JS/graficoLucro.js"></script>
</body>
</html>
