<% String css = "";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Funcionario.ConsultaFuncionario" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Funcionario" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">

    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>
        Gerenciar Funcionários</h2>

    <%  List<Funcionario> funcionarios;
        funcionarios = ConsultaFuncionario.returnList(request.getParameter("estabelecimento"));
        if (funcionarios.size() > 0) {%>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Funcionários</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
            <table class="table table-hover table-responsive-md btn-table">
                <!--Table head-->
                <thead class="mdb-color darken-3">
                    <tr class="text-white">
                        <th></th>
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
                    <%  for (Funcionario f : funcionarios) {
                            String dataFuncionario = ConsultaFuncionario.returnValues(f);%>
                    <tr data-funcionario>
                        <th scope="row" class="pr-md-3 pr-5">
                            <input type="checkbox" id="checkbox<%=f.getCPF()%>">
                            <label for="checkbox<%=f.getCPF()%>" class="label-table"></label>
                        </th>
                        <td><%=f.getNome()%></td>
                        <td>cargo</td>
                        <td><%=f.getCPF()%></td>
                        <td><%=f.getRG()%></td>
                        <td>situacao</td>
                        <td><a class="btn btn-cyan btn-rounded" href="../cadastro/funcionario.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Negócio" role="button">
                                <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
                    </tr>
                    <%}%>
                </tbody>
                <!--Table body-->
            </table>
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
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Anterior</span>
                            </a>
                        </li>

                        <!--Arrow right-->
                        <li id="next" class="page-item">
                            <a class="page-link" aria-label="Next">
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
    <!--Table-->
    <%} else {%>
    <h2 class="py-5 text-center">Nenhum funcionário registrado ainda</h2>
    <%}%>

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

    <!-- Modal -->
    <div class="modal fade" id="detalhesFuncionario" tabindex="-1" role="dialog" aria-labelledby="detalhesFuncionario" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="bodyDetalhes">
                    <p id="nome"> Nome: </p>
                    <p id="cargo"> Cargo:</p>
                    <p id="CPF"> CPF: </p>
                    <p id="RG"> RG: </p>
                    <p id="situacao"> Situação: </p>
                    <p id="estabelecimentos"> Locais de trabalho: </p>
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
<script src="../_JS/formUtil.js"></script>
<script>
    var dataF = "";
    var modalFuncInnerHTML = '<p id="nome"> Nome: </p>' +
            '<p id="cargo"> Cargo:</p>' +
            '<p id="CPF"> CPF: </p>' +
            '<p id="RG"> RG: </p>' +
            '<p id="situacao"> Situação: </p>' +
            '<p id="estabelecimentos"> Locais de trabalho: </p>';
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function () {
        $("#detalhesFuncionario").modal();
        $("#bodyDetalhes").html(modalDetalhesInnerHTML);
        $("#btnEditarConfirmar").text("Editar");

        var linha = $(this).closest('tr');
        var dados = linha.data('funcionario').toString();
        var campo = dados.split("#");
        dataP = campo;

        var nome = campo[0];
        var cargo = campo[1];
        var CPF = campo[2];
        var RG = campo[3];
        var situacao = campo[4];
        var estabelecimentos = campo[5];

        $("#nome").text("Nome: " + nome);

        $("#cargo").text("Cargo: " + cargo);

        $("#CPF").text("CPF: " + CPF);

        $("#RG").text("RG: " + RG);

        $("#situacao").text("Situação: " + situacao);

        $("#estabelecimentos").text("Estabelecimentos: " + estabelecimentos);
    });
</script>
<script>
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/FuncionarioAlterarServlet" name="formEditar">' +
            '<div class="md-form"><i class="fa fa-user prefix grey-text"></i>' +
            '<input type="text" id="inputNome" name="inputNome" class="form-control" required maxlength="80">' +
            '<label for="inputNome">Nome</label></div>' +
            '<div class="md-form"><i class="fa fa-id-card prefix grey-text"></i>' +
            '<input type="text" id="inputCPF" name="inputCPF" class="form-control" required autofocus maxlength="14">' +
            '<label for="inputCPF">CPF</label></div>' +
            '<div class="md-form"><i class="fas fa-address-card prefix grey-text"></i>' +
            '<input type="text" id="inputRG" name="inputRG" class="form-control" required maxlength="14">' +
            '<label for="inputRG">RG</label></div>' +
            '<div class="md-form"><i class="fa fa-clipboard prefix grey-text"></i>' +
            '<input type="text" id="inputCargo" name="inputCargo" class="form-control" required maxlength="80">' +
            '<label for="inputCargo">Cargo</label></div>' +
            '<div class="md-form"><i class="fa fa-clipboard-list prefix grey-text"></i>' +
            '<textarea id="inputSituacao" name="inputSituacao" class="form-control md-textarea" rows="3" required=""></textarea>' +
            '<label for="inputSituacao">Situação</label></div>' +
            '</form>';
    $("#btnEditarConfirmar").click(function () {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            $('#nome').val(dataP[0]).trigger("change");
            $('#cargo').val(dataP[1]).trigger("change");
            $('#CPF').val(dataP[2]).trigger("change");
            $('#RG').val(dataP[3]).trigger("change");
            $('#descricao').val(dataP[4]).trigger("change");
            $('#estabelecimentos').val(dataP[5]).trigger("change");
        } else {
            formEditar.submit();
        }
    });
</script>
</body>
</html>
