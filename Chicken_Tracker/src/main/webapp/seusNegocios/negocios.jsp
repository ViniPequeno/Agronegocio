<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Controller.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<div class="container">
    <a href="../main/index.jsp"><i class="fa fa-arrow-left mr-1" aria-hidden="true" style="margin-top: 25px"></i>Voltar</a>
    <!--Table-->
    <h2 class="py-5 font-weight-bold text-left">Negócios</h2>

    <table class="table table-hover table-responsive-md btn-table" id="tableDados">
        <!--Table head-->
        <thead class="mdb-color darken-3">
            <tr class="text-white">
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
            <%List<Negocio> negocios;
                negocios = ConsultaNegocio.returnList((String) sessao.getAttribute("usuario"));
                for (Negocio n : negocios) {%>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox<%=n.getEmpresaCNPJ()%>">
                    <label for="checkbox<%=n.getEmpresaCNPJ()%>" class="label-table"></label>
                </th>
                <td><%=n.getNome()%></td>
                <td><%=n.getLinkEmail()%></td>
                <td><%=n.getLinkFacebook()%></td>
                <td><%=n.getLinkInstragram()%></td>
                <td><%=n.getEmpresaCNPJ()%></td>
                <td><%=n.getNome()%></td>
                <td><a class="btn btn-cyan btn-rounded" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Negócio" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
            </tr>
            <%}%>
        </tbody>
        <!--Table body-->

    </table>
    <!--Table-->
    <a href="../cadastro/negocio.jsp" class="btn btn-light-green btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Novo negócio" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir negócios selecionados" role="button">
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
                    <p id="nome">Nome: </p>
                    <p id="prop">Proprietário: </p>
                    <p id="socios">Sócios: </p>
                    <p id="email"> Email: </p>
                    <p id="fone1"> Fone 1: </p>
                    <p id="fone2">Fone 2: </p>
                    <p id="linkFB">Link da página do Facebook: </p>
                    <p id="linkInstagram">Link da página do Instagram: </p>
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
    $("#detalhesNegocio").on('show.bs.modal', function () {
    });
</script>
</body>
</html>
