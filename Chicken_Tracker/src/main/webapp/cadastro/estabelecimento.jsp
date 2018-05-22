<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio"%>
<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<% String negocioCNPJ = ((Negocio)sessao.getAttribute("negocio")).getEmpresaCNPJ();%>
<!-- Material form register -->
<div class="container">
    <div class="card mx-auto my-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/EstabelecimentoServlet" name="formCadastro" method="post">
                <p class="h1 text-center mb-4">Novo Estabeleciemnto</p>
                <div class="form-row">
                    <div class="col-md-4">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-id-badge prefix grey-text"></i>
                            <input type="text" id="inputNegocioCNPJ" name="inputNegocioCNPJ" class="form-control CNPJ disabled" maxlength="10" value="<%=negocioCNPJ%>">
                            <label for="inputNegocioCNPJ">CNPJ do negócio</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-id-badge prefix grey-text"></i>
                            <input type="text" id="inputSufixoCNPJ" name="inputSufixoCNPJ" class="form-control" required autofocus maxlength="8">
                            <label for="inputSufixoCNPJ">Sufixo CNPJ</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-money-bill-alt prefix grey-text"></i>
                            <input type="text" id="inputCNAE" name="inputCNAE" class="form-control" required maxlength="7">
                            <label for="inputCNAE">CNAE</label>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-money-bill-alt prefix grey-text"></i>
                            <input type="text" id="inputSaldo" name="inputSaldo" class="form-control" required>
                            <label for="inputSaldo">Saldo inicial</label>
                        </div>
                    </div>
                </div>
                <p class="h5 mt-5">
                    <i class="fa fa-warehouse grey-text fa-lg mr-2"></i>Endereço</p>
                <div class="form-row">
                    <div class="col-md-2">
                        <div class="md-form">
                            <input type="text" id="inputCEP" name="inputCEP" class="form-control CEP" required maxlength="80">
                            <label for="inputCEP">CEP</label>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="md-form">
                            <input type="text" id="inputRua" name="inputRua" class="form-control" readonly="true" maxlength="80">
                            <label class="disabled" for="inputRua">Rua</label>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="md-form">
                            <input type="text" id="inputBairro" name="inputBairro" class="form-control" readonly="true" maxlength="80">
                            <label class="disabled" for="inputBairro">Bairro</label>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6">
                        <div class="md-form">
                            <input type="text" id="inputCidade" name="inputCidade" class="form-control" readonly="true" maxlength="80">
                            <label class="disabled" for="inputCidade">Cidade</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="md-form">
                            <input type="text" id="inputEstado" name="inputEstado" class="form-control" readonly="true" maxlength="80">
                            <label class="disabled" for="inputEstado">UF</label>
                        </div>
                    </div>
                </div>
                <div class="text-right mt-4">
                    <button name="estabelecimento" value="cadastrar" class="btn btn-primary" type="submit">Confirmar</button>
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
<script src="../_JS/consultaCEP.js"></script>
<script>
    $('form[name="formCadastro"').submit(function () {
        $('#inputSufixoCNPJ').unmask('0000-00');
        $('#inputCNAE').unmask('00000-0/00');
        $('.CEP').unmask('00000-000');
    });
    initInputs();
</script>
</body>
</html>
