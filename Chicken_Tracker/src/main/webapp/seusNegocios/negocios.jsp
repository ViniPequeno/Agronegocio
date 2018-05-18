<% String css = "../_CSS/seu_negocio.css";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <%  //Gera tabela se houver algum registro
        List<Negocio> negocios = null;
        negocios = ConsultaNegocio.returnListOfPerfil(sessao.getAttribute("nome_usuario").toString());
        if (negocios.size() > 0) {
    %>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Negócios</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
            <table class="table table-hover table-responsive-md btn-table" id="tableDados">
                <!--Table head-->
                <thead>
                    <tr>
                        <th> </th>
                        <th>Nome</th>
                        <th>Proprietário</th>
                        <th>CNPJ</th>
                        <th>Email</th>
                        <th>Link Facebook</th>
                        <th>Link Instagram</th>
                        <th></th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <% //Percorrer List de negócios e adiconando linhas à tabela
                        for (Negocio n : negocios) {
                            String dataNegocio = ConsultaNegocio.returnValues(n);
                    %>
                    <tr data-negocio="<%=dataNegocio%>">
                        <th scope="row" class="pr-md-3 pr-5 mt-0">
                            <input form="checks" type="checkbox" id="checkbox!<%=n.getEmpresaCNPJ()%>" name="checkbox!<%=n.getEmpresaCNPJ()%>">
                            <label for="checkbox!<%=n.getEmpresaCNPJ()%>" class="label-table"></label>
                        </th>
                        <td><%=n.getNome()%></td>
                        <td class="proprietario"><%=n.getPerfil().getNome()%></td>
                        <td class="maskCNPJ"><%=n.getEmpresaCNPJ()%></td>
                        <td><%=n.getLinkEmail()%></td>
                        <td><%=n.getLinkFacebook()%></td>
                        <td><%=n.getLinkInstagram()%></td>
                        <td><a class="btn btn-cyan btn-rounded" href="../seusNegocios/estabelecimentos.jsp?negocio=<%=n.getEmpresaCNPJ()%>" data-toggle="tooltip" data-placement="bottom" title="Mostrar Estabelecimentos" role="button">
                                <i data-fa-transform="grow-8" class="fa fa-clipboard-list mr-1" aria-hidden="true"></i></a></td>
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
    <h2 class="py-5 text-center">Nenhum negócio registrado ainda</h2>
    <%}%>

    <a href="../cadastro/negocio.jsp" class="btn btn-light-green btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Novo negócio" role="button">
        <i class="fa fa-plus fa-lg mr-1" aria-hidden="true"></i></a>

    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Excluir negócios selecionados">
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
                    <p>Todos os estabelecimentos associados a este negócio também serão apagados</p>
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
    <!-- Modal -->
    <div class="modal fade" id="detalhesNegocio" tabindex="-1" role="dialog" aria-labelledby="detalhesNegocio" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id='bodyDetalhes'>
                    <p id="nome"> Nome: </p>
                    <p id="proprietario"> Proprietário: </p>
                    <p id="cnpj"> CNPJ: </p>
                    <p id="email"> Email: </p>
                    <p id="linkFB"> Link da página do Facebook: </p>
                    <p id="linkInstagram"> Link da página do Instagram: </p>
                    <p id="fone1"> Fone 1: </p>
                    <p id="fone2"> Fone 2: </p>
                    <p id="estabelecimentos"> Estabelecimentos: </p>
                </div>
                <div class="modal-footer">
                    <a id="btnEstabelecimentos" href="" type="button" class="btn btn-outline-primary">Estabelecimentos</a>
                    <button id="btnCancelarEdicao" type="button" class="btn btn-outline-primary d-none">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="btnEditarConfirmar">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/paginacaoTabelas.js"></script>
<script src="../_JS/formUtils.js"></script>
<script src="../_JS/mascara.js"></script>
<script type="text/javascript">
    dataN = "";
    var linha;
    var modalDetalhesInnerHTML = '<p id="nome"> Nome: </p>' +
            '<p id="proprietario"> Proprietário: </p>' +
            '<p id="cnpj"> CNPJ: </p>' +
            '<p id="email"> Email: </p>' +
            '<p id="linkFB"> Link da página do Facebook: </p>' +
            '<p id="linkInstagram"> Link da página do Instagram: </p>' +
            '<p id="fone1"> Fone 1: </p>' +
            '<p id="fone2"> Fone 2: </p>' +
            '<p id="estabelecimentos"> Estabelecimentos: </p>';
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function (event) {
        $("#detalhesNegocio").modal();
        linha = $(this).closest('tr');
        resetModalData();
    });

    function resetModalData() {
        $("#bodyDetalhes").html(modalDetalhesInnerHTML);
        $("#btnEditarConfirmar").text("Editar");

        var dados = linha.data('negocio').toString();
        var campo = dados.split("#");
        dataN = campo;
        var nome = campo[0];
        var proprietario = campo[1];
        var cnpj = campo[2];
        var email = campo[3];
        var facebook = campo[4];
        var instagram = campo[5];

        var fones = campo[6].split("&");
        var fone1 = fones[0];
        var fone2 = fones[1];

        var estabelecimentos = campo[7];

        $("#btnEstabelecimentos").attr('href', '../seusNegocios/estabelecimentos.jsp?negocio=' + cnpj);

        $("#nome").text("Nome: " + nome);

        $("#proprietario").text("Proprietário: " + proprietario);

        cnpj = cnpj.replace(/^(\d{2})(\d{3})(\d{3}).*/, '$1.$2.$3');
        $("#cnpj").text("CNPJ: " + cnpj);

        $("#email").text("Email: " + email);

        $("#linkFB").text("Link da página do Facebook: " + facebook);

        $("#linkInstagram").text("Link da página do Instagram: " + instagram);

        $("#estabelecimentos").text("Estabelecimentos: " + estabelecimentos);

        $("#fone1").text("Fone 1: " + fone1);
        $("#fone2").text("Fone 2: " + fone2);
    }
</script>
<script>
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/NegocioAlterarServlet" name="formEditar">' +
            '<div class="md-form"><i class="fa fa-user prefix grey-text"></i>' +
            '<input type="text" name="inputNome" id="inputNome" class="form-control" placeholder=" " autofocus required>' +
            '<label for="inputNome">Nome</label></div>' +
            '<div class="md-form"><i class="fa fa-envelope prefix grey-text"></i>' +
            '<input type="text" name="inputEmail" id="inputEmail" class="form-control" placeholder=" " required>' +
            '<label for="inputEmail">Email</label></div>' +
            '<div class="md-form"><i class="far fa-id-card prefix grey-text"></i>' +
            '<input type="text" name="inputCNPJ" id="inputCNPJ" class="form-control" placeholder=" " required>' +
            '<label for="inputCNPJ">CNPJ</label></div>' +
            '<div class="md-form"><i class="fab fa-facebook prefix grey-text"></i>' +
            '<input type="text" name="inputLinkFB" id="inputLinkFB" class="form-control" placeholder=" " required>' +
            '<label for="inputLinkFB">Facebook</label></div>' +
            '<div class="md-form"><i class="fab fa-instagram prefix grey-text"></i>' +
            '<input type="text" name="inputLinkInstagram" id="inputLinkInstagram" placeholder=" " class="form-control" required>' +
            '<label for="inputLinkInstagram">Instagram</label></div>' +
            '<div class="md-form"><i class="fa fa-phone prefix grey-text"></i>' +
            '<input type="text" name="inputFone1" id="inputFone1" class="form-control" placeholder=" " required>' +
            '<label for="inputFone1">Telefone 1</label></div>' +
            '<div class="md-form"><i class="fa fa-phone prefix grey-text"></i>' +
            '<input type="text" name="inputFone2" id="inputFone2" class="form-control" placeholder=" " required>' +
            '<label for="inputFone2">Telefone 2</label></div>' +
            '</form>';
    $('#btnCancelarEdicao').click(function () {
        $(this).addClass('d-none');
        $('#btnEstabelecimentos').removeClass('d-none');
        $('#btnEditarConfirmar').text('Editar');
        resetModalData();
    });
    $("#btnEditarConfirmar").click(function () {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $('#btnCancelarEdicao').removeClass('d-none');
            $('#btnEstabelecimentos').addClass('d-none');
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            initInputs();
            $('#inputNome').val(dataN[0]).trigger("change");
            $('#inputEmail').val(dataN[3]).trigger("change");
            $('#inputCNPJ').val(dataN[2]).trigger("change");
            $('#inputLinkFB').val(dataN[4]).trigger("change");
            $('#inputLinkInstagram').val(dataN[5]).trigger("change");
            $('#inputFone1').val(dataN[6].split("&")[0]).trigger("change");
            $('#inputFone2').val(dataN[6].split("&")[1]).trigger("change");
            var $seuCampo = $('#inputCNPJ');
            $seuCampo.mask('00.000.000', {reverse: false});
            initInputs();
        } else {
            formEditar.submit();
        }
    });
    $('.maskCNPJ').mask('00.000.000', {reverse: false});
</script>
</body>
</html>
