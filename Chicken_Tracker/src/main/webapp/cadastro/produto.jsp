<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/ProdutoServlet" method="post">
                <p class="h1 text-center mb-4">Novo Produto</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-hashtag prefix"></i>
                    <input type="text" id="inputCodigo" name="inputCodigo" class="form-control" required autofocus maxlength="20">
                    <label for="inputCodigo">C�digo</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-book prefix"></i>
                    <input type="text" id="inputNome" name="inputNome" class="form-control" required maxlength="50">
                    <label for="inputNome">Nome</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-clipboard-list prefix"></i>
                    <input type="text" id="inputDescricao" name="inputDescricao" class="form-control md-textarea" required maxlength="100">
                    <label for="inputDescricao">Descri��o</label>
                </div>

                <div class="form-row">
                    <div class="col-md-4">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-inbox prefix"></i>
                            <input type="text" id="inputQtdeAtual" name="inputQtdeAtual" class="form-control" required maxlength="10">
                            <label for="inputQtdeAtual">Quantidade atual</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-box prefix"></i>
                            <input type="text" id="inputMinQtde" name="inputMinQtde" class="form-control" required maxlength="10">
                            <label for="inputMinQtde">Quantidade M�nima</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <!-- Material input email -->
                        <div class="md-form">
                            <i class="fa fa-boxes prefix"></i>
                            <input type="text" id="inputMaxQtde" name="inputMaxQtde" class="form-control" required maxlength="10">
                            <label for="inputMaxQtde">Quantidade M�xima</label>
                        </div>
                    </div>
                </div>
                <div>
                    <i class="fa fa-box prefix"></i>
                    <select name="inputTipo" id="inputTipo">
                        <option value="1">Produ��o</option> 
                        <option value="2">Estoque</option> 
                    </select>
                    <label for="inputTipo">Tipo</label>
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
<script>
    $('input').focus(function () {
        $(this).prev().addClass('light-green-text');
    });
    $('input').blur(function () {
        $(this).prev().removeClass('light-green-text');
    });
</script>
</body>
</html>
