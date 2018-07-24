<% String css = "../css/seu_negocio.css";
    String titulo = "Estabelecimento";%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Pagamento.ConsultaPagamento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<%@ include file="../cabecalho.jsp"%>
<%
    Negocio n = (Negocio) request.getSession().getAttribute("negocio");
    if (sessao.getAttribute("estabelecimento") == null) {
        sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento")));
    } else if (!sessao.getAttribute("estabelecimento").toString().equals(request.getParameter("estabelecimento").toString())) {
        sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento")));
    }
    Estabelecimento e = (Estabelecimento) sessao.getAttribute("estabelecimento");
    String lucroSemana = ConsultaPagamento.seteDiasLucros(e.getId());
    String lucroMes = ConsultaPagamento.trintaDiasLucros(e.getId());
%>
<div class="container">
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimentos.jsp?negocio=<%=n.getEmpresaCNPJ()%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Estabelecimento: 
        <div class="d-inline CNPJCompleto">
            <%=n.getEmpresaCNPJ()%><%=e.getSufixoCNPJ()%>
        </div>
    </h2>

    <div class="row">
        <div class="col-lg-12 text-center">
            <a class="btn blue-grey darken-4 white-text mx-3" href="../seusNegocios/funcionarios.jsp?estabelecimento=<%=e.getId()%>">
                <i class="fas fa-user-tie fa-lg mr-1"></i>Funcionários</a>
            <a class="btn blue-grey darken-3 white-text mx-3" href="../seusNegocios/fornecedores.jsp?estabelecimento=<%=e.getId()%>">
                <i class="fa fa-people-carry fa-lg mr-1"></i><i class="fa fa-sign-in-alt fa-lg mr-1"></i>Fornecedores</a>
            <a class="btn blue-grey darken-2 white-text mx-3" href="../seusNegocios/fornecimentos.jsp?estabelecimento=<%=e.getId()%>">
                <i class="fa fa-people-carry fa-lg mr-1"></i><i class="fa fa-sign-out-alt fa-lg mr-1"></i>Fornecimentos</a>
            <a class="btn blue-grey darken-1 white-text mx-3" href="../seusNegocios/produtos.jsp?estabelecimento=<%=e.getId()%>">
                <i class="fa fa-boxes fa-lg mr-1"></i>Produtos</a>
            <a class="btn blue-grey white-text mx-4" href="../seusNegocios/vacinas.jsp?estabelecimento=<%=e.getId()%>">
                <i class="fa fa-syringe fa-lg mr-1"></i>Vacinas</a>
            <a class="btn blue-grey lighten-1 white-text mx-3" href="../seusNegocios/aviarios.jsp?estabelecimento=<%=e.getId()%>">
                <i class="fa fa-crow fa-lg mr-1"></i>Aviários</a>
            <a class="btn blue-grey lighten-1 white-text mx-3" href="../seusNegocios/pagamentos.jsp?estabelecimento=<%=e.getId()%>">
                <i class="fa fa-money-bill-wave fa-lg mr-1"></i>Pagamentos</a>
            <a class="btn blue-grey lighten-1 white-text mx-3" href="../seusNegocios/producoes.jsp?estabelecimento=<%=e.getId()%>">
                <i class="fa fa-industry fa-lg mr-1"></i>Produção</a>
            <a class="btn blue-grey lighten-1 white-text mx-3" href="../seusNegocios/desempenho.jsp?estabelecimento=<%=e.getId()%>">
                <i class="fa fa-chart-area fa-lg mr-1"></i>Desempenho</a>
        </div>
    </div>
    <div class="row mt-lg-5">
        <div class="col-lg-5">
            <div class="card border-light">
                <div class="card-header">
                    Dados
                </div>
                <div class="card-body">
                    <table class="table table-sm" id="tableEstabelecimento">
                        <tr>
                            <th scope="row"> Negócio </th>
                            <td> <%=e.getNegocio().getNome()%> </td>
                        </tr>
                        <tr>
                            <th scope="row"> Proprietário </th>
                            <td> <%=n.getPerfil().getNome()%> </td>
                        </tr>
                        <tr>
                            <th scope="row"> CNAE </th>
                            <td class="CNAE"> <%=e.getCNAE()%> </td>
                        </tr>
                        <tr>
                            <th scope="row">CNPJ </th>
                            <td class="CNPJCompleto"> <%=n.getEmpresaCNPJ()%><%=e.getSufixoCNPJ()%> </td>
                        </tr>
                        <tr>
                            <th scope="row"> Saldo </th>
                            <td> R$ <%=e.getSaldo()%> </td>
                        </tr>
                        <tr>
                            <th class="h6"> <strong>Endereço</strong> </th>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"> CEP </th>
                            <td class="CEP"> <%=e.getCEP()%> </td>
                        </tr>
                        <tr>
                            <th scope="row"> Rua </th>
                            <td> <%=e.getRua()%> </td>
                        </tr>
                        <tr>
                            <th scope="row"> Bairro </th>
                            <td> <%=e.getBairro()%> </td>
                        </tr>
                        <tr>
                            <th scope="row"> Cidade</th>
                            <td> <%=e.getCidade()%> </td>
                        </tr>
                        <tr>
                            <th scope="row"> Estado </th>
                            <td> <%=e.getEstado()%> </td>
                        </tr>
                        <tr>
                            <th scope="row"> Número de funcionários </th>
                            <td> <%=e.getFuncionarios().size()%> </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="row">
                <div class="col-12">
                    <div class="card border-light">
                        <div class="card-header">
                            Lucros dessa semana
                        </div>
                        <div class="card-body">
                            <div>
                                <canvas style="align-content: center;" id="graficoSeteDiasLucros" data-info="<%=lucroSemana%>"></canvas>
                            </div>
                            <div style="height:0; width:0; overflow:hidden;">
                                <canvas id="graficoSeteDiasLucrosHD" width="1200" height="600" data-info="<%=lucroSemana%>"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card border-light">
                        <div class="card-header">
                            Lucros dessa semana
                        </div>
                        <div class="card-body">
                            <div>
                                <canvas style="align-content: center;" id="graficoTrintaDiasLucros" data-info="<%=lucroMes%>"></canvas>
                            </div>
                            <div style="height:0; width:0; overflow:hidden;">
                                <canvas id="graficoTrintaDiasLucrosHD" width="1200" height="600" data-info="<%=lucroMes%>"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="fixed-action-btn smooth-scroll" style="bottom: 45px; right: 24px;">
        <a href="#" class="btn-floating btn-large cyan text-center white-text">
            <i class="fa fa-arrow-up"></i>
        </a>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/mascara.js"></script>
<script src="../js/graficos/graficoSeteDiasLucros.js"></script>
<script src="../js/graficos/graficoTrintaDiasLucros.js"></script>
</body>
</html>
