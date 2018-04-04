<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/FornecedorServlet" method="post">
                <p class="h1 text-center mb-4">Novo Fornecedor</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="inputCNPJ" name="inputCNPJ" class="form-control" required autofocus maxlength="8">
                    <label for="inputCNPJ">CNPJ</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputQtde" name="inputQtde" class="form-control" required  maxlength="5">
                    <label for="inputQtde">Quantidade</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputValorPagamento" name="inputValorPagamento" class="form-control" required maxlength="20">
                    <label for="inputFormaPagamento">Valor do pagamento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputDataVencimento" name="inputDataVencimento" class="form-control" required maxlength="10">
                    <label for="inputDataVencimento">Data de vencimento</label>
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
