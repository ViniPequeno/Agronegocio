<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<% String css = "../_CSS/seu_negocio.css";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.LocalAves.ConsultaLocalAves" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.LocalAves" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Locais de aves</h2>


    <%
        Negocio n = (Negocio) request.getSession().getAttribute("negocio");
        if (sessao.getAttribute("estabelecimento") == null) {
            sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"), n));
        } else if (!sessao.getAttribute("estabelecimento").toString().equals(request.getParameter("negocio"))) {
            sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"), n));
        }
        List<LocalAves> locaisAves;
        locaisAves = ConsultaLocalAves.returnList(request.getParameter("estabelecimento"));
        if (locaisAves.size() > 0) {%>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Locais de aves</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
            <table class="table table-hover table-responsive-md" id="tableDados">
                <!--Table head-->
                <thead>
                    <tr>
                        <th> </th>
                        <th>Código</th>
                        <th>Área</th>
                        <th>Produto</th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <%  for (LocalAves l : locaisAves) {%>
                    <tr>
                        <th scope="row" class="pr-md-3 pr-5">
                            <input type="checkbox" id="checkbox<%=l.getCodigo()%>" name="checkbox<%=l.getCodigo()%>">
                            <label for="checkbox<%=l.getCodigo()%>" class="label-table"></label>
                        </th>
                        <td><%=l.getCodigo()%></td>
                        <td><%=l.getArea()%></td>
                        <td><%=l.getProduto().getNome()%></td>
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
    <h2 class="py-5 text-center">Nenhum local de aves registrado ainda</h2>
    <%}%>
    <a href="../cadastro/localAves.jsp" class="btn btn-light-green btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Novo Aviário" role="button">
        <i class="fa fa-plus fa-lg mr-1" aria-hidden="true"></i></a>
    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Excluir aviários selecionados">
        <a href="" class="btn btn-danger btn-rounded mt-4 disabled mb-0" id="btnExcluir" role="button" data-toggle="modal" data-target="#confirmarExclusao">
            <i class="fa fa-trash fa-lg mr-1" aria-hidden="true"></i></a>
    </span>
    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Atualizar estoque">
        <a href="" class="btn btn-primary btn-rounded mt-4 disabled mb-0" id="btnPagar" role="button" data-toggle="modal" data-target="#pagarSelecionados">
            <i class="fa fa-boxes fa-lg mr-1" aria-hidden="true"></i></a>
    </span>        

    <!-- Modal -->
    <div class="modal fade" id="pagarSelecionados" tabindex="-1" role="dialog" aria-labelledby="pagarSelecionados" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelPagar">Pagar funcionários</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>O estoque será atualizado de acordo com produtos produzidos em cada aviário selecionado.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <form id="checks" action="/Chicken_Tracker/LocalAvesServlet" method="post">
                        <input type="hidden" name="aviario" value="atualizarEstoque" />
                        <button name="aviario" value="pagar" type="submit" class="btn btn-primary">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

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
                    <button name="aviario" value="excluir" type="button" class="btn btn-primary">Confirmar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/paginacaoTabelas.js"></script>
<script src="../_JS/formUtils.js"></script>
<script>
    initInputs();
</script>
</body>
</html>
