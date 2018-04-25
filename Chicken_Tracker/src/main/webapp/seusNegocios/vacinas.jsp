<% String css = "";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Vacina.ConsultaVacina" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Vacina" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <!--Table-->
    <a href="estabelecimento.jsp"> Voltar </a>
    <h2 class="py-5 font-weight-bold text-left">Lista de vacinas</h2>

    <%  List<Vacina> vacinas;
        vacinas = ConsultaVacina.returnList(request.getParameter("estabelecimento"));
        if (vacinas.size() > 0) {%>
    <table class="table table-hover table-responsive-md btn-table">
        <!--Table head-->
        <thead class="mdb-color darken-3">
            <tr class="text-white">
                <th> </th>
                <th>Código</th>
                <th>Nome</th>
                <th>Última vacina</th>
                <th>Próxima vacina</th>
                <th></th>
            </tr>
        </thead>
        <!--Table head-->

        <!--Table body-->
        <tbody>
            <%  for (Vacina v : vacinas) {%>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox<%=v.getCodigo()%>">
                    <label for="checkbox<%=v.getCodigo()%>" class="label-table"></label>
                </th>
                <td><%=v.getCodigo()%></td>
                <td><%=v.getNome()%></td>
                <td><%=v.getDataRealizada()%></td>
                <td><%=v.getDataProxima()%></td>
                <td><a class="btn btn-cyan btn-rounded" href="../cadastro/vacina.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Vacina" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
            </tr>
            <%}%>
        </tbody>
        <!--Table body-->
    </table>
    <!--Table-->
    <%} else {%>
    <h2 class="py-5 text-center">Nenhuma vacina registrada ainda</h2>
    <%}%>

    <a href="../cadastro/vacina.jsp" class="btn btn-light-green btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Nova vacina" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir vacinas selecionados" role="button">
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
