<% String css = "../_CSS/seu_negocios.css";%>
<%@ include file="../cabecalho.jsp"%>
<div class="destaque">
    <section class="busca">
        <h2>Busca</h2>
        <form>
            <input type="search">
        </form>
    </section>
    <!-- fim .busca -->
    <section class="menu-departamentos">
        <h2>Departamentos</h2>
        <nav>
            <ul>
                <li><a href="#">Seus Negócios</a></li>
                <li><a href="#">Estabelecimentos</a></li>
                <li><a href="#">Fornecedores</a></li>
                <li><a href="#">Fornecimentos</a></li>
                <li><a href="#">Desempenho</a></li>
            </ul>
        </nav>
    </section>
    <!-- fim .menu-departamentos -->
</div>
<!-- fim .container .destaque -->
<%@include file="../rodape.jsp" %>
</body>

</html>
