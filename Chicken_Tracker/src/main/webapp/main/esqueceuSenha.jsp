<% String css = "../css/login.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="col-xl-5 col-lg-6 col-md-10 col-sm-12 mx-auto mt-lg-5">
        <div class="card narrower">
            <div class="card-body">
                <!-- Material form login -->
                <form action="/Chicken_Tracker/EmailServlet" method="post" id="alterarSenha">
                    <p class="h4 text-center mb-4">Esqueceu seu senha?</p>
                    <p class="lead">Informe seu login e lhe enviaremos um email para confirmamos que você é você mesmo</p>
                    <!-- Material input text -->
                    <div class="md-form form-group my-5"> 
                        <i class="fa fa-user prefix grey-text"></i>
                        <input type="text" name="inputLogin" id="inputLogin" class="form-control validate" autofocus="true" maxlength="20">
                        <label for="inputLogin" data-error="Mínimo de 8 caracteres">Login</label>
                    </div>
                    <div class="text-center">
                        <button name="opcao" value="esqueceuSenha" class="btn btn-default" type="submit">Confirmar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script src="../js/formUtils.js"></script>
<script>
    
</script>
</body>
</html>