<% String css = "../css/index.css";%>
<%@ include file="../cabecalho.jsp"%>
<div class="jumbotron vertical-center">
    <div class="img"></div>
    <div class="container">
            <h1 class="display-4">Mude a visão do seu negócio</h1>
            <p class="lead">O Chicken Tracker lhe dará pleno controle sobre os estoque, despesas e funcionários de sua granja, além de informar o seu desempenho com o tempo.</p>
            <p class="lead">
                <a class="btn btn-cyan btn-lg" href="#" role="button">Saiba mais</a>
            </p>
    </div>
</div>
<div class="container conteudo">
    <div class="secao">
        <h1 class="text-center">Nosso Projeto</h1>
        <div class="row">
            <div class="col-md-6">
                <h4 class="text-center">Saiba seu desempenho</h4>
                <canvas id="lineChart"></canvas>
                <p class="text-center">Tenha acesso instantâneo as informações financeiras do seu negócio e descubra o quanto você está gastando e ganhando</p>
            </div>
        </div>
    </div>
    <hr class="my-4">
    <div class="secao">
        <h1 class="text-center">Colaboradores</h1>
    </div>
    <hr class="my-4">
    <div class="secao">
        <h1 class="text-center">A equipe</h1>
        <div class="row">
            <div class="col-md-3 col-6">
                <div class="text-center">
                    <a href="img/">
                        <img class="rounded-circle" src="../img/farmer.jpg" alt="Gabriel" style="width:80%">
                        <div class="black-text">
                            <p>Gabriel San Martin</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="text-center">
                    <a href="/w3images/nature.jpg" id="sd">
                        <img class="rounded-circle" src="../img/farmer.jpg" alt="Pedro" style="width:80%">
                        <div class="black-text">
                            <p>Pedro Vinicius</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="text-center">
                    <a href="/w3images/fjords.jpg">
                        <img class="rounded-circle" src="../img/farmer.jpg" alt="Victor" style="width:80%">
                        <div class="black-text">
                            <p>Victor Yan</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="text-center">
                    <a href="/w3images/fjords.jpg">
                        <img src="../img/farmer.jpg" class="rounded-circle" alt="Wyller" style="width:80%">
                        <div class="black-text">
                            <p>Wyller Douglas</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <hr class="my-4">
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/index.js"></script>
</body>
</html>
