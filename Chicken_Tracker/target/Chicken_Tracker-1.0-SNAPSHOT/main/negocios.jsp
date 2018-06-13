<% String css = "../css/negocios.css";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<div class="container">
    <div class="card card-cascade narrower mt-5">
        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-2 d-flex justify-content-center align-items-center">
            <h4 class="white-text font-weight-bold text-uppercase mb-0">Negócios</h4>
        </div>
        <div class="px-4">
            <form class="md-form" action="" autocomplete="off" method="get" accept-charset="utf-8">
                <div class="input-group">
                    <input placeholder="Pesquisar negócios" name="search" class="form-control" type="text">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit" value="Pesquisar">
                            <i class="fa fa-search"></i>
                            Pesquisar
                        </button>
                    </span>
                </div>
            </form>
            <%
                List<Negocio> negocios;
                if (request.getParameter("search") == null) {
                    negocios = ConsultaNegocio.returnList();
                } else {
                    String search = request.getParameter("search");
                    negocios = ConsultaNegocio.returnListBySearch(search);
                }
                if (negocios.size() > 0) {
            %>
            <table class="table table-hover table-responsive-md btn-table table-bordered mt-5" id="tableDados">
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
                        for (Negocio n : negocios) {
                            String data = ConsultaNegocio.returnValues(n);
                    %>   
                    <tr data-negocio="<%=data%>">
                        <td><%=n.getNome()%></td>
                        <td><%=n.getPerfil().getNome()%></td>
                        <td class="CNPJ"><%=n.getEmpresaCNPJ()%></td>
                        <td><%=n.getEmail()%></td>
                        <td><%=n.getTelefone1()!=null?n.getTelefone1():"---"%></td>
                        <td><%=n.getTelefone2()!=null?n.getTelefone2():"---"%></td>
                    </tr>
                    <%}%>

                </tbody>
            </table>

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
            <%} else {%>
            <h1 class="my-5 py-5 text-center">Nenhum negócio encontrado</h1>
            <%}%>
            <!--Table-->
            <hr class="my-0">

        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="detalhesNegocio" tabindex="-1" role="dialog" aria-labelledby="detalhesNegocio" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title white-text" id="labelDetalhes">Detalhes do Negócio</h5>
                    <button type="button" class="close white-ic" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id='bodyDetalhes'>
                    <p id="nome"> Nome: </p>
                    <p id="proprietario"> Proprietário: </p>
                    <p id="cnpj"> CNPJ: </p>
                    <p id="fone1"> Fone 1: </p>
                    <p id="fone2"> Fone 2: </p>
                    <p id="email"> Email: </p>
                    Redes Sociais: 
                    <a id="btnFace" type="button" class="btn-floating btn-sm mx-1 btn-fb" href="" target="_blank">
                        <i data-fa-transform="grow-8" class="fa fab fa-facebook-f"></i>
                    </a>
                    <a id="btnInsta" type="button" class="btn-floating btn-sm mx-1 btn-ins" target="_blank">
                        <i data-fa-transform="grow-8" class="fa fab fa-instagram"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/paginacaoTabelas.js"></script>
<script src="../js/formUtils.js"></script>
<script src="../js/mascara.js"></script>
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

        var fone1 = campo[6];
        var fone2 = campo[7];

        var estabelecimentos = campo[8];

        $("#btnEstabelecimentos").attr('href', '../seusNegocios/estabelecimentos.jsp?negocio=' + cnpj);

        $("#nome").text("Nome: " + nome);

        $("#proprietario").text("Proprietário: " + proprietario);

        cnpj = cnpj.replace(/^(\d{2})(\d{3})(\d{3}).*/, '$1.$2.$3');
        $("#cnpj").text("CNPJ: " + cnpj);

        $("#fone1").text("Fone 1: " + (fone1=="null"?"---":fone1));
        $("#fone2").text("Fone 2: " + (fone2=="null"?"---":fone2));

        $("#email").text("Email: " + email);

        $("#btnFace").attr("href", "http://"+facebook);
        $("#btnInsta").attr("href", "http://www.instagram.com/" + instagram);
    }
</script>
</body>
</html>
