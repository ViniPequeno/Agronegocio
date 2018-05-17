<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/PerfilServlet" method="post" autocomplete="off">
                <p class="h1 text-center mb-4">Criar conta</p>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile">
                            <div class="photo ">
                                <input type="file" name="inputFoto" accept="image/*">
                                <div class="photo__helper">
                                    <div class="photo__frame photo__frame--circle">
                                        <canvas class="photo__canvas"></canvas>
                                        <div class="message is-empty">
                                            <p class="message--desktop">Arraste sua foto até aqui ou procure no seu PC.</p>
                                            <p class="message--mobile">Aperte aqui para escolher sua foto</p>
                                        </div>
                                        <div class="message is-loading">
                                            <i class="fa fa-2x fa-spin fa-spinner"></i>
                                        </div>
                                        <div class="message is-dragover">
                                            <i class="fa fa-2x fa-cloud-upload"></i>
                                            <p>Drop your photo</p>
                                        </div>
                                        <div class="message is-wrong-file-type">
                                            <p>Only images allowed.</p>
                                            <p class="message--desktop">Drop your photo here or browse your computer.</p>
                                            <p class="message--mobile">Tap here to select your picture.</p>
                                        </div>
                                        <div class="message is-wrong-image-size">
                                            <p>Your photo must be larger than 350px.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="photo_options hide">
                                    <div class="photo_zoom">
                                        <input type="range" class="zoom-handler">
                                    </div><a href="javascript:;" class="remove"><i class="fa fa-trash"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
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
                    <button class="btn btn-cyan" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script src="../fontawesome-free-5.0.8/_JS/profile-picture.js"></script>
<script src="../_JS/formUtils.js"></script>
</body>
</html>
