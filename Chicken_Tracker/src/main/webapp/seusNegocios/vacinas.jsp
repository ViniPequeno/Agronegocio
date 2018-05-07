<% String css = "../_CSS/seu_negocio.css";%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Vacina.ConsultaVacina" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Vacina" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Lista de vacinas</h2>

    <%  List<Vacina> vacinas;
        vacinas = ConsultaVacina.returnList(request.getParameter("estabelecimento"));
        if (vacinas.size() > 0) {%>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Vacinas</h4>

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
                        <th>Última vacina</th>
                        <th>Próxima vacina</th>
                        <th></th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <%  for (Vacina v : vacinas) {
                        String dataVacina = ConsultaVacina.returnValues(v);
                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    %>
                    <tr data-vacina='<%=dataVacina%>'>
                        <th scope="row" class="pr-md-3 pr-5">
                            <input form="checks" type="checkbox" id="checkbox!<%=v.getCodigo()%>" name="checkbox!<%=v.getCodigo()%>">
                            <label for="checkbox!<%=v.getCodigo()%>" class="label-table"></label>
                        </th>
                        <td><%=v.getCodigo()%></td>
                        <td><%=v.getNome()%></td>
                        <td><%=dateFormat.format(v.getDataRealizada())%></td>
                        <td><%=dateFormat.format(v.getDataProxima())%></td>
                        <td><a class="btn btn-cyan btn-rounded" href="../cadastro/vacina.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Vacina" role="button">
                                <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
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
    <h2 class="py-5 text-center">Nenhuma vacina registrada ainda</h2>
    <%}%>

    <a href="../cadastro/vacina.jsp" class="btn btn-light-green btn-rounded mt-4" data-toggle="tooltip" data-placement="bottom" title="Nova vacina" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded mt-4 disabled" id="btnExcluir" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir vacinas selecionados" role="button">
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
                    <p>Esta ação não pode ser desfeita</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <form id="checks" action="/Chicken_Tracker/VacinaDeleteServlet" method="post">
                        <button type="submit" class="btn btn-primary">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="detalhesVacina" tabindex="-1" role="dialog" aria-labelledby="detalhesVacina" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id='bodyDetalhes'>
                    <p id="codigo"> Código: </p>
                    <p id="nome"> Nome: </p>
                    <p id="dataRealizada"> Data da primeira vacina: </p>
                    <p id="dataProxima"> Data da próxima vacina: </p>
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
<script src="../_JS/mascara.js"></script>
<script>
    var dataV = "";
    var modalDetalhesInnerHTML = '<p id="codigo"> Código: </p>'+
                    '<p id="nome"> Nome: </p>'+
                    '<p id="dataRealizada"> Data da primeira vacina: </p>'+
                    '<p id="dataProxima"> Data da próxima vacina: </p>'+
                    '<p id="descricao"> Descrição: </p>'+
                    '<p id="estabelecimento"> Usado por: </p>';
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function () {
        $("#detalhesVacina").modal();
        $("#bodyDetalhes").html(modalDetalhesInnerHTML);
        $("#btnEditarConfirmar").text("Editar");

        var linha = $(this).closest('tr');
        var dados = linha.data('vacina').toString();
        var campo = dados.split("#");
        dataV = campo;

        var codigo = campo[0];
        var nome = campo[1];
        var descricao = campo[2];
        var dataRealizada = campo[3];
        var dataProxima = campo[4];
        var estabelecimento = campo[5];

        $("#codigo").text("Código: " + codigo);

        $("#nome").text("Nome: " + nome);

        $("#descricao").text("Descrição: " + descricao);

        $("#dataRealizada").text("Quantidade mínima: " + dataRealizada);

        $("#dataProxima").text("Quantidade Máxima " + dataProxima);

        $("#estabelecimento").text("Estabelecimento: " + estabelecimento);
    });
</script>
<script>
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/VacinaAlterarServlet" name="formEditar">' +
            '<div class="md-form"><i class="fa fa-user prefix grey-text"></i>' +
            '<input type="text" id="inputNome" name="inputNome" class="form-control" required autofocus maxlength="50">' +
            '<label for="inputNome">Nome</label></div>' +
            '<div class="md-form"><i class="fa fa-calendar prefix grey-text"></i>' +
            '<input type="text" id="inputDataPrimeiraVacina" name="inputDataPrimeiraVacina" class="form-control" required maxlength="10">' +
            '<label for="inputDataPrimeiraVacina">Data da primeira vacina:</label></div>' +
            '<div class="md-form"><i class="fa fa-calendar-plus prefix grey-text"></i>' +
            '<input type="text" id="inputDataProximaVacina" name="inputDataProximaVacina" class="form-control" required maxlength="10">' +
            '<label for="inputDataProximaVacina">Data da próxima vacina</label></div>' +
            '<div class="md-form"><i class="fa fa-id-card prefix grey-text"></i>' +
            '<input type="text" id="inputCodigo" name="inputCodigo" class="form-control" required maxlength="10">' +
            '<label for="inputCodigo">Código</label></div>' +
            '<div class="md-form"><i class="fa fa-pencil-alt prefix grey-text"></i>' +
            '<textarea id="inputDescricao" name="inputDescricao" class="form-control md-textarea" rows="3" required=""></textarea>' +
            '<label for="inputDescricao">Descrição</label></div>' +
            '</form>';
    $("#btnEditarConfirmar").click(function () {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            $('#inputCodigo').val(dataV[0]).trigger("change");
            $('#inputNome').val(dataV[1]).trigger("change");
            $('#inputDescricao').val(dataV[2]).trigger("change");
            $('#inputDataPrimeiraVacina').val(dataV[3]).trigger("change");
            $('#inputDataProximaVacina').val(dataV[4]).trigger("change");
            $('#inputDataProximaVacina').mask("00/00/0000");
            $('#inputDataPrimeiraVacina').mask("00/00/0000");
        } else {
            formEditar.submit();
        }
    });
</script>
</body>
</html>
