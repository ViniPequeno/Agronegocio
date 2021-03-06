<% String css = "../css/cadastro.css";
   String titulo ="Novo Neg�cio";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto my-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/NegocioServlet" name="formCadastro" method="post">
                <p class="h1 text-center mb-4">Novo Neg�cio</p>
                <div class="form-row">
                    <div class="col-sm-6 offset-sm-2">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-user prefix grey-text"></i>
                            <input type="text" id="inputNome" name="inputNome" class="form-control" required autofocus maxlength="50" >
                            <label for="inputNome">Nome</label>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="far fa-id-card prefix grey-text"></i>
                            <input type="text" id="inputCNPJ" name="inputCNPJ" class="form-control" required maxlength="8">
                            <label for="inputCNPJ">CNPJ</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-sm-8 offset-sm-2">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-envelope prefix grey-text"></i>
                            <input type="email" id="inputEmail" name="inputEmail" class="form-control validate" required maxlength="80">
                            <label for="inputEmail" data-error="Email inv�lido">Email para contato</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-sm-4 offset-sm-2">
                        <!-- Material input phone -->
                        <div class="md-form">
                            <i class="fa fa-phone prefix grey-text"></i>
                            <input type="text" id="inputTelefone1" name="inputTelefone1" class="form-control" required maxlength="9">
                            <label for="inputTelefone1">Telefone 1:</label>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <!-- Material input phone -->
                        <div class="md-form">
                            <i class="fa fa-phone prefix grey-text"></i>
                            <input type="text" id="inputTelefone2" name="inputTelefone2" class="form-control" required maxlength="9">
                            <label for="inputTelefone2">Telefone 2:</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-sm-8 offset-sm-2">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fab fa-facebook prefix grey-text"></i>
                            <input type="url" id="inputLinkFB" name="inputLinkFB" class="form-control" maxlength="80">
                            <label for="inputLinkFB">Link do perfil do Facebook</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-sm-8 offset-sm-2">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fab fa-instagram prefix grey-text"></i>
                            <input type="text" id="inputLinkInstagram" name="inputUserInstagram" class="form-control" maxlength="80" >
                            <label for="inputUserInstagram">Nome de usu�rio Instagram</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-sm-4 offset-sm-6">
                        <div class="mt-4 text-right">
                            <button class="btn btn-primary" type="reset">Limpar</button>
                            <button name="negocio" value="cadastrar" class="btn btn-primary" type="submit">Confirmar</button>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script src="../js/mascara.js"></script>
<script src="../js/formUtils.js"></script>
<script>
     $('#inputCNPJ').blur(function () {
        $.ajax({
            url: "http://localhost:8080/public/index.php/api/negocio/" + $('#inputCNPJ').val() + "/",
            async: false,
            dataType: 'json',
            success: function (data) {
                if (data.existe === "false") {
                    $('#inputCNPJ').removeClass('invalid');
                    $('#inputCNPJ').addClass('valid');
                } else {
                    $('#inputCNPJ').removeClass('valid');
                    $('#inputCNPJ').addClass('invalid');
                }
            }
        });
    });
    $('form[name="formCadastro"').submit(function () {
        $('#inputCNPJ').unmask('00.000.000');
    });
    initInputs();
</script>
</body>
</html>
