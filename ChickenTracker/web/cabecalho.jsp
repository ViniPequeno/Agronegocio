<%@page language="java" contentType="text/html; charset=utf-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script defer src="../fontawesome-free-5.0.8/svg-with-js/js/fontawesome-all.js"></script>
        <link href="../Bootstrap/_CSS/bootstrap.css" rel="stylesheet">
        <link href="../Bootstrap/_CSS//mdb.css" rel="stylesheet">
        <link href="../_CSS/cabecalho.css" rel="stylesheet">
        <link href="<%=css%>" rel="stylesheet">
        <link rel="icon" href="../img/f.jpg">

        <title>Chicken Tracker</title>
    </head>
    <body>
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
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-book mr-1" aria-hidden="true"></i>Seus Negócios</a>
                        <div class="dropdown-menu dropdown-dark" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Negócios</a>
                            <a class="dropdown-item" href="#">Estabelecimentos</a>
                            <a class="dropdown-item" href="#">Fornecedores</a>
                            <a class="dropdown-item" href="#">Produtos</a>
                            <a class="dropdown-item" href="#">Desempenho</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Outro</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="../main/login.jsp"><i class="fa fa-sign-in-alt mr-1" aria-hidden="true"></i>Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../cadastro/usuario.jsp"><i class="fa fa-pencil-alt mr-1" aria-hidden="true"></i>Cadastre-se</a>
                    </li>
                </ul>
            </div>
        </nav>
