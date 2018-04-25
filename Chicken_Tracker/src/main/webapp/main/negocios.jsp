<% String css = "../_CSS/negocios.css";%>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <div class="col-md-12 col-sm-12 col-lg-12 col-xl-12 mx-auto">
        <div class="card" style="margin-top: 20px">
            <div class="card-body">
                <div class="mx-auto">
                    <h2 class="py-4 font-weight-bold text-left">Lista de Negócios Cadastrados</h2>
                    <div class="md-form mb-5">
                    <input class="form-control pesquisar" type="text" placeholder="Pesquisar negócios" name="inputPesquisar">
                    </div>
                    <table class="table table-hover table-responsive-md btn-table" style="margin-bottom: 20px">
                        <thead class="thead-dark">
                            <tr class="text-white">
                                <th>Nome</th>
                                <th>Proprietário</th>
                                <th>CNPJ</th>
                                <th>Email</th>
                                <th>Fone 1</th>
                                <th>Fone 2</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>        
                            </tr>
                            <tr>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>       
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
</body>
</html>
