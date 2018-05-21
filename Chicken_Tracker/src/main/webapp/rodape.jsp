
<!--Footer-->
<footer class="page-footer font-small stylish-color-dark pt-4 mt-4">

    <!--Footer Links-->
    <div class="container text-center text-md-left">
        <div class="row">

            <!--First column-->
            <div class="col-md-4">
                <h5 class="text-uppercase mb-4 mt-3 font-weight-bold">Chicken Tracker</h5>
                <p>O único website que trata da organização interna do tratamento dos produtos pertencentes ao ramo da avicultura.</p>
            </div>
            <!--/.First column-->

            <hr class="clearfix w-100 d-md-none">

            <!--Second column-->
            <div class="col-md-8 text-md-right">
                <h5 class="text-uppercase mb-4 mt-3 font-weight-bold">Links</h5>
                <ul class="list-unstyled">
                    <li class="mb-2" >
                        <a href="../main/negocios.jsp">Negócios</a>
                    </li>
                    <li class="mb-2" >
                        <a href="../seusNegocios/negocios.jsp">Seus negócios</a>
                    </li>
                    <li class="mb-2" >
                        <a href="#">Ajuda</a>
                    </li>
                </ul>
            </div>
            <!--/.Second column-->

        </div>
    </div>
    <!--/.Footer Links-->

    <hr>

    <% if (sessao.isNew() || sessao.getAttribute("usuario_logado").equals("false")) {%>
    <!--Call to action-->
    <div class="text-center py-3">
        <ul class="list-unstyled list-inline mb-0">
            <li class="list-inline-item">
                <h5 class="mb-1">Precisa de alguma ajuda?</h5>
            </li>
            <li class="list-inline-item">
                <a href="#" class="btn btn-danger btn-rounded">Fale Conosco</a>
            </li>
        </ul>
    </div>
    <!--/.Call to action-->

    <hr>
    <% }%>

    <!--Social buttons-->
    <div class="text-center">
        <ul class="list-unstyled list-inline">
            <li class="list-inline-item">
                <a class="btn-floating btn-sm btn-fb mx-1">
                    <i data-fa-transform="grow-8" class="fab fa-facebook-f"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a class="btn-floating btn-sm btn-tw mx-1">
                    <i data-fa-transform="grow-8" class="fab fa-twitter"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a class="btn-floating btn-sm btn-gplus mx-1">
                    <i data-fa-transform="grow-8" class="fab fa-google-plus"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a class="btn-floating btn-sm btn-li mx-1">
                    <i data-fa-transform="grow-8" class="fab fa-linkedin"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a class="btn-floating btn-sm btn-dribbble mx-1">
                    <i data-fa-transform="grow-8" class="fab fa-dribbble"> </i>
                </a>
            </li>
        </ul>
    </div>
    <!--/.Social buttons-->

    <!--Copyright-->
    <div class="footer-copyright py-3 text-center">
        © 2018 Copyright:
        <a href="../main/index.jsp"> Chicken Tracker </a>
    </div>
    <!--/.Copyright-->

</footer>
<!--/.Footer-->
<script src="../Bootstrap/_JS/jquery-3.2.1.min.js"></script>
<script src="../Bootstrap/_JS/popper.min.js"></script>
<script src="../Bootstrap/_JS/bootstrap.js"></script>
<script src="../Bootstrap/_JS/mdb.js"></script>
<script src="../_JS/jquery.mask.js"></script>
<script>
// Tooltips Initialization
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
    //Inicializa tooltips de botões modal
    $(function () {
        $('[data-tooltip="true"]').tooltip();
    });
</script>
