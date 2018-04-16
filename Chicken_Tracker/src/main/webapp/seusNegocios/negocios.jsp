<% String css = "../_CSS/seu_negocio.css";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<div class="container">
    <%  //Gera tabela se houver algum registro
        List<Negocio> negocios;
        negocios = ConsultaNegocio.returnList(sessao.getAttribute("nome_usuario").toString());
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
                        <th>Fone 1</th>
                        <th>Fone 2</th>
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
                            <input type="checkbox" id="checkbox<%=n.getEmpresaCNPJ()%>">
                            <label for="checkbox<%=n.getEmpresaCNPJ()%>" class="label-table"></label>
                        </th>
                        <td><%=n.getNome()%></td>
                        <td><%=n.getPerfil().getNome()%></td>
                        <td><%=n.getEmpresaCNPJ()%></td>
                        <td><%=n.getLinkEmail()%></td>
                        <td><%=n.getLinkFacebook()%></td>
                        <td><%=n.getLinkInstragram()%></td>
                        <td><a class="btn btn-cyan btn-rounded" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Negócio" role="button">
                                <i data-fa-transform="grow-4    " class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
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
                        <li id="first-item" class="page-item disabled clearfix d-none d-md-block"><a class="page-link">First</a></li>

                        <!--Arrow left-->
                        <li id="previous" class="page-item disabled">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>

                        <!--Arrow right-->
                        <li id="next" class="page-item">
                            <a class="page-link" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>

                        <!--Last-->
                        <li id="last-item" class="page-item clearfix d-none d-md-block"><a class="page-link">Last</a></li>

                    </ul>
                </nav>
                <!--/Pagination -->

            </div>
            <!--Bottom Table UI-->
        </div> 
    </div>
    <!--Table-->
    <%} else {%>
    <h2 class="py-5 text-center">Nenhum negócio registrado ainda</h2>
    <%}%>

    <a href="../cadastro/negocio.jsp" class="btn btn-light-green btn-rounded mt-4" data-toggle="tooltip" data-placement="bottom" title="Novo negócio" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded mt-4" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir negócios selecionados" role="button">
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
                    <p>Todos os estabelecimentos associados a este negócio também serão apagados</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Confirmar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="detalhesNegocio" tabindex="-1" role="dialog" aria-labelledby="detalhesNegocio" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
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
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/formUtil.js"></script>
<script>
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function (event) {
        $("#detalhesNegocio").modal();
        var linha = $(this).closest('tr');
        var dados = linha.data('negocio').toString();
        var campo = dados.split("#");
        var nome = campo[0];
        var proprietario = campo[1];
        var cnpj = campo[2];
        var email = campo[3];
        var facebook = campo[4];
        var instagram = campo[5];

        var fones = campo[6].split("&");
        var fone1 = fones[0];
        var fone2 = fones[1];
        $("#nome").text("Nome: " + nome);

        $("#proprietario").text("Proprietário: " + proprietario);

        $("#cnpj").text("CNPJ: " + cnpj);

        $("#email").text("Email: " + email);

        $("#linkFB").text("Link da página do Facebook: " + facebook);

        $("#linkInstagram").text("Link da página do Instagram: " + instagram);

        $("#estabelecimentos").text("Estabelecimentos: " + dados);

        $("#fone1").text("Fone 1: " + fone1);
        $("#fone2").text("Fone 2: " + fone2);
    });
</script>
</body>
</html>
