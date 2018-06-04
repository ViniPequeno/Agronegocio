<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Produto.ConsultaProduto"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Produto"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="card mx-auto my-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/LocalAvesServlet" method="post" name="formCadastro">
                <p class="h1 text-center mb-4">Novo Aviário</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-hashtag  prefix grey-text"></i>
                    <input type="text" id="inputCodigo" name="inputCodigo" class="form-control" required autofocus>
                    <label for="inputCodigo">Código</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-arrows-alt-h prefix grey-text"></i>
                    <input type="text" id="inputLargura" name="inputLargura" class="form-control" required>
                    <label for="inputLargura">Largura</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-arrows-alt-v prefix grey-text"></i>
                    <input type="text" id="inputComprimento" name="inputComprimento" class="form-control" required>
                    <label for="inputComprimento">Comprimento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-arrows-alt prefix grey-text"></i>
                    <input type="text" id="inputArea" name="inputArea" class="form-control" readonly="true" required>
                    <label for="inputArea">Área</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-calendar-alt prefix grey-text"></i>
                    <input type="text" id="inputDataAbertura" name="inputDataAbertura" class="form-control" required maxlength="10">
                    <label for="inputDataAbertura">Data de abertura</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-calendar-alt prefix grey-text"></i>
                    <input type="text" id="inputDataFechamento" name="inputDataFechamento" class="form-control" required maxlength="10">
                    <label for="inputDataFechamento">Data de fechamento</label>
                </div>

                <div class='row'>
                    <div class="col mt-4">
                        <i class="fa fa-box prefix grey-text mr-3 ml-1" data-fa-transform="grow-14"></i>
                        <label class="grey-text" for='inputProduto'>Produto</label>
                        <select name="inputProduto" id="inputProduto">
                            <% Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
                                for (Produto p : ConsultaProduto.returnListProduto(e.getSufixoCNPJ(), (Negocio) request.getSession().getAttribute("negocio"))) {%>
                            <option value="<%=p.getCodigo()%>"><%=p.getNome()%></option>
                            <% }%>
                        </select>
                    </div>
                    <!--
                <div class="col">
                    <div class="md-form">
                        <i class="fa fa-inbox prefix grey-text"></i>
                        <input type="text" id="inputQtde" name="inputQtde" class="form-control" required maxlength="10">
                        <label for="inputQtde">Quantidade</label>
                    </div>
                </div>
                    -->
                </div>

                <!-- Material textarea message -->
                <div class="md-form">
                    <i class="fa fa-pencil-alt prefix grey-text"></i>
                    <textarea type="text" id="inputObs" name="inputObs" class="form-control md-textarea" rows="3" required></textarea>
                    <label for="inputObs">Observações</label>
                </div>
                <div class="text-center mt-4">
                    <button name="localaves" value="cadastrar" class="btn btn-primary" type="submit">Confirmar</button>
                    <button class="btn btn-primary" type="reset">Limpar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src='../js/mascara.js'></script>
<script src='../js/maskMoney.js'></script>
<script src="../js/formUtils.js"></script>
<script>
    $('#inputLargura').maskMoney({suffix: ' m', thousands: '.', decimal: ','});
    $('#inputComprimento').maskMoney({suffix: ' m', thousands: '.', decimal: ','});
    //$('#inputArea').maskMoney({suffix: ' m²', thousands: '.', decimal: ','});
    $('form[name="formCadastro"]').submit(function () {
        var largura = $('#inputLargura').maskMoney('unmasked')[0];
        var comprimento = $('#inputComprimento').maskMoney('unmasked')[0];
        var area = $('#inputArea').val();
        area = area.replace(".","").replace(",",".");
        area = area.slice(0,area.length-3);
        $('#inputLargura').val(largura);
        $('#inputComprimento').val(comprimento);
        $('#inputArea').val(area);
    });
    $('#inputLargura, #inputComprimento').change(function () {
        if ($('#inputLargura').val() != "" && $('#inputComprimento').val() != "") {
            var largura = $('#inputLargura').maskMoney('unmasked')[0];
            var comprimento = $('#inputComprimento').maskMoney('unmasked')[0];
            var area = (comprimento * largura).toFixed(2);
            area = area.replace(".", ",");
            var cont = 0;
            for (var i = area.length - 3; i > 0; i--, cont++) {
                if ((cont % 3 == 0) && (cont!=0)) {
                    area = [area.slice(0, i), ".", area.slice(i)].join('');
                }
            }
            $('#inputArea').val(area + " m²");
        }
    });
</script>
</body>
</html>
