<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <!--Table-->
    <h2 class="py-5 font-weight-bold text-left">Gerenciar Funcionários</h2>

    <table class="table table-hover table-responsive-md btn-table">
        <!--Table head-->
        <thead class="mdb-color darken-3">
            <tr class="text-white">
                <th> </th>
                <th>Nome</th>
                <th>Cargo</th>
                <th>CPF</th>
                <th>RG</th>
                <th>Situação</th>
                <th></th>
            </tr>
        </thead>
        <!--Table head-->

        <!--Table body-->
        <tbody>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox124">
                    <label for="checkbox124" class="label-table"></label>
                </th>
                <td>Ronaldinho</td>
                <td>Cuidador de Galinhas</td>
                <td>065.213.543-82</td>
                <td>87029-8</td>
                <td>Ativo</td>
                <td><a class="btn btn-cyan btn-rounded btn-sm" href="../cadastro/funcionario.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Funcionário" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
            </tr>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox124">
                    <label for="checkbox124" class="label-table"></label>
                </th>
                <td>Valdinho</td>
                <td>Lavador de Galinhas</td>
                <td>065.213.543-82</td>
                <td>87029-8</td>
                <td>Ativo</td>
                <td><a class="btn btn-cyan btn-rounded btn-sm" href="../cadastro/funcionario.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Funcionário" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
            </tr>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox124">
                    <label for="checkbox124" class="label-table"></label>
                </th>
                <td>Bentinho</td>
                <td>Abatedor de Galinhas</td>
                <td>065.213.543-82</td>
                <td>87029-8</td>
                <td>Não ativo</td>
                <td><a class="btn btn-cyan btn-rounded btn-sm" href="../cadastro/funcionario.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Funcionário" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
            </tr>
        </tbody>
        <!--Table body-->

    </table>
    <!--Table-->
    <a href="../cadastro/funcionario.jsp" class="btn btn-light-green btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Novo funcionário" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir funcionário(s) selecionado(s)" role="button">
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
                    <p>Todos os funcionários selecionados serão apagados.</p>
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
