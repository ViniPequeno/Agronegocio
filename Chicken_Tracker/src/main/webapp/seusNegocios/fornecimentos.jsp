<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Vacina.ConsultaVacina"%>
<% String css = "../_CSS/seu_negocio.css";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Fornecimento.ConsultaFornecimento" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Fornecimento" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Fornecimentos</h2>

    <%List<Fornecimento> fornecimentos;
        fornecimentos = ConsultaFornecimento.returnList(request.getParameter("estabelecimento"));
        if (fornecimentos.size() > 0) {%>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Fornecimentos</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
            <table class="table table-hover table-responsive-md btn-table" id="tableDados">
                <!--Table head-->
                <thead>
                    <tr>
                        <th> </th>
                        <th>CNPJ</th>
                        <th>Preço</th>
                        <th>Quantidade</th>
                        <th>Data de vencimento</th>
                        <th></th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <%  for (Fornecimento f : fornecimentos) {
                            String dataFornecimento = ConsultaFornecimento.returnValues(f);
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");%>
                    <tr data-fornecimento="<%=dataFornecimento%>">
                        <th scope="row" class="pr-md-3 pr-5">
                            <input type="checkbox" id="checkbox<%=f.getCNPJ()%>" name="checkbox<%=f.getCNPJ()%>">
                            <label for="checkbox<%=f.getCNPJ()%>" class="label-table"></label>
                        </th>
                        <td><%=f.getCNPJ()%></td>
                        <td><%=f.getPagamento()%></td>
                        <td><%=f.getQuantidade()%></td>
                        <td><%=dateFormat.format(f.getVencimento())%></td>
                        <td><a class="btn btn-cyan btn-rounded" href="../cadastro/fornecimento.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Negócio" role="button">
                                <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
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
    <h2 class="py-5 text-center">Nenhum fornecimento registrado ainda</h2>
    <%}%>
    <a href="../cadastro/fornecimento.jsp" class="btn btn-light-green btn-rounded mt-4" data-toggle="tooltip" data-placement="bottom" title="Novo negócio" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded mt-4 disabled" id="btnExcluir" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir fornecimento selecionados" role="button">
        <i class="fa fa-trash mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-primary btn-rounded mt-4 disabled" id="btnPagar" data-toggle="modal" data-target="#pagarSelecionados" data-tooltip="true" data-placement="bottom" title="Pagar fornecimento(s) selecionado(s)" role="button">
        <i class="fa fa-money-bill-alt mr-1" aria-hidden="true"></i></a>

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
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Confirmar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="pagarSelecionados" tabindex="-1" role="dialog" aria-labelledby="pagarSelecionados" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelPagar">Pagar fornecimentos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Todos os fornecimentos selecionados terão seus devidas contas consideradas pagas.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <form id="checks" action="/Chicken_Tracker/FornecimentoServlet" method="post">
                        <input type="hidden" name="fornecimento" value="pagar" />
                        <button type="submit" class="btn btn-primary">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/paginacaoTabelas.js"></script>
<script src="../_JS/mascara.js"></script>
</body>
</html>
