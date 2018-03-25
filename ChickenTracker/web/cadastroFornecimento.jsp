<% String css = "cadastro.css";%>
<%@ include file="cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card"><div class="card-body"><form>
                <p class="h1 text-center mb-4">Novo Fornecedor</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterNameEx" class="form-control">
                    <label for="materialFormRegisterNameEx">CNPJ</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterSalarioEx" class="form-control">
                    <label for="materialFormRegisterSalarioEx">Quantidade</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterSalarioEx" class="form-control">
                    <label for="materialFormRegisterSalarioEx">Forma de pagamento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterCargoEx" class="form-control">
                    <label for="materialFormRegisterCargoEx">Vencimento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-card prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterCPFEx" class="form-control">
                    <label for="materialFormRegisterCPFEx">Tipo</label>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-primary" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>


</div>

<%@include file="rodape.jsp" %>
</body>

</html>
