<%@page import="br.com.avicultura.chicken_tracker.Models.Perfil"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Perfil.ConsultaPerfil"%>
<% String css = "../css/cadastro.css";
    String titulo = "Sua conta";%>
<%@ include file="../cabecalho.jsp"%>
<%String login = (String) sessao.getAttribute("nome_usuario");
    Perfil p = ConsultaPerfil.findById(login);%>
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-header">
            <p class="h1 my-3">Sua conta</p>
        </div>
        <div class="card-body">
            <form action="/Chicken_Tracker/PerfilServlet" method="post" enctype="multipart/form-data">
                <div class="row">
                    <input type="hidden" name="foto1" id="foto1" value="0"/>
                    <div class="col-md-8">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-user prefix grey-text"></i>
                            <input type="text" id="inputNome" name="inputNome" value="<%=p.getNome()%>" class="form-control" required autofocus maxlength="50">
                            <label for="inputNome">Nome</label>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-id-card prefix grey-text"></i>
                            <input type="text" id="inputLogin"  name="inputLogin" value="<%=p.getUsuario()%>" class="form-control" required maxlength="20" readonly="true">
                            <label for="inputLogin">Login</label>
                        </div>

                        <!-- Material input email -->
                        <div class="md-form">
                            <i class="fa fa-envelope prefix grey-text"></i>
                            <input type="email" id="inputEmail" name="inputEmail" value="<%=p.getEmail()%>" class="form-control" required maxlength="80">
                            <label for="inputEmail">Email</label>
                        </div>

                    </div>
                    <div class="col-md-4 mt-md-0 pt-md-0 mt-3 pt-3">
                        <img class="mx-auto d-block" id="imgPerfil" width="200px" height="200px" src="<%=p.getFoto()%>">
                        <input type="file" name="file" id="inputFoto" accept="image/*">

                        <button class="btn btn-outline-cyan mx-auto d-block" type="button" id="btnSelecionarImg">Escolher foto de perfil</button>
                        <button class="btn btn-outline-red mx-auto d-block" type="button" id="btnRedefinirImg">Redefinir foto</button>
                    </div>
                </div>
                <div class="mt-4 row">
                    <div class="col-md-6 text-md-left text-center">
                        <button type="button" class="btn btn-cyan" data-toggle="modal" data-target="#modalAlterarSenha">Alterar senha</button>
                    </div>
                    <div class="col-md-6 text-md-right text-center">
                        <button name="usuario" value="alterar" class="btn btn-cyan" type="submit">Confirmar</button>
                        <button type="button" class="btn btn-red" data-toggle="modal" data-target="#confirmarExclusao">Excluir</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalAlterarSenha" tabindex="-1" role="dialog" aria-labelledby="modalAlterarSenhaLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAlterarSenhaLabel">Alterar senha</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="alterarSenha" method="post">
                        <!-- Material input text -->
                        <div class="md-form form-group"> 
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" name="inputSenhaAtual" id="inputSenhaAtual" class="form-control validate" minlength="8" maxlength="20">
                            <label for="inputSenhaAtual" data-error="Mínimo de 8 caracteres">Senha atual</label>
                        </div>
                        <!-- Material input text -->
                        <div class="md-form form-group mt-5"> 
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" name="inputNovaSenha" id="inputNovaSenha" class="form-control validate" minlength="8" maxlength="20">
                            <label for="inputNovaSenha" data-error="Mínimo de 8 caracteres">Nova Senha</label>
                        </div>
                        <!-- Material input text -->
                        <div class="md-form form-group mt-5"> 
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputConfirmarNovaSenha" name="inputConfirmarNovaSenha" class="form-control validate" minlength="8" maxlength="20">
                            <label for="inputConfirmarNovaSenha" data-error="Mínimo de 8 caracteres">Confirmar nova senha</label>
                        </div>
                        <p id="labelSenhaAtual" class="mt-5 ml-4 invisible">Senha inválida</p>
                        <p id="labelSenhaValida" class="mt-5 ml-4 invisible">Senha inválida</p>
                    </form>
                </div>
                <div class="modal-footer">
                    <button form="alterarSenha" formaction="/Chicken_Tracker/PerfilServlet" name="usuario" value="senha" type="submit" class="btn btn-primary">Confirmar</button>
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="confirmarExclusaoLabel" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-danger" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title heading lead" id="confirmarExclusaoLabel">Confirmar exclusão?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-trash-alt fa-4x mb-3 animated rotateIn"></i>
                        <p>Todos os negócios associados a esta conta também serão apagados</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Cancelar</button>
                    <form action="/Chicken_Tracker/PerfilServlet" method="post">
                        <button name="usuario" value="excluir" type="submit" class="btn btn-danger">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/formUtils.js"></script>
<script>
    var confirmarNovaSenhaValida = false;
    var novaSenhaValida = false;
    $('#foto1').val("0");
    $('#btnSelecionarImg').click(function () {
        $('#inputFoto').val(null);
        $('#inputFoto').click();
        $('#foto1').val("1");
    });
    $('#btnRedefinirImg').click(function () {
        $('#foto1').val("2");
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

    $('#inputNovaSenha').change(function () {
        var senhaNova = $('#inputNovaSenha');
        var senhaAtual = $('#inputSenhaAtual');
        if (senhaNova.val() != "" && senhaAtual.val() != ""
                && (senhaNova.val().length >= 8) && (senhaAtual.val().length >= 8)) {
            if (senhaNova.val() == senhaAtual.val()) {
                $('#labelSenhaAtual').html('<i class="fa fa-times prefix mr-1"></i>A nova senha não pode ser igual a senha atual');
                $('#labelSenhaAtual').removeClass('green-text').addClass('red-text');
                $('#labelSenhaAtual').removeClass('invisible');
                novaSenhaValida = false;
            } else {
                $('#labelSenhaAtual').addClass('invisible');
                novaSenhaValida = true;
            }
        }
    });

    $('#inputConfirmarNovaSenha, #inputNovaSenha').change(function () {
        var senhaNova = $('#inputNovaSenha');
        var confirmarNovaSenha = $('#inputConfirmarNovaSenha');
        if (senhaNova.val() != "" && confirmarNovaSenha.val() != ""
                && (senhaNova.val().length >= 8) && (confirmarNovaSenha.val().length >= 8)) {
            $('#labelSenhaValida').removeClass('invisible');
            if (senhaNova.val() == confirmarNovaSenha.val()) {
                $('#labelSenhaValida').html('<i class="fa fa-check prefix mr-1"></i>As senhas são iguais');
                $('#labelSenhaValida').removeClass('red-text').addClass('green-text');
                confirmarNovaSenhaValida = true;
            } else {
                $('#labelSenhaValida').html('<i class="fa fa-times prefix mr-1"></i>As senhas são diferentes');
                $('#labelSenhaValida').removeClass('green-text').addClass('red-text');
                confirmarNovaSenhaValida = false;
            }
        }
    });

    $('#alterarSenha').submit(function (e) {
        var formValido = true;
        if (novaSenhaValida == false || confirmarNovaSenhaValida == false) {
            formValido = false;
        }
        if (formValido == false) {
            e.preventDefault();
        }
    });

</script>
</body>
</html>
