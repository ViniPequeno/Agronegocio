<% String css = "../_CSS/login.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="col-xl-5 col-lg-6 col-md-10 col-sm-12 mx-auto mt-lg-5">
        <div class="card narrower">
            <div class="card-body">
                <!-- Material form login -->
                <form action="/Chicken_Tracker/PerfilServlet" method="post" id="alterarSenha">
                    <p class="h4 text-center mb-4">Esqueceu seu senha?</p>
                    <!-- Material input text -->
                    <div class="md-form form-group mt-5"> 
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input type="password" name="inputNovaSenha" id="inputNovaSenha" class="form-control validate" autofocus="true" minlength="8" maxlength="20">
                        <label for="inputNovaSenha" data-error="Mínimo de 8 caracteres">Nova Senha</label>
                    </div>
                    <!-- Material input text -->
                    <div class="md-form form-group mt-5 mb-5"> 
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input type="password" id="inputConfirmarNovaSenha" name="inputConfirmarNovaSenha" class="form-control validate" minlength="8" maxlength="20">
                        <label for="inputConfirmarNovaSenha" data-error="Mínimo de 8 caracteres">Confirmar nova senha</label>
                    </div>
                    <p id="labelSenhaValida" class="ml-4 my-4 invisible">Senha inválida</p>

                    <div class="text-center">
                        <button class="btn btn-default" type="submit">Confirmar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script src="../_JS/formUtils.js"></script>
<script>
    $('#inputConfirmarNovaSenha').change(function () {
        var senhaNova = $('#inputNovaSenha');
        var confirmarNovaSenha = $('#inputConfirmarNovaSenha');
        if (senhaNova.val() != "" && confirmarNovaSenha.val() != ""
                && (senhaNova.val().length>=8) && (confirmarNovaSenha.val().length>=8)) {
            $('#labelSenhaValida').removeClass('invisible');
            if (senhaNova.val() == confirmarNovaSenha.val()) {
                $('#labelSenhaValida').html('<i class="fa fa-check prefix mr-1 mt-1"></i>As senhas são iguais');
                $('#labelSenhaValida').removeClass('red-text').addClass('green-text');
                novaSenhaValida = true;
            } else {
                $('#labelSenhaValida').html('<i class="fa fa-times prefix mr-1 mt-1"></i>As senhas são diferentes');
                $('#labelSenhaValida').removeClass('green-text').addClass('red-text');
                novaSenhaValida = false;
            }
        }
    });

    $('#alterarSenha').submit(function (e) {
        var formValido = true;
        if (novaSenhaValida == false) {
            formValido = false;
        }
        if (formValido == false) {
            e.preventDefault();
        }
    });
</script>
</body>
</html>