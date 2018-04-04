<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <!--Table-->
    <h2 class="py-5 font-weight-bold text-left">Negócios</h2>

    <table class="table table-hover table-responsive-md btn-table">
        <!--Table head-->
        <thead class="mdb-color darken-3">
            <tr class="text-white">
                <th> </th>
                <th>Nome</th>
                <th>Proprietário</th>
                <th>CNPJ</th>
                <th>Email</th>
                <th>Fone 1</th>
                <th>Fone 2</th>
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
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td><a class="btn btn-cyan btn-rounded btn-sm" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Negócio" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
            </tr>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox125">
                    <label for="checkbox125" class="label-table"></label>
                </th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td><a class="btn btn-cyan btn-rounded btn-sm" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Negócio" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>            
            </tr>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox126">
                    <label for="checkbox126" class="label-table"></label>
                </th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td><a class="btn btn-cyan btn-rounded btn-sm" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Negócio" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>            
            </tr>
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
