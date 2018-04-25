<% String css = "";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.LocalAves.ConsultaLocalAves" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.LocalAves" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <!--Table-->
    <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>"> Voltar </a>
    <h2 class="py-5 font-weight-bold text-left">Locais das aves</h2>

    <%List<LocalAves> locaisAves;
        locaisAves = ConsultaLocalAves.returnList(request.getParameter("estabelecimento"));
        if (locaisAves.size() > 0) {%>
    <table class="table table-hover table-responsive-md btn-table">
        <!--Table head-->
        <thead class="mdb-color darken-3">
            <tr class="text-white">
                <th> </th>
                <th>Código</th>
                <th>Área</th>
                <th>Função</th>
                <th>Estabelecimento</th>
                <th></th>
            </tr>
        </thead>
        <!--Table head-->

        <!--Table body-->
        <tbody>
            <%  for (LocalAves l : locaisAves) {%>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox<%=l.getCodigo()%>">
                    <label for="checkbox<%=l.getCodigo()%>" class="label-table"></label>
                </th>
                <td><%=l.getCodigo()%></td>
                <td><%=l.getArea()%></td>
                <td><%=l.getFuncao()%></td>
                <td><%=l.getEstabelecimento().getSufixoCNPJ()%></td>
                <td><a class="btn btn-cyan btn-rounded" href="../cadastro/aviario.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Aviário" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
            </tr>
            <%}%>
        </tbody>
        <!--Table body-->
    </table>
    <!--Table-->
    <%} else {%>
    <h2 class="py-5 text-center">Nenhum local de aves registrado ainda</h2>
    <%}%>
    <a href="../cadastro/localAves.jsp" class="btn btn-light-green btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Novo Aviário" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir aviários selecionados" role="button">
        <i class="fa fa-trash mr-1" aria-hidden="true"></i></a>

    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="confirmarExclusao" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirmar exclusão?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Todos os estabelecimentos associados a este negócio também serão apagados</p>
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
<script src="../_JS/formUtil.js"></script>
</body>
</html>
