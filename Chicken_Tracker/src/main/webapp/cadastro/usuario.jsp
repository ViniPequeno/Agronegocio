<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto my-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/PerfilServlet" method="post" autocomplete="off" id="formCadastro"
                  enctype="multipart/form-data">
                <p class="h1 text-center">Criar conta</p>
                <!-- Material input text -->

                <div class="row">

                    <input type="hidden" name="foto1" id="foto1" value="0"/>
                    <div class="col-md-8">
                        <div class="md-form form-group mt-5">
                            <i class="fa fa-user prefix grey-text"></i>
                            <input type="text" id="inputNome" name="inputNome" class="form-control" required autofocus maxlength="50" aria-described-by="nomeDescricao">
                            <label for="inputNome">Nome Completo</label>
                            <small id="nomeDescricao" class="form-text text-muted">
                                Seu nome pode ser visto por outros usuários que pesquisam por seus negócios.
                            </small>
                        </div>
                        <!-- Material input text -->
                        <div class="md-form form-group mt-4">
                            <i class="fa fa-id-card prefix grey-text"></i>
                            <input type="text" id="inputLogin"  name="inputLogin" class="form-control" length="20" required maxlength="20" aria-described-by="loginDescricao">
                            <label for="inputLogin">Login</label>
                            <small id="loginDescricao" class="form-text text-muted">
                                Seu login é único e não poderá ser alterado após o cadastro.
                            </small>
                        </div>

                        <!-- Material input -->
                        <div class="md-form form-group mt-4">
                            <i class="fa fa-envelope prefix grey-text"></i>
                            <input type="email" id="inputEmail" name="inputEmail" class="form-control validate" required maxlength="80" aria-described-by="emailDescricao">
                            <label for="inputEmail" data-error="Email inválido">Digite seu email</label>
                            <small id="emailDescricao" class="form-text text-muted mt-4 pt-2">
                                Um email de confirmação de cadastro será enviada para este email.
                            </small>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form form-group mt-4"> 
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputSenha" name="inputSenha" class="form-control validate" aria-describedby="senhaDescricao" required minlength="8" maxlength="20">
                            <label for="inputSenha">Senha</label>
                            <small id="senhaDescricao" class="form-text text-muted">
                                Sua senha deve ter entre 8-20 caracteres, ter letras e números, e não deve ter espaços, caracteres especiais, ou emoji.
                            </small>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form form-group mt-5">
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputConfirmarSenha" minlength="8" maxlength="20" class="form-control validate" required>
                            <label for="inputConfirmarSenha">Confirmar senha</label> 
                        </div>
                        <p id="senhaOK" class="mt-5 ml-4 invisible">Senha inválida</p>
                    </div>
                    <div class="col-md-4 mt-md-5 mt-3 pt-md-5 pt-3">
                        <img class="mx-auto d-block" id="imgPerfil" width="200px" height="200px" src="../img/farmer.jpg">
                        <input type="file" name="file" id="inputFoto" accept="image/*">
                        <button class="btn btn-outline-cyan mx-auto d-block" type="button" id="btnSelecionarImg">Escolher foto de perfil</button>
                        <button class="btn btn-outline-red mx-auto d-block" type="button" id="btnRedefinirImg">Redefinir foto</button>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <button name="usuario" value="cadastrar" class="btn btn-cyan" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script src="../js/formUtils.js"></script>
<script>
    var senhasCorretas = false;
    $('#inputLogin').change(function () {
        $.ajax({
            url: "http://localhost/Chicken_Tracker_Consulta/public/index.php/api/perfil/usuario/" + $('#inputLogin').val() + "/",
            async: false,
            dataType: 'json',
            success: function (data) {
                if (data.existe === "false") {
                    $('#inputLogin').removeClass('invalid');
                    $('#inputLogin').addClass('valid');
                } else {
                    $('#inputLogin').removeClass('valid');
                    $('#inputLogin').addClass('invalid');
                }
            }, error: function (XMLHttpRequest, textStatus, errorThrown, data) {
                console.log(XMLHttpRequest + "   " + errorThrown);
            }
        });
    });
    $('#inputEmail').change(function () {
        $.ajax({
            url: "http://localhost:8080/public/index.php/api/perfil/email/" + $('#inputEmail').val() + "/",
            async: false,
            dataType: 'json',
            success: function (data) {
                if (data.existe === "false") {
                    $('#inputEmail').removeClass('invalid');
                    $('#inputEmail').addClass('valid');
                } else {
                    $('#inputEmail').removeClass('valid');
                    $('#inputEmail').addClass('invalid');
                }
            }
        });
    });
    $('#foto1').val('0');

    $('#inputConfirmarSenha, #inputSenha').change(function () {
        var senha = $('#inputSenha').val();
        var confirmarSenha = $('#inputConfirmarSenha').val();
        if (senha !== "" && confirmarSenha !== ""
                && senha.length >= 8 && confirmarSenha.length >= 8) {
            $('#senhaOK').removeClass('invisible');
            if (senha == confirmarSenha) {
                $('#senhaOK').html('<i class="fa fa-check prefix mr-1"></i>As senhas são iguais');
                $('#senhaOK').removeClass('red-text').addClass('green-text');
                senhasCorretas = true;
            } else {
                $('#senhaOK').html('<i class="fa fa-times prefix mr-1"></i>As senhas devem ser iguais');
                $('#senhaOK').removeClass('green-text').addClass('red-text');
                senhasCorretas = false;
            }
        }
    });

    $('#btnSelecionarImg').click(function () {
        $('#foto1').val('1');
        $('#inputFoto').val(null);
        $('#inputFoto').click();
    });
    $('#btnRedefinirImg').click(function () {
        $('#foto1').val('2');
        $('#inputFoto').val(null);
        $('#imgPerfil').attr('src', "../img/farmer.jpg");
    });
    $('#inputFoto').change(function () {
        var selectedFile = event.target.files[0];
        var reader = new FileReader();

        var imgtag = document.getElementById("imgPerfil");
        if (selectedFile != null) {
            imgtag.title = selectedFile.name;

            reader.onload = function (event) {
                imgtag.src = event.target.result;
            };

            reader.readAsDataURL(selectedFile);
        }
    });

    $('#formCadastro').submit(function () {
        var formValido = true;
        if (senhasCorretas == false) {
            formValido = false;
        }
        if (formValido == false) {
            e.preventDefault();
        }
    });
</script>
</body>
</html>
