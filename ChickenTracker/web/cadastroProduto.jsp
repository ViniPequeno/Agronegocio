<% String css = "cadastro.css";%>
<%@ include file="cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card">
        <div class="card-body">
            <form>
                <p class="h1 text-center mb-4">Novo Produto</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterNameEx" class="form-control">
                    <label for="materialFormRegisterNameEx">Código</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterSalarioEx" class="form-control">
                    <label for="materialFormRegisterSalarioEx">Nome</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterCargoEx" class="form-control">
                    <label for="materialFormRegisterCargoEx">Descrição</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-card prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterCPFEx" class="form-control">
                    <label for="materialFormRegisterCPFEx">Quantidade atual</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="far fa-id-card prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterRGEx" class="form-control">
                    <label for="materialFormRegisterRGEx">Quantidade Mínima</label>
                </div>

                <!-- Material input email -->
                <div class="md-form">
                    <i class="fa fa-envelope prefix grey-text"></i>
                    <input type="email" id="materialFormRegisterEmailEx" class="form-control">
                    <label for="materialFormRegisterEmailEx">Quantidade Máxima</label>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-green" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>

<%@include file="rodape.jsp" %>
</body>

</html>
