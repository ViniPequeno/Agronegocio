<%@page import="br.com.avicultura.chicken_tracker.Models.Perfil"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Perfil.ConsultaPerfil"%>
<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<%String login = (String) sessao.getAttribute("nome_usuario");
    Perfil p = ConsultaPerfil.findById(login);%>
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-header">
            <p class="h1 text-center mb-4">Sua conta</p>
        </div>
        <div class="card-body">
            <form action="/Chicken_Tracker/PerfilServlet" method="post" enctype="multipart/form-data">
                <div class="row">
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
                            <input type="text" id="inputLogin"  name="inputLogin" value="<%=p.getUsuario()%>" class="form-control" required maxlength="20">
                            <label for="inputLogin">Login</label>
                        </div>

                        <!-- Material input email -->
                        <div class="md-form">
                            <i class="fa fa-envelope prefix grey-text"></i>
                            <input type="email" id="inputEmail" name="inputEmail" value="<%=p.getEmail()%>" class="form-control" required maxlength="80">
                            <label for="inputEmail">Email</label>
                        </div>

                    </div>
                    <div class="col-md-4 mt-md-3 pt-md-3">
                        <img class="mx-auto d-block" id="imgPerfil" width="200px" height="200px" src="<%=p.getFoto()%>">
                        <input type="file" name="file" id="inputFoto" accept="image/*">
                        <button class="btn btn-outline-cyan mx-auto d-block" type="button" id="btnSelecionarImg">Escolher foto de perfil</button>
                        <button class="btn btn-outline-red mx-auto d-block" type="button" id="btnRedefinirImg">Redefinir foto</button>
                    </div>
                </div>
                <div class="mt-4 row">
                    <div class="col-md-6 text-md-left text-center">
                        <button type="button" data-toogle="modal" data-target="#alterarSenha" class="btn btn-cyan">Alterar Senha</button></div>
                    <div class="col-md-6 text-md-right text-center">
                        <button name="usuario" value="alterar" class="btn btn-cyan" type="submit">Confirmar</button>
                        <button type="button" data-toogle="modal" data-target="#confirmarExclusao" class="btn btn-red">Excluir</button>
                    </div>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="confirmarExclusao" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirmar exclusão?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Esta conta será excluída e assim como seus negócios</p>
                </div>
                <div class="modal-footer">
                    <form action="/Chicken_Tracker/PerfilServlet" method="post">
                        <button name="usuario" value="excluir" type="submit" class="btn btn-primary">Confirmar</button>
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="alterarSenha" tabindex="-1" role="dialog" aria-labelledby="alterarSenha" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Alterar senha</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Esta conta será excluída e assim como seus negócios</p>
                </div>
                <div class="modal-footer">
                    <form action="/Chicken_Tracker/PerfilServlet" method="post">
                        <!-- Material input text -->
                        <div class="md-form"> 
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" name="inputSenhaAtual" id="inputSenhaAtual" class="form-control">
                            <label for="inputSenhaAtual">Senha atual</label>
                        </div>
                        <!-- Material input text -->
                        <div class="md-form"> 
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" name="inputNovaSenha" id="inputNovaSenha" class="form-control">
                            <label for="inputNovaSenha">Nova Senha</label>
                        </div>
                        <!-- Material input text -->
                        <div class="md-form"> 
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputConfirmarNovaSenha"  name="inputConfirmarNovaSenha" class="form-control" >
                            <label for="inputConfirmarNovaSenha">Confirmar nova senha</label>
                        </div>
                        <button name="usuario" value="senha" type="submit" class="btn btn-primary">Confirmar</button>
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/formUtils.js"></script>
<script>
    $('#btnSelecionarImg').click(function () {
        $('#inputFoto').val(null);
        $('#inputFoto').click();
    });
    $('#btnRedefinirImg').click(function () {
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
</script>
</body>
</html>
