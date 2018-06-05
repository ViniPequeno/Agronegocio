<%String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<div class="container mt-5">
    <%
        if (request.getSession().getAttribute("usuario_logado") != "false") {
    %>
    <p> Desculpe, <%=request.getSession().getAttribute("nome_usuario")%> esse caminho não existe!</p>
    <div>Clique <a class="font-weight-bold" href="../seusNegocios/negocios.jsp">aqui</a> para voltar para a tela de seus negócios</div>
    <%} else {%>
    <div> Desculpe, esse caminho não existe!</div>
    <%}%>
    <div>Clique <a class="font-weight-bold" href="../main/index.jsp">aqui</a> para voltar para a página inicial</div>
    <img class="img-fluid mx-auto d-block" src="../img/ErrorImg.png" alt="Imagem de erro">
</div>
<%@ include file="../imports.jsp"%>
</body>
</html>
