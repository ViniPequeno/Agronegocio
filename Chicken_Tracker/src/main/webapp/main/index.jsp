<% String css = "../css/index.css";
   String titulo ="Chicken Tracker";%>
<%@ include file="../cabecalho.jsp"%>
<div class="jumbotron vertical-center">
    <div class="img"></div>
    <div class="container">
        <h1 class="display-4">Mude a visão do seu negócio</h1>
        <p class="lead">Conheça o Chicken Tracker, um site que facilita o controle do seu negócio. Com ele, torna-se mais fácil manter
            o fornecimento e os consumos em dia. Ele lhe dá pleno controle sobre o estoque, despesas e funcionários da sua granja, 
            além de informar o seu desempenho com o tempo. </p>
        <p class="lead">
            <a class="btn btn-cyan btn-lg" href="#" role="button">Saiba mais</a>
        </p>
    </div>
</div>
<div class="container card">
    <!--Section: Features v.3-->
    <section>
        <!--Section heading-->
        <h2 class="py-5 font-weight-bold text-center">Por que é tão bom?</h2>
        <!--Section description-->
        <p class="px-5 mb-5 pb-3 lead grey-text text-center">O Chicken Tracker lhe proporciona uma abordagem rápida, interativa e em tempo real
            do desempenho do seu negócio. Aí vão algumas vantagens de usá-lo:</p>

        <!--Grid row-->
        <div class="row pt-2">

            <!--Grid column-->
            <div class="col-xl-5 mt-xl-2 text-center text-lg-left">
                <canvas style="align-content: center;"id="lineChart"></canvas>
                <br>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-xl-7">

                <!--Grid row-->
                <div class="row">
                    <div class="col-1 ml-3">
                        <i class="fa fa-chart-area fa-lg light-green-text"></i>
                    </div>
                    <div class="col-10">
                        <h5 class="font-weight-bold text-left mb-3 dark-grey-text">Informativo</h5>
                        <p class="grey-text text-left">Ele dá controle sobre o estoque, além de gerar relatórios sobre o seu
                            desempenho.</p>
                    </div>
                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row pb-3">
                    <div class="col-1 ml-3">
                        <i class="fa fa-bolt fa-lg cyan-text"></i>
                    </div>
                    <div class="col-10">
                        <h5 class="font-weight-bold text-left mb-3 dark-grey-text">Rápido</h5>
                        <p class="grey-text text-left">Ele é capaz de gerar gráficos automaticamente e em tempo real.</p>
                    </div>
                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row pb-3">
                    <div class="col-1 ml-3">
                        <i class="fa fa-users fa-lg indigo-text"></i>
                    </div>
                    <div class="col-10">
                        <h5 class="font-weight-bold text-left mb-3 dark-grey-text">Gratuito</h5>
                        <p class="grey-text text-left">É totalmente gratuito se cadastrar no Chicken Tracker.</p>
                    </div>
                </div>
                <!--Grid row-->

            </div>
            <!--Grid column-->

        </div>
        <!--Grid row-->

    </section>

    <!--Section: Features v.3-->
    <!--<hr class="my-4">
    <section>
        <h2 class="py-5 font-weight-bold text-center">Colaboradores</h2>
    </section>-->

    <hr class="my-4">

    <!--Section: Team v.2-->
    <section class="team-section pb-5">

        <!--Section heading-->
        <h2 class="py-5 font-weight-bold text-center">Nossa equipe</h2>
        <!--Section description-->
        <p class="grey-text pb-5 text-center">Nossa equipe é composta por profissionais altamente preparados e que
            possuem um objetivo em comum, facilitar a vida do avicultor.</p>

        <div class="row text-center">

            <!--Grid column-->
            <div class="col-lg-3 col-sm-6 mb-3">

                <div class="avatar mx-auto">
                    <img src="../img/dev.jpeg" class="rounded img-fluid z-depth-1-half" alt="First sample avatar image" width="200" height="200">
                </div>
                <br>
                <h4 class="font-weight-bold dark-grey-text">
                    Pedro Vinicius
                </h4>
                <h6 class="grey-text">Desenvolvedor Back-end</h6>

                <!--Facebook-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-fb" href="https://www.facebook.com/profile.php?id=100006546753271" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-facebook-f"></i>
                </a>
                <!--Twitter-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-tw" href="" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-twitter"></i>
                </a>
                <!--GitHub-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-git" href="https://github.com/ViniPequeno" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-github"></i>
                </a>

            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-sm-6 mb-3">

                <div class="avatar mx-auto" >
                    <img src="../img/dev2.jpeg" class="rounded img-fluid z-depth-1-half" alt="Second sample avatar image" width="200" height="200">
                </div>
                <br>
                <h4 class="font-weight-bold dark-grey-text">
                    Victor Yan
                </h4>
                <h6 class="grey-text">Desenvolvedor Front-End</h6>

                <!--Facebook-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-fb" href="https://www.facebook.com/victor.yan.92?ref=br_rs" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-facebook-f"></i>
                </a>
                <!--Twitter-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-tw" href="https://twitter.com/supervictor7095" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-twitter"></i>
                </a>
                <!--GitHub-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-git" href="https://github.com/Victor7095" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-github"></i>
                </a>

            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-sm-6 mb-3">

                <div class="avatar mx-auto">
                    <img src="../img/dev3.jpeg" class="rounded img-fluid z-depth-1-half" alt="Third sample avatar image" width="200" height="200">
                </div>
                <br>
                <h4 class="font-weight-bold dark-grey-text">
                    <strong>Gabriel San Martin</strong>
                </h4>
                <h6 class="grey-text">Desenvolvedor Web</h6>

                <!--Facebook-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-fb" href="https://www.facebook.com/profile.php?id=100010879563084" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-facebook-f"></i>
                </a>
                <!--Twitter-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-tw" href="https://twitter.com/Paperzord" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-twitter"></i>
                </a>
                <!--GitHub-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-git" href="https://github.com/Dabwiel" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-github"></i>
                </a>

            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-sm-6 mb-3">

                <div class="avatar mx-auto">
                    <img src="../img/dev4.jpeg" class="rounded img-fluid z-depth-1-half" alt="Third sample avatar image" width="200" height="200">
                </div>
                <br>
                <h4 class="font-weight-bold dark-grey-text">
                    <strong>Wyller Douglas</strong>
                </h4>
                <h6 class="grey-text">Desenvolvedor Web</h6>

                <!--Facebook-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-fb" href="https://www.facebook.com/profile.php?id=100012432752260" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-facebook-f"></i>
                </a>
                <!--Twitter-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-tw" href="" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-twitter "></i>
                </a>
                <!--GitHub-->
                <a type="button" class="btn-floating btn-sm mx-1  btn-git" href="" target="_blank">
                    <i data-fa-transform="grow-8" class="fab fa-github"></i>
                </a>

            </div>
            <!--Grid column-->
        </div>

    </section>
    <!--Section: Team v.2-->
</div>
<div class="fixed-action-btn smooth-scroll" style="bottom: 15px; right: 15px;">
    <a href="#" class="btn btn-floating btn-large cyan text-center white-text" data-toggle="tooltip" data-placement="bottom" title="Ir para o topo">
        <i class="fa fa-arrow-up"></i>
    </a>
</div>
<%@include file="../rodape.jsp" %>
<script type="text/javascript" src="../js/index.js"></script>
</body>
</html>
