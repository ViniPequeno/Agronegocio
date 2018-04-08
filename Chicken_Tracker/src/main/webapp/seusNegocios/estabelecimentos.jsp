<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Controller.ConsultaEstabelecimento" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento" %>
<div class="container">
    <!--Table-->
    <h2 class="py-5 font-weight-bold text-left">Negócios</h2>

    <table class="table table-hover table-responsive-md btn-table">
        <!--Table head-->
        <thead class="mdb-color darken-3">
            <tr class="text-white">
                <th> </th>
                <th>Negócio</th>
                <th>Proprietário</th>
                <th>CNAE</th>
                <th>Endereço</th>
                <th>Sufixo CNPJ</th>
                <th></th>
            </tr>
        </thead>
        <!--Table head-->

        <!--Table body-->
        <tbody>
            <%List<Estabelecimento> estabelecimento;
                estabelecimento = ConsultaEstabelecimento.returnListOfNegocio(request.getParameter("negocio"));
                for (Estabelecimento e : estabelecimento) {%>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox<%=e.getCNAE()%>">
                    <label for="checkbox<%=e.getCNAE()%>" class="label-table"></label>
                </th>
                <td><%=e.getNegocio()%></td>
                <td><%=e.getPerfil()%></td>
                <td><%=e.getCNAE()%></td>
                <td><%=e.getEndereco()%></td>
                <td><%=e.getSufixoCNPJ()%></td>
                <td><a class="btn btn-cyan btn-rounded" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Negócio" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
            </tr>
            <%}%>
        </tbody>
        <!--Table body-->

    </table>
    <!--Table-->
    <a href="../cadastro/negocio.jsp" class="btn btn-light-green btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Novo negócio" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir negócios selecionados" role="button">
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
<script src="../_JS/formUtils.js"></script>
</body>
</html>
