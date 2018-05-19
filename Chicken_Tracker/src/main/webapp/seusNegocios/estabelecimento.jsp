<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<% String css = "../_CSS/seu_negocio.css";%>
<%@ include file="../cabecalho.jsp"%>
<%  
    Negocio n = (Negocio) request.getSession().getAttribute("negocio");
    if (sessao.getAttribute("estabelecimento") == null) {
        sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"), n));
    } else if (!sessao.getAttribute("estabelecimento").toString().equals(request.getParameter("estabelecimento").toString())) {
        sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento"), n));
    }
    Estabelecimento e = (Estabelecimento) sessao.getAttribute("estabelecimento");
%>
<div class="container mt-lg-4">
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimentos.jsp?negocio=<%=((Negocio)session.getAttribute("negocio")).getEmpresaCNPJ()%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Estabelecimento: <%=e.getSufixoCNPJ()%></h2>
    <div class="text-center">
        <a class="btn blue-grey darken-4 white-text" href="../seusNegocios/funcionarios.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Funcionários</a>

        <a class="btn blue-grey darken-3 white-text" href="../seusNegocios/fornecedores.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Fornecedores</a>

        <a class="btn blue-grey darken-2 white-text" href="../seusNegocios/fornecimentos.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Fornecimentos</a>

        <a class="btn blue-grey darken-1 white-text" href="../seusNegocios/produtos.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Produtos</a>

        <a class="btn blue-grey white-text" href="../seusNegocios/vacinas.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Vacinas</a>

        <a class="btn blue-grey lighten-1 white-text" href="../seusNegocios/aviarios.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Aviários</a>

        <a class="btn blue-grey lighten-1 white-text" href="../seusNegocios/pagamentos.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Pagamentos</a>

        <a class="btn blue-grey lighten-1 white-text" href="../seusNegocios/desempenho.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Desempenho</a>
    </div>
    <div class="row mt-lg-5">
        <div class="col-lg-5">
            <div class="card border-light">
                <div class="card-header">
                    Dados
                </div>
                <div class="card-body">
                    <table class="table" id="tableEstabelecimento">
                        <tr>
                            <th> Negócio </th>
                            <td> <%=e.getNegocio().getNome()%> </td>
                        </tr>
                        <tr>
                            <th> Proprietário </th>
                            <td> <%=e.getPerfil().getNome()%> </td>
                        </tr>
                        <tr>
                            <th> CNAE </th>
                            <td class="CNAE"> <%=e.getCNAE()%> </td>
                        </tr>
                        <tr>
                            <th> Sufixo do CNPJ </th>
                            <td class="sufixoCNPJ"> <%=e.getSufixoCNPJ()%> </td>
                        </tr>
                        <tr>
                            <th> Número de funcionários: </th>
                            <td> <%=e.getFuncionarios().size()%> </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="card border-light">
                <div class="card-header">
                    Lucro diário
                </div>
                <div class="card-body">
                    <canvas style="align-content: center;" id="graficoLucro"></canvas>
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
<script src="../_JS/mascara.js"></script>
<script src="../_JS/graficoLucro.js"></script>
</body>
</html>