<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto my-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/PerfilServlet" method="post" autocomplete="off" 
                  enctype="multipart/form-data">
                <p class="h1 text-center mb-4">Criar conta</p>
                <div class="row">
                                <input type="file" name="file" accept="image/*">
                                 
                    <div class="col-md-8">
                        <!-- Material input text -->
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
                            <input type="password" id="inputSenha" name="inputSenha" class="form-control" aria-describedby="senhaDescricao" required maxlength="20">
                            <label for="inputSenha">Senha</label>
                            <small id="senhaDescricao" class="form-text text-muted">
                                Sua senha deve ter entre 8-20 caracteres, ter letras e números, e não deve ter espaços, caracteres especiais, ou emoji.
                            </small>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form form-group mt-5">
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputConfirmarSenha" class="form-control" required maxlength="255">
                            <label for="inputConfirmarSenha">Confirmar senha</label>
                        </div>
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
</body>
</html>
