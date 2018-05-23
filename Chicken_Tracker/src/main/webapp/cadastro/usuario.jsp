<% String css = "../_CSS/cadastro.css";%>
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

                    <div class="col-md-8">
                        <div class="md-form form-group mt-5">
                            <i class="fa fa-user prefix grey-text"></i>
                            <input type="text" id="inputNome" name="inputNome" class="form-control" required autofocus maxlength="50">
                            <label for="inputNome">Nome Completo</label>
                        </div>
                        <!-- Material input text -->
                        <div class="md-form form-group mt-5">
                            <i class="fa fa-id-card prefix grey-text"></i>
                            <input type="text" id="inputLogin"  name="inputLogin" class="form-control" length="20" required maxlength="20">
                            <label for="inputLogin">Login</label>
                        </div>

                        <!-- Material input -->
                        <div class="md-form form-group mt-5">
                            <i class="fa fa-envelope prefix grey-text"></i>
                            <input type="email" id="inputEmail" name="inputEmail" class="form-control validate" required maxlength="80">
                            <label for="inputEmail" data-error="Email inválido">Digite seu email</label>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form form-group mt-5"> 
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
<script src="../_JS/formUtils.js"></script>
<script>
    var senhasCorretas = false;
    $('#inputConfirmarSenha').blur(function () {
        $('#inputConfirmarSenha').removeClass('valid');
        var senha = $('#inputSenha').val();
        var senha2 = $('#inputConfirmarSenha').val();
        if ($(this).val() == "") {
            $('#inputConfirmarSenha').removeClass('invalid');
        }
        else{
            if (senha === senha2) {
                senhasCorretas = true;
                $('#inputConfirmarSenha').removeClass('invalid');
                $('#inputConfirmarSenha').addClass('valid');
            } else {
                senhasCorretas = false;
                $('#inputConfirmarSenha').removeClass('valid');
                $('#inputConfirmarSenha').addClass('invalid');
            }
        }
    });

    $('#btnSelecionarImg').click(function () {
        $('#inputFoto').val(null);
        $('#inputFoto').click();
    });
    $('#btnRedefinirImg').click(function () {
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
    
    $('#formCadastro').submit(function (){
        var formValido = true;
        if(senhasCorretas == false){
            formValido = false;
        }
        if(formValido == false){
            e.preventDefault();
        }
    });
</script>
</body>
</html>
