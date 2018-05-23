<%@page import="br.com.avicultura.chicken_tracker.Models.Perfil"%>
<%@ page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script defer src="../fontawesome-free-5.0.8/svg-with-js/js/fontawesome-all.js"></script>
        <link rel="stylesheet" type="text/css" href="../Bootstrap/_CSS/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../Bootstrap/_CSS/mdb.css">
        <link rel="stylesheet" type="text/css" href="../_CSS/cabecalho.css">
        <link rel="stylesheet" type="text/css" href="../_CSS/bootstrapValidator.css">
        <link rel="stylesheet" type="text/css" href="<%=css%>">
        <link rel="icon" href="../img/f.jpg">

        <title>Chicken Tracker</title>
    </head>
    <body>
        <%
            HttpSession sessao = request.getSession();
            if (sessao.getAttribute("usuario_logado") == null) {
                sessao.setAttribute("usuario_logado", "false");
                if (!request.getRequestURI().contains("negocios.jsp")
                        && !request.getRequestURI().contains("index.jsp")
                        && !request.getRequestURI().contains("login.jsp")
                        && !request.getRequestURI().contains("usuario.jsp")) {
                    response.sendRedirect("Chicken_Tracker/main/index.jsp");
                }
            }
        %>
        <header>
            <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
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
                            <li class="nav-item">
                                <a class="nav-link" href="../seusNegocios/negocios.jsp"><i class="fa fa-suitcase mr-1" aria-hidden="true"></i>Seus Negócios</a>
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
                                    <img id="fotoCabecalho" class="mr-2" src="../imagensUsuario/imagensUsuario<%=((Perfil)sessao.getAttribute("usuario")).getUsuario()%>.png">
                                    <% out.println(session.getAttribute("nome_usuario"));%>
                                </a>
                                <div class="dropdown-menu dropdown-dark dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="../main/perfil.jsp">Perfil</a>
                                    <a class="dropdown-item" href="/Chicken_Tracker/executarLogin">Sair</a>
                                </div>
                            </li>
                            <% }%>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
