<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <!--Table-->
    <h2 class="py-5 font-weight-bold text-left">Negócios</h2>

    <table class="table table-hover">
        <!--Table head-->
        <thead class="mdb-color darken-3">
            <tr class="text-white">
                <th>#</th>
                <th>Nome</th>
                <th>Proprietário</th>
                <th>CNPJ</th>
                <th>Email</th>
                <th>Fone 1</th>
                <th>Fone 2</th>
                <th>Facebook</th>
                <th>Instagram</th>
            </tr>
        </thead>
        <!--Table head-->

        <!--Table body-->
        <tbody>
            <tr data-link="#">
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
            </tr>
            <tr data-link="#">
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
            </tr>
            <tr data-link="#">
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
            </tr>
        </tbody>
        <!--Table body-->

    </table>
    <!--Table-->
    <button type="button" class="btn btn-light-green btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Novo negócio">
        <i class="fa fa-plus mr-1" aria-hidden="true"></i></button>
    <button type="button" class="btn btn-danger btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Excluir negócios selecionados">
        <i class="fa fa-trash mr-1" aria-hidden="true"></i></button>
</div>
<%@include file="../rodape.jsp" %>
<script>
    for (i = 0; i < document.querySelectorAll('tr').length; i++) {
        document.querySelectorAll('tr')[i].addEventListener('click', function () {
            window.location.href = this.getAttribute('data-link');

        });
    }
</script>
</body>
</html>
