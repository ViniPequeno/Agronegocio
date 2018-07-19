<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<% String css = "../css/cadastro.css";
   String titulo ="Novo Produto";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="card mx-auto my-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/ProdutoServlet" method="post">
                <p class="h1 text-center mb-4">Novo Produto</p>
                <input type="hidden" id="estabelecimento" value="<%=((Estabelecimento) request.getSession().getAttribute("estabelecimento")).getId()%>">
                <div class="form-row">
                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-hashtag prefix grey-text"></i>
                            <input type="text" id="inputCodigo" name="inputCodigo" class="form-control " required autofocus maxlength="20">
                            <label for="inputCodigo">Código</label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-book prefix grey-text"></i>
                            <input type="text" id="inputNome" name="inputNome" class="form-control" required maxlength="50">
                            <label for="inputNome">Nome</label>
                        </div>
                    </div>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-clipboard-list prefix grey-text"></i>
                    <input type="text" id="inputDescricao" name="inputDescricao" class="form-control md-textarea" required maxlength="100">
                    <label for="inputDescricao">Descrição</label>
                </div>

                <div class="form-row">
                    <div class="col-md-4">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-inbox prefix grey-text"></i>
                            <input type="text" id="inputQtdeAtual" name="inputQtdeAtual" class="form-control" required maxlength="10">
                            <label for="inputQtdeAtual">Quantidade atual</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-box prefix grey-text"></i>
                            <input type="text" id="inputMinQtde" name="inputMinQtde" class="form-control" required maxlength="10">
                            <label for="inputMinQtde">Quantidade Mínima</label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <!-- Material input email -->
                        <div class="md-form">
                            <i class="fa fa-boxes prefix grey-text"></i>
                            <input type="text" id="inputMaxQtde" name="inputMaxQtde" class="form-control" required maxlength="10">
                            <label for="inputMaxQtde">Quantidade Máxima</label>
                        </div>
                    </div>
                </div>
                <div>
                    <i class="fa fa-box prefix grey-text"></i>
                    <select name="inputTipo" id="inputTipo">
                        <option value="1">Produção</option> 
                        <option value="2">Estoque</option> 
                    </select>
                    <label for="inputTipo">Tipo</label>
                </div>
                <div class="text-right mt-4">
                    <button name="produto" value="cadastrar" class="btn btn-primary" type="submit">Confirmar</button>
                    <button class="btn btn-primary" type="reset">Limpar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/formUtils.js"></script> 
<script>
    $('#inputCodigo').blur(function () {
        if ($('#inputCodigo').val() !== "" && $('#inputProduto').val() !== "") {
            $.ajax({
                url: "http://localhost:8080/public/index.php/api/produto/" + $('#estabelecimento').val() + "/" + $('#inputCodigo').val(),
                async: false,
                dataType: 'json',
                success: function (data) {
                    if (data.existe === "false") {
                        alert("iu");
                        $('#inputCodigo').removeClass('invalid');
                        $('#inputCodigo').addClass('valid');
                    } else {
                        alert('oi');
                        $('#inputCodigo').removeClass('valid');
                        $('#inputCodigo').addClass('invalid');
                    }
                }
            });
        }
    });
</script>
</body>
</html>
