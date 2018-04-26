<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<%  if (sessao.getAttribute("estabelecimento") == null) {
        sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento")));
    } else if (!sessao.getAttribute("estabelecimento").toString().equals(request.getParameter("estabelecimento").toString())) {
        sessao.setAttribute("estabelecimento", ConsultaEstabelecimento.findById(request.getParameter("estabelecimento")));
    }
    Estabelecimento e = (Estabelecimento)sessao.getAttribute("estabelecimento");
   %>
<div class="container mt-lg-5">
    <div class=" text-center">
        <div class="btn-group btn-group">

            <a class="btn btn-green" href="../seusNegocios/funcionarios.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Funcionários</a>

            <a class="btn btn-green" href="../seusNegocios/fornecedores.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Fornecedores</a>

            <a class="btn btn-green" href="../seusNegocios/fornecimentos.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Fornecimentos</a>

            <a class="btn btn-green" href="../seusNegocios/produtos.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Produtos</a>

            <a class="btn btn-green" href="../seusNegocios/vacinas.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Vacinas</a>

            <a class="btn btn-green" href="../seusNegocios/aviarios.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Aviários</a>

            <a class="btn btn-green" href="../seusNegocios/desempenho.jsp?estabelecimento=<%=e.getSufixoCNPJ()%>">Desempenho</a>
        </div>
    </div>
    <div class="row mt-lg-5">
        <div class="col-5">
            <div class="card">
                <div class="card-header">
                    Dados
                </div>
                <div class="card-body">
                    <p>Negócio: <%=e.getNegocio().getNome()%></p>
                    <p>Proprietário: <%=e.getPerfil().getNome()%></p>
                    <p>CNAE: <%=e.getCNAE()%></p>
                    <p>Endereço: <%=e.getEndereco()%></p>
                    <p>Sufixo do CNPJ: <%=e.getSufixoCNPJ()%></p>
                    <p>Número de funcionários: <%=e.getFuncionarios().size()%></p>
                </div>
            </div>
        </div>
        <div class="col-7">
            <div class="card">
                <div class="card-header">
                    Lucro diário
                </div>
                <div class="card-body">
                    <canvas style="align-content: center;"id="graficoLucro"></canvas>
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
<script src="../_JS/graficoLucro.js"></script>
</body>
</html>