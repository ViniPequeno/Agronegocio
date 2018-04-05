<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/LocalAvesServlet" method="post">
                <p class="h1 text-center mb-4">Novo Aviário</p>

                 <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-hashtag  prefix grey-text"></i>
                    <input type="text" id="inputCodigo" name="inputCodigo" class="form-control" required autofocus maxlength="5">
                    <label for="inputCodigo">Código</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-arrows-alt-h prefix grey-text"></i>
                    <input type="text" id="inputLargura" name="inputLargura" class="form-control" required autofocus maxlength="5">
                    <label for="inputLargura">Largura</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-arrows-alt-v prefix grey-text"></i>
                    <input type="text" id="inputComprimento" name="inputComprimento" class="form-control" required maxlength="5">
                    <label for="inputComprimento">Comprimento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-arrows-alt prefix grey-text"></i>
                    <input type="text" id="inputArea" name="inputArea" class="form-control" required maxlength="5">
                    <label for="inputArea">Área</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputFuncao" name="inputFuncao" class="form-control" required maxlength="20">
                    <label for="inputFuncao">Função</label>
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

                <!-- Material textarea message -->
                <div class="md-form">
                    <i class="fa fa-pencil-alt prefix grey-text"></i>
                    <textarea type="text" id="inputObs" name="inputObs" class="form-control md-textarea" rows="3" required></textarea>
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
