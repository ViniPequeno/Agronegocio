<% String css = "../_CSS/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/FuncionarioServlet" name="formCadastro" method="post">
                <p class="h1 text-center mb-4">Novo Funcionário</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="inputNome" name="inputNome" class="form-control" required autofocus maxlength="80">
                    <label for="inputNome">Nome</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-card prefix grey-text"></i>
                    <input type="text" id="inputCPF" name="inputCPF" class="form-control" required maxlength="14">
                    <label for="inputCPF">CPF</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fas fa-address-card prefix grey-text"></i>
                    <input type="text" id="inputRG" name="inputRG" class="form-control" required maxlength="14">
                    <label for="inputRG">RG</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-clipboard prefix grey-text"></i>
                    <input type="text" id="inputCargo" name="inputCargo" class="form-control" required maxlength="80">
                    <label for="inputCargo">Cargo</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputSalario" name="inputSalario" class="form-control" required maxlength="80">
                    <label for="inputSalario">Salario</label>
                </div>


                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-clipboard-list prefix grey-text"></i>
                    <textarea id="inputSituacao" name="inputSituacao" class="form-control md-textarea" rows="3" required=""></textarea>
                    <label for="inputSituacao">Situação</label>
                </div>

                <div class="text-center mt-4">
                    <button class="btn btn-primary" name="funcionario" value="cadastrar" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script src="../_JS/validador-de-cpf.js"></script>
<script src="../_JS/mascara.js"></script>
<script src="../_JS/maskMoney.js"></script>
<script>
    $('#inputSalario').maskMoney({prefix: 'R$ ', thousands: '.', decimal: ','});
    $('form[name="formCadastro"').submit(function () {
        $('#inputSalario').maskMoney('destroy');
        $('#inputSalario').maskMoney({thousands: '', decimal: '.'});
        $('#inputSalario').maskMoney('mask');
        alert($('#inputSalario').val());
        $('#inputCPF').unmask('000.000.000-00');
        $('#inputRG').unmask('00.000.000-0');
    });
</script>
</body>
</html>
