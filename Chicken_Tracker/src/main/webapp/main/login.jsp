<% String css = "../_CSS/login.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="col-xl-5 col-lg-6 col-md-10 col-sm-12 mx-auto mt-lg-5">
        <div class="card narrower">
            <div class="card-body">
                <!-- Material form login -->
                <form action="/Chicken_Tracker/executarLogin" method="post">
                    <p class="h4 text-center mb-4">Faça o seu login</p>
                    <!-- Material input email -->
                    <div class="md-form form-group">
                        <i class="fa fa-id-card prefix grey-text"></i>
                        <input type="text" id="inputLogin" name="inputLogin" class="form-control validate" autofocus required>
                        <label for="inputLogin" data-error="">Login</label>
                    </div>

                    <!-- Material input password -->
                    <div class="md-form form-group mt-5">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input type="password" id="inputSenha" name="inputSenha" class="form-control validate" required autocomplete="off">
                        <label for="inputSenha" data-error="">Senha</label>
                    </div>
                    <a class="small ml-4" href="">Esqueceu sua senha?</a>

                    <div class="text-center mt-4">
                        <button class="btn btn-default" type="submit">Entrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script>
    $('input + label').addClass('active');
    var urlString = document.URL;
    $(document).ready(function () {
        var url = new URL(urlString);
        if (url.searchParams.get("login") == "false") {
            $("#inputLogin").addClass('invalid');
            $("label[for='inputLogin']").addClass('active');
            $("#inputLogin").attr("placeholder", "Login não encontrado");
        }
        if (url.searchParams.get("password") == "false") {
            $("#inputSenha").addClass('invalid');
            $("label[for='inputSenha']").addClass('active');
            $("#inputSenha").attr("placeholder", "Senha inválida");
        }
    });
    $("#inputSenha").change(function () {
        $("#inputSenha").removeClass('valid');
        var url = new URL(urlString);
        if (url.searchParams.get("password") == "false") {
            $("#inputSenha").addClass('invalid');
            if ($("#inputSenha").val().length == 0) {
                $("label[for='inputSenha']").addClass('active');
            } else {
                $("#inputSenha").removeClass('invalid');
            }
        }
    });
    $("#inputSenha").blur(function () {
        $("#inputSenha").removeClass('valid');
    });
    $("#inputLogin").change(function () {
        var url = new URL(urlString);
        if (url.searchParams.get("login") == "false") {
            $("#inputLogin").addClass('invalid');
            if ($("#inputLogin").val().length == 0) {
                $("label[for='inputLogin']").addClass('active');
            } else {
                $("#inputLogin").removeClass('invalid');
            }
        }
    });
    $("#inputLogin").blur(function () {
        $("#inputLogin").removeClass('valid');
    });
</script>
<script src="../_JS/formUtils.js"></script>
</body>
</html>