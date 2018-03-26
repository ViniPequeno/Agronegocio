<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card">
        <div class="card-body">
            <form>
                <p class="h1 text-center mb-4">Novo Fornecedor</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="inputCNPJ" class="form-control">
                    <label for="inputCNPJ">CNPJ</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputQtde" class="form-control">
                    <label for="inputQtde">Quantidade</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputFormaPagamento" class="form-control">
                    <label for="inputFormaPagamento">Forma de pagamento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputDataVencimento" class="form-control">
                    <label for="inputDataVencimento">Data de vencimento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-card prefix grey-text"></i>
                    <input type="text" id="inputTipo" class="form-control">
                    <label for="inputTipo">Tipo</label>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-primary" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
</body>

</html>
