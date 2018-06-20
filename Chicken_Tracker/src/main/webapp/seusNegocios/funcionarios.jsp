<% String css = "../css/seu_negocio.css";%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Funcionario.ConsultaFuncionario" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Funcionario" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">

    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>
        Gerenciar Funcionários</h2>

    <%
        if (sessao.getAttribute("estabelecimento") == null) {
            sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento")));
        } else if (!sessao.getAttribute("estabelecimento").toString().equals(request.getParameter("negocio"))) {
            sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento")));
        }
        List<Funcionario> funcionarios;
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
            <table id="tableDados" class="table table-hover table-responsive-lg">
                <!--Table head-->
                <thead>
                    <tr>
                        <th></th>
                        <th>Nome</th>
                        <th>Cargo</th>
                        <th>CPF</th>
                        <th>RG</th>
                        <th>Salário</th>
                        <th>Situação</th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <%  for (Funcionario f : funcionarios) {
                            String dataFuncionario = ConsultaFuncionario.returnValues(f, request.getParameter("estabelecimento"));
                            String cargo = dataFuncionario.split("#")[3];
                            String situacao = dataFuncionario.split("#")[4];
                            double salario = Double.parseDouble(dataFuncionario.split("#")[5]);%>
                    <tr data-funcionario="<%=dataFuncionario%>">
                        <th scope="row" class="pr-md-3 pr-5">
                            <input form="checks" type="checkbox" id="checkbox!<%=f.getCPF()%>" name="checkbox!<%=f.getCPF()%>">
                            <label for="checkbox!<%=f.getCPF()%>" class="label-table"></label>
                        </th>
                        <td><%=f.getNome()%></td>
                        <td><%=cargo%></td>
                        <td class="maskCPF"><%=f.getCPF()%></td>
                        <td class="maskRG"><%=f.getRG()%></td>
                        <td class="maskSalario">R$ <%=salario%></td>
                        <td><%=situacao%></td>
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
    <h2 class="my-5 py-5 text-center">Nenhum funcionário registrado ainda</h2>
    <%}%>

    <a href="../cadastro/funcionario.jsp" class="btn btn-light-green btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Novo funcionário" role="button">
        <i class="fa fa-plus fa-lg mr-1" aria-hidden="true"></i></a>
    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Excluir funcionários selecionados">
        <a href="" class="btn btn-danger btn-rounded mt-4 disabled mb-0" id="btnExcluir" role="button" data-toggle="modal" data-target="#confirmarExclusao">
            <i class="fa fa-trash fa-lg mr-1" aria-hidden="true"></i></a>
    </span>
    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Pagar funcionário(s) selecionado(s)">
        <a href="" class="btn btn-primary btn-rounded mt-4 disabled mb-0" id="btnPagar" role="button" data-toggle="modal" data-target="#pagarSelecionados">
            <i class="fa fa-money-bill-alt fa-lg mr-1" aria-hidden="true"></i></a>
    </span>
    <button id="btnBaixarPDF" class="btn btn-mdb-color btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Exportar para PDF">
        <i class="fa fa-file-pdf fa-lg mr-1" aria-hidden="true"></i></button>
        
    <form id="checks"></form>

    <!-- Modal -->
    <div class="modal fade" id="pagarSelecionados" tabindex="-1" role="dialog" aria-labelledby="pagarSelecionados" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelPagar">Pagar funcionários</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Todos os funcionários selecionados terão seus devidos salários considerados pagos.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <form id="checksPagar" action="/Chicken_Tracker/FuncionarioServlet" method="post">
                        <button form="checks" formaction="/Chicken_Tracker/FuncionarioServlet" formmethod="post" name="funcionario" value="pagar" type="submit" class="btn btn-primary">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

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
                    <button form="checks" formaction="/Chicken_Tracker/FuncionarioServlet" formmethod="post" name="funcionario" value="excluir" type="submit" class="btn btn-primary">Confirmar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="detalhesFuncionario" tabindex="-1" role="dialog" aria-labelledby="labelDetalhes" aria-hidden="true">
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
                    <p id="salario"> Salário: R$</p>
                    <p id="situacao"> Situação: </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Fechar</button>
                    <button name="funcionario" value="alterar" type="button" class="btn btn-primary" id="btnEditarConfirmar">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/paginacaoTabelas.js"></script>
<script src="../js/formUtils.js"></script>
<script src="../js/mascara.js"></script>
<script src="../js/maskMoney.js"></script>
<script>
    var dataF = "";
    var modalDetalhesInnerHTML = '<p id="nome"> Nome: </p>' +
            '<p id="cargo"> Cargo:</p>' +
            '<p id="CPF"> CPF: </p>' +
            '<p id="RG"> RG: </p>' +
            '<p id="salario"> Salário: R$</p>' +
            '<p id="situacao"> Situação: </p>';
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function () {
        $("#detalhesFuncionario").modal();
        $("#bodyDetalhes").html(modalDetalhesInnerHTML);
        $("#btnEditarConfirmar").text("Editar");

        var linha = $(this).closest('tr');
        var dados = linha.data('funcionario').toString();
        var campo = dados.split("#");
        dataF = campo;

        var CPF = campo[0];
        var nome = campo[1];
        var RG = campo[2];
        var cargo = campo[3];
        var situacao = campo[4];
        var salario = campo[5];

        $("#nome").text("Nome: " + nome);

        $("#cargo").text("Cargo: " + cargo);

        CPF = CPF.replace(/^(\d{3})(\d{3})(\d{3})(\d{2}).*/, '$1.$2.$3-$4');
        $("#CPF").text("CPF: " + CPF);

        RG = RG.replace(/^(\d{2})(\d{3})(\d{3})(\d{1}).*/, '$1.$2.$3-$4');
        $("#RG").text("RG: " + RG);

        $("#situacao").text("Situação: " + situacao);

        $("#salario").text("Salário: R$ " + salario);
    });
</script>
<script>
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/FuncionarioServlet" name="formEditar">' +
            '<div class="md-form"><i class="fa fa-user prefix grey-text"></i>' +
            '<input type="text" id="inputNome" name="inputNome" class="form-control" required autofocus maxlength="80">' +
            '<label for="inputNome">Nome</label></div>' +
            '<div class="md-form"><i class="fa fa-id-card prefix grey-text"></i>' +
            '<input type="text" id="inputCPF" name="inputCPF" class="form-control" required readonly maxlength="14">' +
            '<label for="inputCPF">CPF</label></div>' +
            '<div class="md-form"><i class="fas fa-address-card prefix grey-text"></i>' +
            '<input type="text" id="inputRG" name="inputRG" class="form-control" required maxlength="14">' +
            '<label for="inputRG">RG</label></div>' +
            '<div class="md-form"><i class="fa fa-clipboard prefix grey-text"></i>' +
            '<input type="text" id="inputCargo" name="inputCargo" class="form-control" required maxlength="80">' +
            '<label for="inputCargo">Cargo</label></div>' +
            '<div class="md-form"><i class="fa fa-money-bill-alt prefix grey-text"></i>' +
            '<input type="text" id="inputSalario" name="inputSalario" class="form-control" required maxlength="80">' +
            '<label for="inputSalario">Salário</label></div>' +
            '<div class="md-form"><i class="fa fa-clipboard-list prefix grey-text"></i>' +
            '<textarea id="inputSituacao" name="inputSituacao" class="form-control md-textarea" rows="3" required=""></textarea>' +
            '<label for="inputSituacao">Situação</label></div>' +
            '</form>';
    $("#btnEditarConfirmar").click(function () {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            initInputs();
            $('#inputCPF').val(dataF[0]).trigger("change");
            $('#inputNome').val(dataF[1]).trigger("change");
            $('#inputRG').val(dataF[2]).trigger("change");
            $('#inputCargo').val(dataF[3]).trigger("change");
            $('#inputSituacao').val(dataF[4]).trigger("change");
            $('#inputSalario').val(dataF[5]).trigger("change");
            $('#inputCPF').mask('000.000.000-00', {reverse: false});
            $('#inputRG').mask('00.000.000-0', {reverse: false});
            $('#inputSalario').maskMoney({prefix: 'R$ ', thousands: '.', decimal: ','}).trigger('mask.maskMoney');
        } else {
            var value = $('#inputSalario').maskMoney('unmasked')[0];
            $('#inputSalario').val(value);
            $('#inputCPF').unmask('00.000.000');
            formEditar.submit();
        }
    });
    $('.maskCPF').mask('000.000.000-00', {reverse: false});
    $('.maskRG').mask('00.000.000-0', {reverse: false});
</script>
</body>
</html>
