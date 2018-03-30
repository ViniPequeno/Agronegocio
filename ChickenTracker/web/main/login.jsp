<% String css = "../_CSS/login.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
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
                        <label for="inputSenha">Your password</label>
                    </div>

                    <div class="text-center mt-4">
                        <button class="btn btn-default" type="submit">Login</button>
                    </div>
                </form>
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
</body>
</html>