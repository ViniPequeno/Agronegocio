<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card">
        <div class="card-body">
            <form>
                <p class="h1 text-center mb-4">Novo Negócio</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="inputNome" class="form-control" required autofocus maxlength="50">
                    <label for="inputNome">Nome</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputLinkFB" class="form-control" maxlength="80">
                    <label for="inputLinkFB">Facebook</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputLinkInstagram" class="form-control" maxlength="80" >
                    <label for="inputLinkInstagram">Instagram</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-card prefix grey-text"></i>
                    <input type="text" id="inputEmail" class="form-control" required maxlength="80">
                    <label for="inputEmail">Email</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="far fa-id-card prefix grey-text"></i>
                    <input type="text" id="inputCNPJ" class="form-control" required maxlength="8">
                    <label for="inputCNPJ">CNPJ</label>
                </div>

                <!-- Material input email -->
                <div class="md-form">
                    <i class="fa fa-envelope prefix grey-text"></i>
                    <input type="text" id="inputFone1" class="form-control" required maxlength="9">
                    <label for="inputFone1">Telefone 1:</label>
                </div>

                <!-- Material input email -->
                <div class="md-form">
                    <i class="fa fa-envelope prefix grey-text"></i>
                    <input type="text" id="inputFone2" class="form-control" required maxlength="9">
                    <label for="inputFone2">Telefone 2:</label>
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
