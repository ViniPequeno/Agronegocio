<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="card mx-auto my-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/VacinaServlet" method="post">
                <p class="h1 text-center mb-4">Nova Vacina</p>
                <input type="hidden" id="estabelecimento" value="<%=((Estabelecimento)request.getSession().getAttribute("estabelecimento")).getId()%>">
                <div class="form-row">
                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-user prefix grey-text"></i>
                            <input type="text" id="inputNome" name="inputNome" class="form-control" required autofocus maxlength="50">
                            <label for="inputNome">Nome</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-id-card prefix grey-text"></i>
                            <input type="text" id="inputCodigo" name="inputCodigo" class="form-control" required maxlength="10">
                            <label for="inputCodigo">Código</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                     <div class="col-md-3">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-calendar-plus prefix grey-text"></i>
                            <input type="text" id="inputDataProximaVacina" name="inputDataProximaVacina" class="form-control" required maxlength="10">
                            <label for="inputDataProximaVacina">Data da próxima vacina</label>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-calendar prefix grey-text"></i>
                            <input type="text" id="inputDataPrimeiraVacina" name="inputDataPrimeiraVacina" class="form-control" required maxlength="10">
                            <label for="inputDataPrimeiraVacina">Data da primeira vacina</label>
                        </div>
                    </div>
                </div>

                <!-- Material textarea message -->
                <div class="md-form">
                    <i class="fa fa-pencil-alt prefix grey-text"></i>
                    <textarea id="inputDescricao" name="inputDescricao" class="form-control md-textarea" rows="3" required=""></textarea>
                    <label for="inputDescricao">Descrição</label>
                </div>
                <div class="text-center mt-4">
                    <button name="vacina" value="cadastrar" class="btn btn-primary" type="submit">Confirmar</button>
                    <button class="btn btn-primary" type="reset">Limpar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/mascara.js"></script>
<script src="../js/formUtils.js"></script>
<script>
    $('#inputCodigo').blur(function () {
        if ($('#inputCodigo').val() !== "" && $('#inputProduto').val() !== "") {
            $.ajax({
                url: "http://localhost:8080/public/index.php/api/localaves/" + $('#estabelecimento').val() + "/" + $('#inputCodigo').val(),
                async: false,
                dataType: 'json',
                success: function (data) {
                    if (data.existe === "false") {
                        $('#inputCodigo').removeClass('invalid');
                        $('#inputCodigo').addClass('valid');
                    } else {
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
