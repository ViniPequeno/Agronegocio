<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/EstabelecimentoServlet" method="post">
                <p class="h1 text-center mb-4">Novo Estabeleciemnto</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputSufixoCNPJ" name="inputSufixoCNPJ" class="form-control" required autofocus maxlength="8">
                    <label for="inputSufixoCNPJ">Sufixo CNPJ</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputCNAE" name="inputCNAE" class="form-control" required maxlength="7">
                    <label for="inputCNAE">CNAE</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-warehouse prefix grey-text"></i>
                    <input type="text" id="inputEndereco" name="inputEndereco" class="form-control" required maxlength="80">
                    <label for="inputEndereco">Endereço</label>
                </div>

                <label>Negócio</label>
                <select class="browser-default">
                    <option value="" disabled selected>Choose your option</option>
                    <option value="1">Option 1</option>
                    <option value="2">Option 2</option>
                    <option value="3">Option 3</option>
                </select>

                <div class="text-center mt-4">
                    <button class="btn btn-primary" type="submit">Confirmar</button>
                </div>

            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script src="../Bootstrap/_JS/bootstrap-combobox.js"></script>
</body>
</html>
