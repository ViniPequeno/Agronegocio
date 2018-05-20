<% String css = "../_CSS/seu_negocio.css";%>
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
        }else if(!sessao.getAttribute("negocio").toString().equals(request.getParameter("negocio").toString())){
            sessao.setAttribute("negocio", ConsultaNegocio.findById(request.getParameter("negocio")));
        }
        List<Estabelecimento> estabelecimentos;
        estabelecimentos = ConsultaEstabelecimento.returnListOfNegocio(((Negocio) sessao.getAttribute("negocio")).getEmpresaCNPJ());
        if (estabelecimentos.size() > 0) {%>

    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Estabelecimentos</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
            <table class="table table-hover table-responsive-md btn-table" id="tableDados">
                <!--Table head-->
                <thead>
                    <tr>
                        <th> </th>
                        <th>Negócio</th>
                        <th>Proprietário</th>
                        <th>CNAE</th>
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
                            <input form="checks" type="checkbox" id="checkbox!<%=e.getSufixoCNPJ()%>" name="checkbox!<%=e.getSufixoCNPJ()%>">
                            <label for="checkbox!<%=e.getSufixoCNPJ()%>" class="label-table"></label>
                        </th>
                        <td><%=e.getNegocio().getNome()%></td>
                        <td class="proprietario"><%=e.getPerfil().getNome()%></td>
                        <td class="CNAE"><%=e.getCNAE()%></td>
                        <td class="sufixoCNPJ"><%=e.getSufixoCNPJ()%></td>
                        <td><a class="btn btn-cyan btn-rounded" href="../seusNegocios/estabelecimento.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>" data-toggle="tooltip" data-placement="bottom" title="Mais informações" role="button">
                                <i class="fa fa-ellipsis-h fa-lg mr-1" aria-hidden="true"></i></a></td>
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
    <h2 class="my-5 py-5 text-center">Nenhum estabelecimento registrado ainda</h2>
    <%}%>

    <a href="../cadastro/estabelecimento.jsp" class="btn btn-light-green btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Novo estabelecimento" role="button">
        <i class="fa fa-plus fa-lg mr-1" aria-hidden="true"></i></a>
    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Excluir estabelecimentos selecionados">
        <a href="" class="btn btn-danger btn-rounded mt-4 disabled mb-0" id="btnExcluir" role="button" data-toggle="modal" data-target="#confirmarExclusao">
        <i class="fa fa-trash fa-lg mr-1" aria-hidden="true"></i></a>
    </span>

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
                    <form id="checks" action="/Chicken_Tracker/EstabelecimentoServlet" method="post">
                        <button name="estabelecimento" type="submit" value="excluir" class="btn btn-primary">Confirmar</button>
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
                    <p id="endereco"> Endereço: </p>
                    <p id="qtdeFuncionarios">Quantidade de funcionários: </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Fechar</button>
                    <button name="estabelecimento" value="alterar" type="button" class="btn btn-primary" id="btnEditarConfirmar">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/paginacaoTabelas.js"></script>
<script src="../_JS/formUtils.js"></script>
<script src="../_JS/mascara.js"></script>
<script>
    dataE = "";
    var modalDetalhesInnerHTML = '<p id="negocio">Negócio: </p>' +
            '<p id="proprietario">Proprietário: </p>' +
            '<p id="cnae">CNAE: </p>' +
            '<p id="sufixoCNPJ"> Sufixo do CNPJ: </p>' +
            '<p id="CEP"> CEP: </p>' +
            '<p id="endereco"> Endereço: </p>' +
            '<p id="cidade-uf"> Cidade: </p>' +
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
        var sufixoCNPJ = campo[2];
        var cnae = campo[3];
        var CEP = campo[4];
        var rua = campo[5];
        var bairro = campo[6];
        var cidade = campo[7];
        var estado = campo[8];
        var qtdeFuncionarios = campo[9];

        $("#negocio").text("Negócio: " + negocio);

        $("#proprietario").text("Proprietário: " + proprietario);

        cnae = cnae.replace(/^(\d{5})(\d{1})(\d{2}).*/, '$1-$2/$3');
        $("#cnae").text("CNAE: " + cnae);

        sufixoCNPJ = sufixoCNPJ.replace(/^(\d{4})(\d{2}).*/, '$1-$2');
        $("#sufixoCNPJ").text("Sufixo do CNPJ: " + sufixoCNPJ);

        $("#CEP").text("CEP: " + CEP);
        
        $("#endereco").text("Endereço: " + rua+", "+bairro);
        
        $("#cidade-uf").text("Cidade: "+cidade+"/"+estado);

        $("#qtdeFuncionarios").text("Quantidade de funcionários: " + qtdeFuncionarios);
    });
</script>
<script>
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/EstabelecimentoServlet" >' +
            '<div class="md-form"><i class="fa fa-id-badge prefix grey-text"></i>' +
            '<input type="text" id="inputSufixoCNPJ" name="inputSufixoCNPJ" class="form-control" required autofocus maxlength="8">' +
            '<label for="inputSufixoCNPJ">Sufixo CNPJ</label></div>' +
            '<div class="md-form"><i class="fa fa-money-bill-alt prefix grey-text"></i>' +
            '<input type="text" id="inputCNAE" name="inputCNAE" class="form-control" required maxlength="7">' +
            '<label for="inputCNAE">CNAE</label></div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputCEP" name="inputCEP" class="form-control" required maxlength="80">' +
            '<label for="inputCEP">CEP</label> </div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputRua" name="inputRua" class="form-control" required maxlength="80">' +
            '<label for="inputRua">Rua</label> </div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputBairro" name="inputBairro" class="form-control" required maxlength="80">' +
            '<label for="inputBairro">Bairro</label> </div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputCidade" name="inputCidade" class="form-control" required maxlength="80">' +
            '<label for="inputCidade">Cidade</label> </div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputEstado" name="inputEstado" class="form-control" required maxlength="80">' +
            '<label for="inputEstado">Estado</label> </div>' +
            '</form>';
    $("#btnEditarConfirmar").click(function () {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            initInputs();
            $('#inputSufixoCNPJ').val(dataE[2]).trigger("change");
            $('#inputCNAE').val(dataE[3]).trigger("change");
            $('#inputCEP').val(dataE[4]).trigger("change");
            $('#inputRua').val(dataE[5]).trigger("change");
            $('#inputBairro').val(dataE[6]).trigger("change");
            $('#inputCidade').val(dataE[7]).trigger("change");
            $('#inputEstado').val(dataE[8]).trigger("change");
            var field = $('#inputSufixoCNPJ');
            field.mask('0000-00', {reverse: false});
            field = $('#inputCNAE');
            field.mask('00000-0/00', {reverse: false});
        } else {
            formEditar.submit();
        }
    });
</script>
</body>
</html>
