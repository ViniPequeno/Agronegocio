<% String css = "cadastro.css";%>
<%@ include file="cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card"><div class="card-body"><form>
                <p class="h1 text-center mb-4">Novo Estabeleciemnto</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputSufixoCNPJ" class="form-control">
                    <label for="inputSufixoCNPJ">Sufixo CNPJ</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputCNAE" class="form-control">
                    <label for="inputCNAE">CNAE</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-warehouse prefix grey-text"></i>
                    <input type="text" id="inputEndereco" class="form-control">
                    <label for="inputEndereco">Endereço</label>
                </div>

                <!-- Material textarea message -->
                <div class="md-form">
                    <i class="fa fa-pencil-alt prefix grey-text"></i>
                    <textarea type="text" id="inputObservacoes" class="form-control md-textarea" rows="3"></textarea>
                    <label for="inputObservacoes">Observações</label>
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
