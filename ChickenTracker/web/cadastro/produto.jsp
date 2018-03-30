<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="card">
        <div class="card-body">
            <form>
                <p class="h1 text-center mb-4">Novo Produto</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="inputCodigo" class="form-control" required autofocus maxlength="20">
                    <label for="inputCodigo">Código</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputNome" class="form-control" required maxlength="50">
                    <label for="inputNome">Nome</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputDescricao" class="form-control md-textarea" required maxlength="100">
                    <label for="inputDescricao">Descrição</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-card prefix grey-text"></i>
                    <input type="text" id="inputQtdeAtual" class="form-control" required maxlength="10">
                    <label for="inputQtdeAtual">Quantidade atual</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="far fa-id-card prefix grey-text"></i>
                    <input type="text" id="inputMinQtde" class="form-control" required maxlength="10">
                    <label for="inputMinQtde">Quantidade Mínima</label>
                </div>

                <!-- Material input email -->
                <div class="md-form">
                    <i class="fa fa-envelope prefix grey-text"></i>
                    <input type="text" id="inputMaxQtde" class="form-control" required maxlength="10">
                    <label for="inputMaxQtde">Quantidade Máxima</label>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-green" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
</body>
</html>
