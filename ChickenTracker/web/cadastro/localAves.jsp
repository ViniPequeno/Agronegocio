<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="card">
        <div class="card-body">
            <form>
                <p class="h1 text-center mb-4">Novo Estabeleciemnto</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="inputLargura" class="form-control" required autofocus maxlength="5">
                    <label for="inputLargura">Largura</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputComprimento" class="form-control" required maxlength="5">
                    <label for="inputComprimento">Comprimento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputArea" class="form-control" required maxlength="5">
                    <label for="inputArea">Área</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputFuncao" class="form-control" required maxlength="20">
                    <label for="inputFuncao">Função</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputDataAbertura" class="form-control" required maxlength="10">
                    <label for="inputDataAbertura">Data de abertura</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputDataFechamento" class="form-control" required maxlength="10">
                    <label for="inputDataFechamento">Data de fechamento</label>
                </div>

                <!-- Material textarea message -->
                <div class="md-form">
                    <i class="fa fa-pencil-alt prefix grey-text"></i>
                    <textarea id="inputObs" class="form-control md-textarea" rows="3" required></textarea>
                    <label for="inputObs">Observações</label>
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
