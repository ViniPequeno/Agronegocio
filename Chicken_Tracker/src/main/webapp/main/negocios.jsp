<% String css = "../_CSS/negocios.css";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Telefones"%>
<div class="container">
    <div class="card card-cascade narrower mt-5">
        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">
            <h4 class="white-text font-weight-bold text-uppercase mb-0">Negócios</h4>
        </div>
            <div class="md-form mb-5">
                <form method="get" action="">
                    <div class="row">
                        <div class="col-4">
                            <input style="margin-left: 25px" class="form-control" type="text" placeholder="Pesquisar negócios" name="search">
                        </div>
                        <div class="col-1"></div>
                        <div class="col-2">
                            <input class="form-control" type="submit" value="Pesquisar">
                        </div>
                    </div>
                </form>
            </div>
            <%  
                List<Negocio> negocios;
                if(request.getParameter("search") == null){
                    negocios = ConsultaNegocio.returnList();
                }else{
                    String search = request.getParameter("search");
                    negocios = ConsultaNegocio.returnListBySearch(search);
                }
                if (negocios.size() > 0) {
            %>
            <table class="table table-hover table-responsive-md btn-table table-bordered" id="tableDados" style="margin-bottom: 20px;">
                <thead class="thead-dark">
                    <tr class="text-white">
                        <th>Nome</th>
                        <th>Proprietário</th>
                        <th>CNPJ</th>
                        <th>Email</th>
                        <th>Fone 1</th>
                        <th>Fone 2</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for(Negocio n : negocios){
                             String data = ConsultaNegocio.returnValues(n);
                    %>   
                        <tr data-negocio="<%=data%>">
                            <td><%=n.getNome()%></td>
                            <td><%=n.getPerfil().getNome()%></td>
                            <td><%=n.getEmpresaCNPJ()%></td>
                            <td><%=n.getLinkEmail()%></td>
                            <%
                                List<Telefones> telefones = n.getTelefones();
                                for(Telefones t : telefones){
                            %>
                                <td><%=t.getTelefone()%></td>
                            <%}%>
                        </tr>
                    <%}%>
                </tbody>
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
    <%} else {%>
    <h2 class="py-5 text-center">Nenhum negócio registrado.</h2>
    <%}%>
    <!-- Modal -->
    <div class="modal fade" id="detalhesNegocio" tabindex="-1" role="dialog" aria-labelledby="detalhesNegocio" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelDetalhes">Detalhes do Negócio</h5>
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
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/paginacaoTabelas.js"></script>
<script src="../_JS/formUtils.js"></script>
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
<script type="text/javascript">
    dataN = "";
    var linha;
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function (event) {
        $("#detalhesNegocio").modal();
        linha = $(this).closest('tr');
        resetModalData();
    });

    function resetModalData() {
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

        $("#estabelecimentos").text("Estabelecimentos: " + dados);

        $("#fone1").text("Fone 1: " + fone1);
        $("#fone2").text("Fone 2: " + fone2);
    }
</script>
</body>
</html>
