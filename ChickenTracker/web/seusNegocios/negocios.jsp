<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <!--Table-->
    <h2 class="py-5 font-weight-bold text-left">Neg�cios</h2>

    <table class="table table-hover table-responsive-md btn-table">
        <!--Table head-->
        <thead class="mdb-color darken-3">
            <tr class="text-white">
                <th> </th>
                <th>Nome</th>
                <th>Propriet�rio</th>
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
                <td><a class="btn btn-cyan btn-rounded btn-sm" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Neg�cio" role="button">
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
                <td><a class="btn btn-cyan btn-rounded btn-sm" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Neg�cio" role="button">
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
                <td><a class="btn btn-cyan btn-rounded btn-sm" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Neg�cio" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>            
            </tr>
        </tbody>
        <!--Table body-->

    </table>
    <!--Table-->
    <a class="btn btn-light-green btn-rounded" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Novo neg�cio" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a class="btn btn-danger btn-rounded" href="#" data-toggle="tooltip" data-placement="bottom" title="Excluir neg�cios selecionados" role="button"><i class="fa fa-trash mr-1" aria-hidden="true"></i></a>
</div>
<%@include file="../rodape.jsp" %>
<script>
    for (i = 0; i < document.querySelectorAll('td').length; i++) {
        document.querySelectorAll('td')[i].addEventListener('click', function () {
            window.location.href = this.getAttribute('data-link');

        });
    }
</script>
</body>
</html>
