<%@page language="java" contentType="text/html; charset=utf-8"%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script defer src="fontawesome-free-5.0.8/svg-with-js/js/fontawesome-all.js"></script>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/mdb.css" rel="stylesheet">
        <link href="css/cabecalho.css" rel="stylesheet">
        <link href="css/<%=css%>" rel="stylesheet">
        <title>Chicken Tracker</title>
    </head>

    <body>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp" target="_self">
                <img src="img/icon.svg" height="30" width="30" alt="">Chicken Tracker</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="negocios.jsp"><i class="fa fa-suitcase mr-1" aria-hidden="true"></i></i>Negócios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="seu_negocio.jsp"><i class="fa fa-book mr-1" aria-hidden="true"></i>Seu Negócio</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Outro</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fa fa-user mr-1" aria-hidden="true"></i>Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fa fa-pencil-alt mr-1" aria-hidden="true"></i>Cadastre-se</a>
                    </li>
                </ul>
            </div>
        </nav>
