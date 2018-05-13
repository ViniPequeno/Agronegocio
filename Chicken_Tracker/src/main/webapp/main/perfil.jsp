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
            <form action="/Chicken_Tracker/PerfilAlterarServlet" method="post" enctype="multipart/form-data">
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
                            <input type="password" id="inputSenha"  name="inputSenha" class="form-control" required maxlength="255">
                            <label for="inputSenha">Senha</label>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputConfirmarSenha" class="form-control" required maxlength="255">
                            <label for="inputConfirmarSenha">Confirmar senha</label>
                        </div>
                        <input type="file" name="inputFoto" id="inputFoto" accept="image/*">
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
