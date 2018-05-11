<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/NegocioServlet" name="formCadastro" method="post">
                <p class="h1 text-center mb-4">Novo Negócio</p>
                <div class="form-row">
                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-user prefix grey-text"></i>
                            <input type="text" id="inputNome" name="inputNome" class="form-control" required autofocus maxlength="50" >
                            <label for="inputNome">Nome</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-envelope prefix grey-text"></i>
                            <input type="text" id="inputEmail" name="inputEmail" class="form-control" required maxlength="80">
                            <label for="inputEmail">Email</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-4">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="far fa-id-card prefix grey-text"></i>
                            <input type="text" id="inputCNPJ" name="inputCNPJ" class="form-control" required maxlength="8">
                            <label for="inputCNPJ">CNPJ</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <!-- Material input phone -->
                        <div class="md-form">
                            <i class="fa fa-phone prefix grey-text"></i>
                            <input type="text" id="inputFone1" name="inputFone1" class="form-control" required maxlength="9">
                            <label for="inputFone1">Telefone 1:</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <!-- Material input phone -->
                        <div class="md-form">
                            <i class="fa fa-phone prefix grey-text"></i>
                            <input type="text" id="inputFone2" name="inputFone2" class="form-control" required maxlength="9">
                            <label for="inputFone2">Telefone 2:</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fab fa-facebook prefix grey-text"></i>
                            <input type="text" id="inputLinkFB" name="inputLinkFB" class="form-control" maxlength="80">
                            <label for="inputLinkFB">Facebook</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fab fa-instagram prefix grey-text"></i>
                            <input type="text" id="inputLinkInstagram" name="inputLinkInstagram" class="form-control" maxlength="80" >
                            <label for="inputLinkInstagram">Instagram</label>
                        </div>
                    </div>
                </div>

                <div class="mt-4 text-right">
                    <button class="btn btn-primary" type="submit">Confirmar</button>
                    <button class="btn btn-primary" type="reset">Limpar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script src="../_JS/mascara.js"></script>
<script src="../_JS/formUtils.js"></script>
<script>
    $('form[name="formCadastro"').submit(function () {
        $('#inputCNPJ').unmask('00.000.000');
    });
    initInputs();
</script>
</body>
</html>
