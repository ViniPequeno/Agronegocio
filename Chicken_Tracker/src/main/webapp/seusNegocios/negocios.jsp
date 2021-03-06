<% String css = "../css/seu_negocio.css";
    String titulo = "Seus Neg�cios";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <!--h2 class="py-5 font-weight-bold text-left blue-text"><a onclick="goBack()"><i class="fa fa-arrow-left mr-1" aria-hidden="true"></i> Voltar</a></h2-->
    <br>
    <%  //Gera tabela se houver algum registro
        List<Negocio> negocios = null;
        negocios = ConsultaNegocio.returnListOfPerfil(sessao.getAttribute("nome_usuario").toString());
        if (negocios.size() > 0) {
    %>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Seus Neg�cios</h4>

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
                        <th>Propriet�rio</th>
                        <th>CNPJ</th>
                        <th>Email</th>
                        <th>Facebook<i class="fab fa-facebook-f ml-1"></i></th>
                        <th>Instagram<i class="fab fa-instagram ml-1"></i></th>
                        <th></th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <% //Percorrer List de neg�cios e adiconando linhas � tabela
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
                        <td class="CNPJ"><%=n.getEmpresaCNPJ()%></td>
                        <td><%=n.getEmail()%></td>
                        <td><a target="_blank" href="http://<%=n.getLinkFacebook()%>"><%=n.getLinkFacebook()%><i class="fas fa-external-link-alt ml-1"></i></a></td>
                        <td><a target="_blank" href="http://instagram.com/<%=n.getUserInstagram()%>"><%=n.getUserInstagram()%><i class="fas fa-external-link-alt ml-1"></i></a></td>
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
                            <a class="page-link" aria-label="Pr�ximo">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Pr�ximo</span>
                            </a>
                        </li>

                        <!--Last-->
                        <li id="last-item" class="page-item clearfix d-none d-md-block"><a class="page-link">�ltimo</a></li>

                    </ul>
                </nav>
                <!--/Pagination -->

            </div>
            <!--Bottom Table UI-->
        </div> 
    </div>
    <%} else {%>
    <h2 class="my-5 py-5 text-center">Nenhum neg�cio registrado ainda</h2>
    <%}%>

    <a href="../cadastro/negocio.jsp" class="btn btn-light-green btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Novo neg�cio" role="button">
        <i class="fa fa-plus fa-lg mr-1" aria-hidden="true"></i></a>

    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Excluir neg�cios selecionados">
        <a href="" class="btn btn-danger btn-rounded mt-4 disabled mb-0" id="btnExcluir" role="button" data-toggle="modal" data-target="#confirmarExclusao">
            <i class="fa fa-trash fa-lg mr-1" aria-hidden="true"></i></a>
    </span>

    <button id="btnBaixarPDF" class="btn btn-mdb-color btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Exportar para PDF">
        <i class="fa fa-file-pdf fa-lg mr-1" aria-hidden="true"></i></button>

    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="confirmarExclusao" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-danger" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title heading lead" id="labelExclusao">Confirmar exclus�o?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center"> 
                        <i class="fa fa-trash-alt fa-4x mb-3 animated rotateIn"></i>
                        <p>Todos os estabelecimentos associados a este neg�cio tamb�m ser�o apagados</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Cancelar</button>
                    <form id="checks" action="/Chicken_Tracker/NegocioServlet" method="post">
                        <button name="negocio" value="excluir" type="submit" class="btn btn-danger">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="detalhesNegocio" tabindex="-1" role="dialog" aria-labelledby="labelDetalhes" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header blue-grey">
                    <h5 class="modal-title white-text" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close white-ic" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id='bodyDetalhes'>
                    <p id="nome"> Nome: </p>
                    <p id="proprietario"> Propriet�rio: </p>
                    <p id="cnpj"> CNPJ: </p>
                    <p id="email"> Email: </p>
                    <p id="fone1"> Fone 1: </p>
                    <p id="fone2"> Fone 2: </p>
                    Redes Sociais: 
                    <a id="btnFace" type="button" class="btn-floating btn-sm mx-1 btn-fb" href="" target="_blank">
                        <i class="fab fa-facebook-f fa-lg"></i>
                    </a>
                    <a id="btnInsta" type="button" class="btn-floating btn-sm mx-1 btn-ins" target="_blank">
                        <i class="fab fa-instagram fa-lg"></i>
                    </a>
                    <p id="estabelecimentos"> Estabelecimentos: </p>
                </div>
                <div class="modal-footer">
                    <a id="btnEstabelecimentos" href="" type="button" class="btn btn-outline-primary">Estabelecimentos</a>
                    <button id="btnCancelarEdicao" type="button" class="btn btn-outline-primary d-none">Cancelar</button>
                    <button name="negocio" value="alterar" type="button" class="btn btn-primary" id="btnEditarConfirmar">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/paginacaoTabelas.js"></script>
<script src="../js/formUtils.js"></script>
<script src="../js/mascara.js"></script>
<script src="../js/exportTableToPDF.js"></script>
<script type="text/javascript">
    dataN = "";
    var linha;
    var modalDetalhesInnerHTML = '<p id="nome"> Nome: </p>' +
            '<p id="proprietario"> Propriet�rio: </p>' +
            '<p id="cnpj"> CNPJ: </p>' +
            '<p id="email"> Email: </p>' +
            '<p id="fone1"> Fone 1: </p>' +
            '<p id="fone2"> Fone 2: </p>' +
            '<p id="estabelecimentos"> Estabelecimentos: </p>' +
            'Redes Sociais: ' +
            '<a id="btnFace" type="button" class="btn-floating btn-sm mx-1 btn-fb" href="" target="_blank"><i class="fab fa-facebook-f fa-lg"></i></a>' +
            '<a id="btnInsta" type="button" class="btn-floating btn-sm mx-1 btn-ins" target="_blank"><i class="fab fa-instagram fa-lg"></i></a>';
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
        var fone1 = campo[6] !== "null" ? campo[6] : "------";
        var fone2 = campo[7] !== "null" ? campo[7] : "------";

        var estabelecimentos = campo[8];

        $("#btnEstabelecimentos").attr('href', '../seusNegocios/estabelecimentos.jsp?negocio=' + cnpj);

        $("#nome").text("Nome: " + nome);

        $("#proprietario").text("Propriet�rio: " + proprietario);

        cnpj = cnpj.replace(/^(\d{2})(\d{3})(\d{3}).*/, '$1.$2.$3');
        $("#cnpj").text("CNPJ: " + cnpj);

        $("#email").text("Email: " + email);

        $("#btnFace").attr("href", "http://" + facebook);
        $("#btnInsta").attr("href", "http://www.instagram.com/" + instagram);

        $("#estabelecimentos").text("Estabelecimentos: " + estabelecimentos);

        $("#fone1").text("Fone 1: " + fone1);
        $("#fone2").text("Fone 2: " + fone2);
    }
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/NegocioServlet" name="formEditar">' +
            '<div class="md-form"><i class="fa fa-user prefix grey-text"></i>' +
            '<input type="text" name="inputNome" id="inputNome" class="form-control" autofocus required>' +
            '<label for="inputNome">Nome</label></div>' +
            '<div class="md-form"><i class="fa fa-envelope prefix grey-text"></i>' +
            '<input type="email" name="inputEmail" id="inputEmail" class="form-control validate" required>' +
            '<label for="inputEmail" data-error="Email inv�lido">Email para contato</label></div>' +
            '<div class="md-form"><i class="far fa-id-card prefix grey-text"></i>' +
            '<input type="text" name="inputCNPJ" id="inputCNPJ" class="form-control" readonly="true" required>' +
            '<label for="inputCNPJ">CNPJ</label></div>' +
            '<div class="md-form"><i class="fab fa-facebook prefix grey-text"></i>' +
            '<input type="url" id="inputLinkFB" name="inputLinkFB" class="form-control" maxlength="80">' +
            '<label for="inputLinkFB">Link do perfil do Facebook</label></div>' +
            '<div class="md-form"><i class="fab fa-instagram prefix grey-text"></i>' +
            '<input type="text" name="inputUserInstagram" id="inputLinkInstagram" class="form-control" required>' +
            '<label for="inputUserInstagram">Nome de usu�rio Instagram</label></div>' +
            '<div class="md-form"><i class="fa fa-phone prefix grey-text"></i>' +
            '<input type="text" name="inputTelefone1" id="inputTelefone1" class="form-control" required>' +
            '<label for="inputTelefone1">Telefone 1</label></div>' +
            '<div class="md-form"><i class="fa fa-phone prefix grey-text"></i>' +
            '<input type="text" name="inputTelefone2" id="inputTelefone2" class="form-control" required>' +
            '<label for="inputTelefone2">Telefone 2</label></div>' +
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
            $('#inputTelefone1').val(dataN[6]).trigger("change");
            $('#inputTelefone2').val(dataN[7]).trigger("change");
            var $seuCampo = $('#inputCNPJ');
            $seuCampo.mask('00.000.000', {reverse: false});
            initInputs();
        } else {
            formEditar.submit();
        }
    });
</script> 
</body>
</html>
