<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento" %>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Perfil" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<div class="container">

    <%  if (sessao.getAttribute("negocio") == null) {
            sessao.setAttribute("negocio", ConsultaNegocio.findById(request.getParameter("negocio")));
        }
        List<Estabelecimento> estabelecimentos;
        estabelecimentos = ConsultaEstabelecimento.returnListOfNegocio(((Negocio) sessao.getAttribute("negocio")).getEmpresaCNPJ());
        if (estabelecimentos.size() > 0) {%>

    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Negócios</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
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
                    <%  for (Estabelecimento e : estabelecimentos) {
                            String dataEstabelecimento = ConsultaEstabelecimento.returnValues(e);
                    %>
                    <tr data-estabelecimento="<%=dataEstabelecimento%>">
                        <th scope="row" class="pr-md-3 pr-5 mt-0">
                            <input form="checks" type="checkbox" id="checkbox!<%=e.getCNAE()%>" name="checkbox!<%=e.getCNAE()%>">
                            <label for="checkbox!<%=e.getCNAE()%>" class="label-table"></label>
                        </th>
                        <td><%=e.getNegocio().getNome()%></td>
                        <td><%=e.getPerfil().getNome()%></td>
                        <td><%=e.getCNAE()%></td>
                        <td><%=e.getEndereco()%></td>
                        <td><%=e.getSufixoCNPJ()%></td>
                        <td><a class="btn btn-cyan btn-rounded" href="../cadastro/estabelecimento.jsp.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Negócio" role="button">
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
    <h2 class="py-5 text-center">Nenhum estabelecimento registrado ainda</h2>
    <%}%>

    <a href="../cadastro/estabelecimento.jsp" class="btn btn-light-green btn-rounded mt-4" data-toggle="tooltip" data-placement="bottom" title="Novo estabelecimento" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded mt-4" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir estabelecimentos selecionados" role="button">
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
                    <p>Todos os funcionários associados a este estabelecimento também serão apagados</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <form id="checks" action="/Chicken_Tracker/NegocioDeleteServlet" method="post">
                        <button type="submit" class="btn btn-primary">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="detalhesEstabelecimento" tabindex="-1" role="dialog" aria-labelledby="detalhesEstabelecimento" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="bodyDetalhes">
                    <p id="negocio">Negócio: </p>
                    <p id="proprietario">Proprietário: </p>
                    <p id="cnae">CNAE: </p>
                    <p id="sufixoCNPJ"> Sufixo do CNPJ: </p>
                    <p id="empresaCNPJ"> CNPJ da empresa: </p>
                    <p id="endereco"> Endereço: </p>
                    <p id="qtdeFuncionarios">Quantidade de funcionários: </p>
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
    dataE = "";
    var modalDetalhesInnerHTML = '<p id="negocio">Negócio: </p>' +
            '<p id="proprietario">Proprietário: </p>' +
            '<p id="cnae">CNAE: </p>' +
            '<p id="sufixoCNPJ"> Sufixo do CNPJ: </p>' +
            '<p id="empresaCNPJ"> CNPJ da empresa: </p>' +
            '<p id="endereco"> Endereço: </p>' +
            '<p id="qtdeFuncionarios">Quantidade de funcionários: </p>';
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function () {
        $("#detalhesEstabelecimento").modal();
        $("#bodyDetalhes").html(modalDetalhesInnerHTML);
        $("#btnEditarConfirmar").text("Editar");

        var linha = $(this).closest('tr');
        var dados = linha.data('estabelecimento').toString();
        var campo = dados.split("#");
        dataE = campo;

        var negocio = campo[0];
        var proprietario = campo[1];
        var cnae = campo[2];
        var sufixoCNPJ = campo[3];
        var empresaCNPJ = campo[4];
        var endereco = campo[5];
        var qtdeFuncionarios = campo[6];

        $("#negocio").text("Negócio: " + negocio);

        $("#proprietario").text("Proprietário: " + proprietario);

        $("#cnae").text("CNAE: " + cnae);

        $("#sufixoCNPJ").text("Sufixo do CNPJ: " + sufixoCNPJ);

        $("#empresaCNPJ").text("CNPJ da empresa: " + empresaCNPJ);

        $("#endereco").text("Endereço: " + endereco);

        $("#qtdeFuncionarios").text("Quantidade de funcionários: " + qtdeFuncionarios);
    });
</script>
<script>
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/EstabelecimentoAlterarServlet" name="formEditar">' +
            '<div class="md-form"><i class="fa fa-id-badge prefix grey-text"></i>' +
            '<input type="text" id="inputSufixoCNPJ" name="inputSufixoCNPJ" class="form-control" required autofocus maxlength="8">' +
            '<label for="inputSufixoCNPJ">Sufixo CNPJ</label></div>' +
            '<div class="md-form"><i class="fa fa-money-bill-alt prefix grey-text"></i>' +
            '<input type="text" id="inputCNAE" name="inputCNAE" class="form-control" required maxlength="7">' +
            '<label for="inputCNAE">CNAE</label></div>' +
            '<div class="md-form"><i class="fa fa-warehouse prefix grey-text"></i>' +
            '<input type="text" id="inputEndereco" name="inputEndereco" class="form-control" required maxlength="80">' +
            '<label for="inputEndereco">Endereço</label> </div>' +
            '</form>';
    $("#btnEditarConfirmar").click(function () {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            $('#negocio').val(dataE[0]).trigger("change");
            $('#proprietario').val(dataE[1]).trigger("change");
            $('#cnae').val(dataE[2]).trigger("change");
            $('#sufixoCNPJ').val(dataE[3]).trigger("change");
            $('#empresaCNPJ').val(dataE[4]).trigger("change");
            $('#endereco').val(dataE[5]).trigger("change");
            $('#qtdeFuncionarios').val(dataE[6]).trigger("change");
        } else {
            formEditar.submit();
        }
    });
</script>
</body>
</html>
