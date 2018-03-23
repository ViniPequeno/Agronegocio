<% String css = "cadastro.css";%>
    <%@ include file="cabecalho.jsp"%>

        <!-- Material form register -->
        <div class="container">
            <form>
                <p class="h4 text-center mb-4">Cadastro de funcionário</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterNameEx" class="form-control">
                    <label for="materialFormRegisterNameEx">Nome</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterSalarioEx" class="form-control">
                    <label for="materialFormRegisterSalarioEx">Salário</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterCargoEx" class="form-control">
                    <label for="materialFormRegisterCargoEx">Cargo</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterCPFEx" class="form-control">
                    <label for="materialFormRegisterCPFEx">CPF</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="materialFormRegisterRGEx" class="form-control">
                    <label for="materialFormRegisterRGEx">RG</label>
                </div>

                <!-- Material input email -->
                <div class="md-form">
                    <i class="fa fa-envelope prefix grey-text"></i>
                    <input type="email" id="materialFormRegisterEmailEx" class="form-control">
                    <label for="materialFormRegisterEmailEx">Email</label>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-primary" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->

        </div>

        <%@include file="rodape.jsp" %>
            </body>

            </html>
