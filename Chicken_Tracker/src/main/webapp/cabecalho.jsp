<%@page language="java" contentType="text/html; charset=utf-8"%>
<html lang="pt-br">
    <head>
        <meta charset=”utf-8”>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script defer src="../fontawesome-free-5.0.8/svg-with-js/js/fontawesome-all.js"></script>
        <link rel="stylesheet" type="text/css" href="../Bootstrap/_CSS/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../Bootstrap/_CSS/mdb.css">
        <link rel="stylesheet" type="text/css" href="../_CSS/menu.css">
        <link rel="stylesheet" type="text/css" href="../_CSS/bootstrapValidator.css">
        <link rel="stylesheet" type="text/css" href="<%=css%>">
        <link rel="icon" href="../img/f.jpg">

        <title>Chicken Tracker</title>
    </head>
    <body>
        <%@page import="javax.servlet.http.*"%>
        <%
            HttpSession sessao = request.getSession();
            if (sessao.getAttribute("usuario_logado") == null) {
                sessao.setAttribute("usuario_logado", "false");
            }
        %>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="../main/index.jsp" target="_self">
                <img src="../img/icon.svg" height="30" width="30" alt="">Chicken Tracker</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".trer" aria-controls="collapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse trer" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="../main/negocios.jsp"><i class="fa fa-suitcase mr-1" aria-hidden="true"></i>Negócios</a>
                    </li>
                    <%
                        if (!(sessao.isNew() || sessao.getAttribute("usuario_logado").equals("false"))) {
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-book mr-1" aria-hidden="true"></i>Seus Negócios</a>
                        <div class="dropdown-menu dropdown-dark" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="../seusNegocios/negocios.jsp">Negócios</a>
                            <a class="dropdown-item" href="../seusNegocios/estabelecimentos.jsp">Estabelecimentos</a>
                            <a class="dropdown-item" href="../seusNegocios/funcionarios.jsp">Funcionários</a>
                            <a class="dropdown-item" href="../seusNegocios/fornecedores.jsp">Fornecedores</a>
                            <a class="dropdown-item" href="../seusNegocios/fornecimentos.jsp">Fornecimentos</a>
                            <a class="dropdown-item" href="../seusNegocios/aviarios.jsp">Aviários</a>
                            <a class="dropdown-item" href="../seusNegocios/vacinas.jsp">Vacinas</a>
                            <a class="dropdown-item" href="../seusNegocios/produtos.jsp">Produtos</a>
                            <a class="dropdown-item" href="../seusNegocios/desempenho.jsp">Desempenho</a>
                        </div>
                    </li>
                    <% }%>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <%
                        if (sessao.isNew() || sessao.getAttribute("usuario_logado").equals("false")) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="../main/login.jsp"><i class="fa fa-sign-in-alt mr-1" aria-hidden="true"></i>Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../cadastro/usuario.jsp"><i class="fa fa-pencil-alt mr-1" aria-hidden="true"></i>Cadastre-se</a>
                    </li>
                    <%} else {%>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="dropdownUsuario" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <% out.println(session.getAttribute("nome_usuario"));%>
                        </a>
                        <div class="dropdown-menu dropdown-dark dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/Chicken_Tracker/PerfilServlet">Perfil</a>
                            <a class="dropdown-item" href="/Chicken_Tracker/executarLogin">Sair</a>
                        </div>
                    </li>
                    <% }%>
                </ul>
            </div>
        </nav>
