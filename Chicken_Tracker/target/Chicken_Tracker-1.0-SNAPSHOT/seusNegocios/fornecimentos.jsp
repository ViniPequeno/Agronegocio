<% String css = "../css/seu_negocio.css";
   String titulo ="Fornecimentos";%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Fornecimento.ConsultaFornecimento" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Fornecimento" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Fornecimentos</h2>

    <%
        Negocio n = (Negocio) request.getSession().getAttribute("negocio");
        if (sessao.getAttribute("estabelecimento") == null) {
            sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento")));
        } else if (!sessao.getAttribute("estabelecimento").toString().equals(request.getParameter("negocio"))) {
            sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento")));
        }
        List<Fornecimento> fornecimentos;
        fornecimentos = ConsultaFornecimento.returnList(request.getParameter("estabelecimento"));
        if (fornecimentos.size() > 0) {%>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Fornecimentos</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
            <table class="table table-hover table-responsive-lg btn-table" id="tableDados">
                <!--Table head-->
                <thead>
                    <tr>
                        <th class="check-column"> </th>
                        <th>Nome</th>
                        <th>CNPJ</th>
                        <th>Produto</th>
                        <th>Preço</th>
                        <th>Quantidade</th>
                        <th>Data de vencimento</th>
                        <th></th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <%  for (Fornecimento f : fornecimentos) {
                            String dataFornecimento = ConsultaFornecimento.returnValues(f);
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");%>
                    <tr data-fornecimento="<%=dataFornecimento%>">
                        <th scope="row" class="pr-md-3 pr-5">
                            <input form="checks" type="checkbox" id="checkbox!<%=f.getId()%>" name="checkbox!<%=f.getId()%>">
                            <label for="checkbox!<%=f.getId()%>" class="label-table"></label>
                        </th>
                        <td class="nomeEmpresa"><%=f.getNome()%></td>
                        <td class="CNPJCompleto"><%=f.getCNPJ()%></td>
                        <td><%=f.getProduto().getNome()%></td>
                        <td>R$ <%=f.getPagamento()%></td>
                        <td><%=f.getQuantidade()%></td>
                        <td><%=dateFormat.format(f.getVencimento())%></td>
                        <td><a class="btn btn-primary btn-rounded" role="button" data-toggle="modal" data-target="#pagarSelecionados">
                                <i class="fa fa-money-bill-alt fa-lg mr-1" aria-hidden="true"></i>Pagar</a>
                        </td>
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
    <h2 class="my-5 py-5 text-center">Nenhum fornecimento registrado ainda</h2>
    <%}%>
    <a href="../cadastro/fornecimento.jsp" class="btn btn-light-green btn-rounded mt-4" data-toggle="tooltip" data-placement="bottom" title="Novo fornecimento" role="button">
        <i class="fa fa-plus fa-lg mr-1" aria-hidden="true"></i></a>
    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Excluir fornecimentos selecionados">
        <a href="" class="btn btn-danger btn-rounded mt-4 disabled" id="btnExcluir" role="button" data-toggle="modal" data-target="#confirmarExclusao">
            <i class="fa fa-trash fa-lg mr-1" aria-hidden="true"></i></a>
    </span>
    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Pagar fornecimento(s) selecionado(s)">
        <a href="" class="btn btn-primary btn-rounded mt-4 disabled" id="btnPagar" role="button" data-toggle="modal" data-target="#pagarSelecionados">
            <i class="fa fa-money-bill-alt fa-lg mr-1" aria-hidden="true"></i></a>
    </span>
    <button id="btnBaixarPDF" class="btn btn-mdb-color btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Exportar para PDF">
        <i class="fa fa-file-pdf fa-lg mr-1" aria-hidden="true"></i></button>
    <form id="checks"></form>

    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="labelExcluir" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-danger" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title heading lead" id="labelExclusao">Confirmar exclusão?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center"> 
                        <i class="fa fa-trash-alt fa-4x mb-3 animated rotateIn"></i>
                        <p>Esta ação não pode ser desfeita</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Cancelar</button>
                    <button form="checks" formaction="/Chicken_Tracker/FornecimentoServlet" formmethod="post" name="fornecimento" value="excluir" type="submit" class="btn btn-danger">Confirmar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="pagarSelecionados" tabindex="-1" role="dialog" aria-labelledby="pagarSelecionados" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelPagar">Pagar fornecimentos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Todos os fornecimentos selecionados terão seus devidas contas consideradas pagas.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <button form="checks" formmethod="post" formaction="/Chicken_Tracker/FornecimentoServlet" name="fornecimento" value="pagar" type="submit" class="btn btn-primary">Confirmar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="detalhesFornecimento" tabindex="-1" role="dialog" aria-labelledby="labelDetalhes" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header blue-grey">
                    <h5 class="modal-title white-text" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="bodyDetalhes">
                    <p id="nome"> Nome: </p>
                    <p id="CNPJ" class="CNPJ"> CNPJ: </p>
                    <p id="email"> Email: </p>
                    <p id="preco"> Preço: R$ </p>
                    <p id="produto"> Produto: </p>
                    <p id="qtde"> Quantidade: </p>
                    <p id="dataVencimento"> Data de vencimento: </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Fechar</button>
                    <button name="fornecimento" value="alterar" type="button" class="btn btn-primary" id="btnEditarConfirmar">Editar</button>
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
<script src="../js/exportTableToPDF.js"></script>
<script>
    var dataF = "";
    var modalDetalhesInnerHTML =
            '<p id="nome"> Nome: </p>' +
            '<p id="CNPJ" class="CNPJ"> CNPJ: </p>' +
            '<p id="email"> Email: </p>' +
            '<p id="produto"> Produto: </p>' +
            '<p id="preco"> Preço: R$</p>' +
            '<p id="qtde"> Quantidade: </p>' +
            '<p id="dataVencimento"> Data de vencimento:';
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function () {
        $("#detalhesFornecimento").modal();
        $("#bodyDetalhes").html(modalDetalhesInnerHTML);
        $("#btnEditarConfirmar").text("Editar");

        var linha = $(this).closest('tr');
        var dados = linha.data('fornecimento').toString();
        var campo = dados.split("#");
        dataF = campo;

        var nome = campo[0];
        var CNPJ = campo[1];
        var email = campo[2];
        var nomeProduto = campo[3];
        var preco = parseFloat(campo[4]);
        var qtde = campo[5];
        var vencimento = campo[6];

        $("#nome").text("Nome: " + nome);

        CNPJ = CNPJ.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2}).*/, '$1.$2.$3/$4-$5');
        $("#CNPJ").text("CNPJ: " + CNPJ);

        $("#email").text("Email: " + email);

        $("#produto").text("Produto: " + nomeProduto);

        $("#preco").text("Preço: R$ " + preco);

        $("#qtde").text("Quantidade: " + qtde);

        $("#dataVencimento").text("Data de Vencimento: " + vencimento);
    });
    var modalEditarInnerHTML =
            '<form action="/Chicken_Tracker/FornecimentoServlet" method="post" name="formEditar" id="formEditar">' +
            '<div class="md-form"><i class="fa fa-id-card prefix grey-text"></i>' +
            '<input type="text" id="inputCNPJCompleto" name="inputCNPJCompleto" class="form-control" required readonly maxlength="18">' +
            '<label for="inputCNPJCompleto">CNPJ</label></div>' +
            '<div class="md-form"><i class="fa fa-user prefix grey-text"></i>' +
            '<input type="text" id="inputNome" name="inputNome" class="form-control" autofocus required>' +
            '<label for="inputNome">Nome</label></div>' +
            '<div class="md-form"><i class="fa fa-at prefix grey-text"></i>' +
            '<input type="email" id="inputEmail" name="inputEmail" class="form-control">' +
            '<label for="inputEmail">Email</label></div>' +
            '<div class="md-form"><i class="fa fa-box prefix grey-text"></i>' +
            '<input type="number" id="inputQtde" name="inputQtde" class="form-control" required min="0" maxlength="5">' +
            '<label for="inputQtde">Quantidade</label></div>' +
            '<div class="md-form"><i class="fa fa-money-bill-alt prefix grey-text"></i>' +
            '<input type="text" id="inputValorPagamento" name="inputValorPagamento" class="form-control" required maxlength="20">' +
            '<label for="inputValorPagamento">Valor do pagamento</label></div>' +
            '<div class="md-form"><i class="fa fa-calendar-alt prefix grey-text"></i>' +
            '<input type="text" id="inputDataVencimento" name="inputDataVencimento" class="form-control" required maxlength="10">' +
            '<label for="inputDataVencimento">Data de vencimento</label></div>' +
            '</form>';
    $("#btnEditarConfirmar").click(function (event) {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $(this).attr('type', 'submit');
            event.preventDefault();
            $(this).attr('form', 'formEditar');
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            initInputs();
            $('#inputNome').val(dataF[0]).trigger("change");
            $('#inputCNPJCompleto').val(dataF[1]).trigger("change");
            $('#inputEmail').val(dataF[2]).trigger("change");
            $('#inputCargo').val(dataF[3]).trigger("change");
            $('#inputValorPagamento').val(parseFloat(dataF[4])).trigger("change");
            $('#inputQtde').val(dataF[5]).trigger("change");
            $('#inputDataVencimento').val(dataF[6]).trigger("change");
            $('#inputValorPagamento').maskMoney({prefix: 'R$ ', thousands: '.', decimal: ','}).trigger('mask.maskMoney');
            $('#inputCNPJCompleto').mask('00.000.000/0000-00');
            $('#inputDataVencimento').mask('00/00/0000');
        } else {
            var value = $('#inputValorPagamento').maskMoney('unmasked')[0];
            $('#inputValorPagamento').val(value);
            $('#inputCNPJCompleto').unmask('00.000.000/0000-00');
            formEditar.submit();
        }
    });
</script>
</body>
</html>
