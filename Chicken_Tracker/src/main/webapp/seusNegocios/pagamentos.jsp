<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<% String css = "../css/seu_negocio.css";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Pagamento.ConsultaPagamento" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Pagamento" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Pagamentos</h2>

    <%List<Pagamento> pagamentos;
        pagamentos = ConsultaPagamento.returnList(request.getParameter("estabelecimento"));
        if (pagamentos.size() > 0) {%>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Pagamentos</h4>

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
                        <th>Valor</th>
                        <th>Data</th>
                        <th>Tipo</th>
                        <th>Estabelecimento</th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <%  for (Pagamento p : pagamentos) {%>
                    <tr>
                        <th scope="row" class="pr-md-3 pr-5">
                            <input type="checkbox" id="checkbox<%=p.getId()%>" name="checkbox<%=p.getId()%>">
                            <label for="checkbox<%=p.getId()%>" class="label-table"></label>
                        </th>
                        <td><%=p.getId()%></td>
                        <td>R$ <%=p.getValor()%></td>
                        <td><%=p.getDia()%>/<%=p.getMes()%>/<%=p.getAno()%></td>
                        <td class="tipoPagamento"><%=p.getTipo()%></td>
                        <td class="sufixoCNPJ"><%=p.getEstabelecimento().getSufixoCNPJ()%></td>
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
    <h2 class="my-5 py-5 text-center">Nenhum pagamento registrado ainda</h2>
    <%}%>
    <a href="../cadastro/pagamento.jsp" class="btn btn-light-green btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Inserir pagamento" role="button">
        <i class="fa fa-plus fa-lg mr-1" aria-hidden="true"></i></a>
    <button id="btnBaixarPDF" class="btn btn-mdb-color btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Exportar para PDF">
        <i class="fa fa-file-pdf fa-lg mr-1" aria-hidden="true"></i></button>
    <!--<span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Excluir pagamentos selecionados">
        <a href="" class="btn btn-danger btn-rounded mt-4 disabled mb-0" id="btnExcluir" role="button" data-toggle="modal" data-target="#confirmarExclusao">
            <i class="fa fa-trash mr-1" aria-hidden="true"></i></a>
    </span>   -->

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
                    <p>Esta ação não pode ser desfeita</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <form id="checks" action="/Chicken_Tracker/PagamentoServlet" method="post">
                        <button type="submit" class="btn btn-primary">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/paginacaoTabelas.js"></script>
<script src="../js/mascara.js"></script>
<script src="../js/formUtils.js"></script>
<script src="../js/maskMoney.js"></script>
<script>
    $('.tipoPagamento').each(function () {
        if ($(this).text() == 'G') {
            $(this).text('Ganho');
        } else {
            $(this).text('Despesa');
        }
    });
</script>
</body>
</html>
