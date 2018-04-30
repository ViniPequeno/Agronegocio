<% String css = "";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Produto.ConsultaProduto" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Produto" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Lista de produtos</h2>

    <%  List<Produto> produtos;
        produtos = ConsultaProduto.returnList(request.getParameter("estabelecimento"));
        if (produtos.size() > 0) {%>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Produtos</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
            <table class="table table-hover table-responsive-md btn-table" id="tableDados">
                <!--Table head-->
                <thead>
                    <tr>
                        <th> </th>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Qtde. atual</th>
                        <th>Estabelecimento</th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <% for (Produto p : produtos) {
                            String dataProduto = ConsultaProduto.returnValues(p);
                    %>
                    <tr data-produto="<%=dataProduto%>">
                        <th scope="row" class="pr-md-3 pr-5">
                            <input form="checks" type="checkbox" id="checkbox!<%=p.getCodigo()%>" name="checkbox!<%=p.getCodigo()%>">
                            <label for="checkbox!<%=p.getCodigo()%>" class="label-table"></label>
                        </th>
                        <td><%=p.getCodigo()%></td>
                        <td><%=p.getNome()%></td>
                        <td><%=p.getQuantidadeAtual()%></td>
                        <td><%=p.getEstabelecimento().getSufixoCNPJ()%></td>
                    </tr>
                    <%}%>
                </tbody>
                <!--Table body-->
            </table>
            <!--Table-->
            <hr class="my-0">

            <!--Bottom Table UI-->
            <div class="d-flex justify-content-center">

                <!--Pagination -->
                <nav class="my-4 pt-2">
                    <ul class="pagination pagination-circle pg-dark-grey mb-0" id="pg-link">

                        <!--First-->
                        <li id="first-item" class="page-item disabled clearfix d-none d-md-block"><a class="page-link">Primeiro</a></li>

                        <!--Arrow left-->
                        <li id="previous" class="page-item disabled">
                            <a class="page-link" aria-label="Anterior">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Anterior</span>
                            </a>
                        </li>

                        <!--Arrow right-->
                        <li id="next" class="page-item">
                            <a class="page-link" aria-label="Próximo">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Próximo</span>
                            </a>
                        </li>

                        <!--Last-->
                        <li id="last-item" class="page-item clearfix d-none d-md-block"><a class="page-link">Último</a></li>

                    </ul>
                </nav>
                <!--/Pagination -->

            </div>
            <!--Bottom Table UI-->
        </div> 
    </div>
    <%} else {%>
    <h2 class="py-5 text-center">Nenhum produto registrado ainda</h2>
    <%}%>

    <a href="../cadastro/produto.jsp" class="btn btn-light-green btn-rounded mt-4" data-toggle="tooltip" data-placement="bottom" title="Novo produto" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded mt-4" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir produtos selecionados" role="button">
        <i class="fa fa-trash mr-1" aria-hidden="true"></i></a>

    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="confirmarExclusao" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirmar alterações?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Essa ação não pode ser desfeita.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <form id="checks" class="mt-3" action="/Chicken_Tracker/ProdutoDeleteServlet" method="post">
                        <button type="submit" class="btn btn-primary">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="detalhesProduto" tabindex="-1" role="dialog" aria-labelledby="detalhesProduto" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id='bodyDetalhes'>
                    <p id="codigo"> Código </p>
                    <p id="nome"> Nome: </p>
                    <p id="qtdeAtual"> Em estoque: </p>
                    <p id="qtdeMin"> Quantidade Mínima: </p>
                    <p id="qtdeMax"> Quantidade Máxima: </p>
                    <p id="descricao"> Descrição: </p>
                    <p id="estabelecimento"> Usado por: </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" id="btnEditarConfirmar">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/formUtils.js"></script>
<script>
    var dataP = "";
    var modalDetalhesInnerHTML = '<p id="codigo"> Código </p>'+
                    '<p id="nome"> Nome: </p>'+
                    '<p id="qtdeAtual"> Em estoque: </p>'+
                    '<p id="qtdeMin"> Quantidade Mínima: </p>'+
                    '<p id="qtdeMax"> Quantidade Máxima: </p>'+
                    '<p id="descricao"> Descrição: </p>'+
                    '<p id="estabelecimento"> Usado por: </p>';
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function () {
        $("#detalhesProduto").modal();
        $("#bodyDetalhes").html(modalDetalhesInnerHTML);
        $("#btnEditarConfirmar").text("Editar");

        var linha = $(this).closest('tr');
        var dados = linha.data('produto').toString();
        var campo = dados.split("#");
        dataP = campo;

        var codigo = campo[0];
        var nome = campo[1];
        var qtdeAtual = campo[2];
        var qtdeMin = campo[3];
        var qtdeMax = campo[4];
        var descricao = campo[5];
        var estabelecimento = campo[6];

        $("#codigo").text("Código: " + codigo);

        $("#nome").text("Nome: " + nome);

        $("#qtdeAtual").text("Em estoque: " + qtdeAtual);

        $("#qtdeMin").text("Quantidade mínima: " + qtdeMin);

        $("#qtdeMax").text("Quantidade Máxima " + qtdeMax);

        $("#descricao").text("Descrição: " + descricao);

        $("#estabelecimento").text("Estabelecimento: " + estabelecimento);
    });
</script>
<script>
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/ProdutoAlterarServlet" name="formEditar">' +
            '<div class="md-form"><i class="fa fa-hashtag prefix grey-text"></i>' +
            '<input type="text" id="inputCodigo" name="inputCodigo" class="form-control" required autofocus maxlength="20">' +
            '<label for="inputCodigo">Código</label> </div>' +
            '<div class="md-form"><i class="fa fa-book prefix grey-text"></i>' +
            '<input type="text" id="inputNome" name="inputNome" class="form-control" required maxlength="50">' +
            '<label for="inputNome">Nome</label></div>' +
            '<div class="md-form"><i class="fa fa-clipboard-list prefix grey-text"></i>' +
            '<input type="text" id="inputDescricao" name="inputDescricao" class="form-control md-textarea" required maxlength="100">' +
            '<label for="inputDescricao">Descrição</label></div>' +
            '<div class="md-form">    <i class="fa fa-inbox prefix grey-text"></i>' +
            '<input type="text" id="inputQtdeAtual" name="inputQtdeAtual" class="form-control" required maxlength="10">' +
            '<label for="inputQtdeAtual">Quantidade atual</label> </div>' +
            '<div class="md-form">     <i class="fa fa-box prefix grey-text"></i>' +
            '<input type="text" id="inputMinQtde" name="inputMinQtde" class="form-control" required maxlength="10">' +
            '<label for="inputMinQtde">Quantidade Mínima</label> </div>' +
            '<div class="md-form">  <i class="fa fa-boxes prefix grey-text"></i>' +
            '<input type="text" id="inputMaxQtde" name="inputMaxQtde" class="form-control" required maxlength="10">' +
            '<label for="inputMaxQtde">Quantidade Máxima</label> </div>' +
            '</form>';
    $("#btnEditarConfirmar").click(function () {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            $('#inputCodigo').val(dataP[0]).trigger("change");
            $('#inputNome').val(dataP[1]).trigger("change");
            $('#inputQtdeAtual').val(dataP[2]).trigger("change");
            $('#inputMinQtde').val(dataP[3]).trigger("change");
            $('#inputMaxQtde').val(dataP[4]).trigger("change");
            $('#inputDescricao').val(dataP[5]).trigger("change");
        } else {
            formEditar.submit();
        }
    });
</script>
</body>
</html>
