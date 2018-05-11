<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio"%>
<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/PagamentoServlet" name="formCadastro" method="post">
                <p class="h1 text-center mb-4">Novo Pagamento</p>

                <div class="form-row">
                    <div class="col-md-4">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-money-bill-alt prefix grey-text"></i>
                            <input type="text" id="inputValor" name="inputValor" class="form-control" required autofocus>
                            <label for="inputValor">Valor</label>
                        </div>
                    </div>
                    <!--
                    <div class="col-md-4">
                    
                    <div class="md-form">
                        <i class="fa fa-calendar prefix grey-text"></i>
                        <input type="text" id="inputData" name="inputData" class="form-control" required maxlength="7">
                        <label for="inputData">Data</label>
                    </div>
                </div>
                    -->
                    <div class="form-inline col-md-4 mt-3">     
                        <!--Radio group-->
                        <div class="form-check">
                            <input class="form-check-input" name="inputTipo" type="radio" value="D" id="radio100">
                            <label class="form-check-label" for="radio100">Despesa</label>
                        </div>

                        <div class="form-check">
                            <input class="form-check-input" name="inputTipo" type="radio" value="G" id="radio101" checked>
                            <label class="form-check-label" for="radio101">Ganho</label>
                        </div>
                        <!--Radio group-->
                    </div>
                </div>
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-clipboard prefix grey-text"></i>
                    <input type="text" id="inputDescricao" name="inputDescricao" class="form-control" required maxlength="80">
                    <label for="inputDescricao">Descrição</label>
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
<script src="../_JS/maskMoney.js"></script>
<script src="../_JS/formUtils.js"></script>
<script>
    $('#inputValor').maskMoney({prefix: 'R$ ', thousands: '.', decimal: ','});
    $('form[name="formCadastro"').submit(function () {
        var value = $('#inputValor').maskMoney('unmasked')[0];
        $('#inputValor').val(value);
    });
    initInputs();
</script>
</body>
</html>
