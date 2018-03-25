<% String css = "cadastro.css";%>
<%@ include file="cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card"><div class="card-body"><form>
                <p class="h1 text-center mb-4">Nova Vacina</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterNameEx" class="form-control">
                    <label for="materialFormRegisterNameEx">Nome</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterSalarioEx" class="form-control">
                    <label for="materialFormRegisterSalarioEx">Data da primeira vacinação:</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterCargoEx" class="form-control">
                    <label for="materialFormRegisterCargoEx">Data da próxima vacinação</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-card prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterCPFEx" class="form-control">
                    <label for="materialFormRegisterCPFEx">Código</label>
                </div>

                <!-- Material textarea message -->
                <div class="md-form">
                    <i class="fa fa-pencil-alt prefix grey-text"></i>
                    <textarea type="text" id="materialFormContactMessageEx" class="form-control md-textarea" rows="3"></textarea>
                    <label for="materialFormContactMessageEx">Descrição</label>
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
