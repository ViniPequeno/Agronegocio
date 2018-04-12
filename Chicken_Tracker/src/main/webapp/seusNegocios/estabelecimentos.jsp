<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Perfil" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<div class="container">
    <!--Table-->
    <h2 class="py-5 font-weight-bold text-left">Estabelecimentos</h2>

    <%List<Estabelecimento> estabelecimentos;
        estabelecimentos = ConsultaEstabelecimento.returnList();
        if (estabelecimentos.size() > 0) {%>
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

            %>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox<%=e.getCNAE()%>">
                    <label for="checkbox<%=e.getCNAE()%>" class="label-table"></label>
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
    <%} else {%>
    <h2 class="py-5 text-center">Nenhum estabelecimento registrado ainda</h2>
    <%}%>

    <a href="../cadastro/estabelecimento.jsp" class="btn btn-light-green btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Novo estabelecimento" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir estabelecimentos selecionados" role="button">
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
                    <button type="button" class="btn btn-primary">Confirmar</button>
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
                <div class="modal-body">
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
                    <button type="button" class="btn btn-primary">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/formUtils.js"></script>
<script>
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function () {
        $("#detalhesEstabelecimento").modal();
        var linha = $(this).closest('tr');
        var celula = $(linha).children('td').eq(0);
        $("#negocio").text("Negócio: " + celula.text());

        celula = $(linha).children('td').eq(1);
        $("#proprietario").text("Proprietário: " + celula.text());

        celula = $(linha).children('td').eq(2);
        $("#cnae").text("CNAE: " + celula.text());

        celula = $(linha).children('td').eq(3);
        $("#sufixoCNPJ").text("Sufixo do CNPJ: " + celula.text());

        celula = $(linha).children('td').eq(4);
        $("#empresaCNPJ").text("CNPJ da empresa: " + celula.text());

        celula = $(linha).children('td').eq(5);
        $("#endereco").text("Endereço: " + celula.text());

        celula = $(linha).children('td').eq(6);
        $("#qtdeFuncionarios").text("Quantidade de funcionários: " + celula.text());
    });
</script>
</body>
</html>
