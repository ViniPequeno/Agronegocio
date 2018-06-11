<% String css = "../css/login.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="col-xl-6 col-lg-6 col-md-10 col-sm-12 mx-auto">
        <div class="card narrower my-5">
            <div class="card-body">
                <!-- Material form login -->
                <form action="/Chicken_Tracker/executarLogin" method="post">
                    <p class="h4 text-center mb-4">Faça o seu login</p>
                    <!-- Material input email -->
                    <div class="md-form form-group">
                        <i class="fa fa-id-card prefix grey-text"></i>
                        <input type="text" id="inputLogin" name="inputLogin" class="form-control validate" autofocus required tabindex="1">
                        <label for="inputLogin" data-error="">Login</label>
                    </div>

                    <!-- Material input password -->
                    <div class="md-form form-group mt-5">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input minlength="8" maxlength="20" type="password" id="inputSenha" name="inputSenha" class="form-control validate" required autocomplete="off" tabindex="2">
                        <label for="inputSenha" data-error="">Senha</label>
                    </div>
                    <p class="text-center"><a class="small ml-4" href="esqueceuSenha.jsp">Esqueci minha senha. Quero recuperá-la.</a></p>
                    <p id="loginOK" class="mt-5 ml-4 invisible">Senha inválida</p>
                    <div class="text-center mt-5 mb-1">
                        <button class="btn btn-green btn-block font-weight-bold" type="submit" tabindex="3">Entrar</button>
                    </div>
                </form>
                <hr/>
                <div class="text-center mt-1 mb-3">
                    <a class="btn btn-outline-green btn-block font-weight-bold" href = '../cadastro/usuario.jsp' tabindex="4">Ainda não é cadastrado? Cadastre-se agora!</a>
                </div>
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
            $('#loginOK').removeClass('invisible');
            $('#loginOK').html('<i class="fa fa-times prefix mr-1"></i>Login não encontrado!');
            $('#loginOK').addClass('red-text');
        }
        if (url.searchParams.get("password") == "false") {
            $('#loginOK').removeClass('invisible');
            $('#loginOK').html('<i class="fa fa-times prefix mr-1"></i>Senha inválida!');
            $('#loginOK').addClass('red-text');
        }
    });
</script>
<script src="../js/formUtils.js"></script>
</body>
</html>