<%@page import="br.com.avicultura.chicken_tracker.Models.Telefones"%>
<% String css = "../_CSS/negocios.css";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<div class="container">
    <div class="card card-cascade narrower mt-5">
        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">
            <h4 class="white-text font-weight-bold text-uppercase mb-0">Negócios</h4>
        </div>
        <div class="px-4">
            <div class="md-form mb-5">
                <form method="get" action="negocios.jsp">
                    <div class="row">
                        <div class="col-4">
                            <input class="form-control pesquisar" type="text" placeholder="Pesquisar negócios" name="search">
                        </div>
                        <div class="col-2">
                            <input class="form-control botao" type="submit" value="Pesquisar">
                        </div>
                    </div>
                </form>
            </div>
            <%  if(request.getParameter("search") != null){
                    String search = request.getParameter("search");
                    List<Negocio> negocios;
                    negocios = ConsultaNegocio.returnListOfName(search);
                    if (negocios.size() > 0) {
            %>
            <table class="table table-hover table-responsive-md btn-table table-bordered" style="margin-bottom: 20px">
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
                            <td><%=n.getNome()%></td>
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
        </div>
    </div>
    <%}} else {%>
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
<%@include file="../rodape.jsp" %>
</body>
</html>
