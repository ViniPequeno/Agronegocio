<% String css = "../_CSS/login.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="col-xl-5 col-lg-6 col-md-10 col-sm-12 mx-auto mt-lg-5">
        <div class="card">
            <div class="card-body">
                <!-- Material form login -->
                <form>
                    <p class="h4 text-center mb-4">Faça o seu login</p>
                    <!-- Material input email -->
                    <div class="md-form">
                        <i class="fa fa-id-card prefix grey-text"></i>
                        <input type="email" id="inputLogin" class="form-control">
                        <label for="materialFormLoginEmailEx">Login</label>
                    </div>

                    <!-- Material input password -->
                    <div class="md-form">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input type="password" id="inputSenha" class="form-control">
                        <label for="inputSenha">Senha</label>
                    </div>

                    <div class="text-center mt-4">
                        <button class="btn btn-default" type="submit">Entrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
</body>
</html>