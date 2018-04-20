<% String css = "../_CSS/login.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="col-xl-5 col-lg-6 col-md-10 col-sm-12 mx-auto mt-lg-5">
        <div class="card">
            <div class="card-body">
                <!-- Material form login -->
                <form action="/Chicken_Tracker/executarLogin" method="post">
                    <p class="h4 text-center mb-4">Faça o seu login</p>
                    <!-- Material input email -->
                    <div class="md-form">
                        <i class="fa fa-id-card prefix grey-text"></i>
                        <input type="text" id="inputLogin" name="inputLogin" class="form-control" autofocus required>
                        <label for="inputLogin">Login</label>
                    </div>

                    <!-- Material input password -->
                    <div class="md-form">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input type="password" id="inputSenha" name="inputSenha" class="form-control">
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
<script>
    $(window).load(function () {
        var urlString = document.URL;
        var url = new URL(urlString);
        if (url.searchParams.get("password") == "false") {
            alert("ok");
        }
    });
</script>
</body>
</html>