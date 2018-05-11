<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio"%>
<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/EstabelecimentoServlet" name="formCadastro" method="post">
                <p class="h1 text-center mb-4">Novo Estabeleciemnto</p>
                <div class="form-row">
                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-id-badge prefix grey-text"></i>
                            <input type="text" id="inputSufixoCNPJ" name="inputSufixoCNPJ" class="form-control" required autofocus maxlength="8">
                            <label for="inputSufixoCNPJ">Sufixo CNPJ</label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-money-bill-alt prefix grey-text"></i>
                            <input type="text" id="inputCNAE" name="inputCNAE" class="form-control" required maxlength="7">
                            <label for="inputCNAE">CNAE</label>
                        </div>
                    </div>
                </div>
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-warehouse prefix grey-text"></i>
                    <input type="text" id="inputEndereco" name="inputEndereco" class="form-control" required maxlength="80">
                    <label for="inputEndereco">Endereço</label>
                </div>
                <div class="text-right mt-4">
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
        $('#inputSufixoCNPJ').unmask('0000-00');
        $('#inputCNAE').unmask('00000-0/00');
    });
    initInputs();
</script>
</body>
</html>
