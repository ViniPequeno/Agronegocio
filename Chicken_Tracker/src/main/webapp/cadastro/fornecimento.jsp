<%@page import="br.com.avicultura.chicken_tracker.Servlets.Produto.ConsultaProduto"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Produto"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/FornecimentoServlet" name="formCadastro" method="post">
                <p class="h1 text-center mb-4">Novo Fornecimento</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="inputCNPJ" name="inputCNPJ" class="form-control" required autofocus maxlength="8">
                    <label for="inputCNPJ">CNPJ</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-box prefix grey-text"></i>
                    <input type="text" id="inputQtde" name="inputQtde" class="form-control" required  maxlength="5">
                    <label for="inputQtde">Quantidade</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputValorPagamento" name="inputValorPagamento" class="form-control" required maxlength="20">
                    <label for="inputValorPagamento">Valor do pagamento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-calendar-alt prefix grey-text"></i>
                    <input type="text" id="inputDataVencimento" name="inputDataVencimento" class="form-control" required maxlength="10">
                    <label for="inputDataVencimento">Data de vencimento</label>
                </div>
                <div class="md-form">
                    <select name="inputProduto" id="inputProduto">
                        <% Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
                            for (Produto p : ConsultaProduto.returnListProduto(e.getSufixoCNPJ())) { %>
                        <option value="<%=p.getCodigo()%>"><%=p.getNome()%></option>
                        <% }%>
                    </select>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-primary" name="fornecimento" value="cadastrar" type="submit">Confirmar</button>
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
<script>
    $('#inputValorPagamento').maskMoney({prefix: 'R$ ', thousands: '.', decimal: ','});
    $('form[name="formCadastro"').submit(function () {
        var value = $('#inputValorPagamento').maskMoney('unmasked')[0];
        $('#inputValorPagamento').val(value);
        $('#inputCNPJ').unmask('00.000.000');
    });
</script>
<script src="../_JS/formUtils.js"></script>
</body>
</html>
