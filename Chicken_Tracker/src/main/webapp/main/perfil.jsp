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

                        <!-- Material input text -->
                        <div class="md-form"> 
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputSenha"  name="inputSenha" class="form-control" >
                            <label for="inputSenha">Senha</label>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputConfirmarSenha" class="form-control" >
                            <label for="inputConfirmarSenha">Confirmar senha</label>
                        </div>
                    </div>
                    <div class="col-md-4 mt-md-3 pt-md-3">
                        <img class="mx-auto d-block" id="imgPerfil" width="200px" height="200px" src="<%=p.getFoto()%>">
                        <input type="file" name="file" id="inputFoto" accept="image/*">
                        <button class="btn btn-outline-cyan mx-auto d-block" type="button" id="btnSelecionarImg">Escolher foto de perfil</button>
                        <button class="btn btn-outline-red mx-auto d-block" type="button" id="btnRedefinirImg">Redefinir foto</button>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <button name="usuario" value="alterar" class="btn btn-cyan" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
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
