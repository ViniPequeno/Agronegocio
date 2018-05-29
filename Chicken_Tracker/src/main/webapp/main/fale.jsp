<% String css = "../_CSS/login.css";%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Perfil.ConsultaPerfil"%>
<!DOCTYPE html>
<%@include file="../cabecalho.jsp"%>
<div class="container">
    <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2">
        <div class="card narrower my-5 mx-auto">
            <div class="card-body">
                <h2 class="text-center">Fale Conosco</h2>
                <div class="container">
                    <form method="post" action="/Chicken_Tracker/EmailServlet">
                        <%if (!(sessao.isNew() || sessao.getAttribute("usuario_logado").equals("false"))) {
                                String login = (String) sessao.getAttribute("nome_usuario");
                                Perfil p = ConsultaPerfil.findById(login);
                        %>

                        <div class="form-group row">
                            <div class="col-sm-2 offset-sm-2">
                                <label for="email" data-error="">E-mail</label>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" id="email" name="email" class="form-control validate" value="<%=p.getEmail()%>" readonly required>
                            </div>
                        </div>

                        <%} else { %>

                        <div class="form-group row">
                            <div class="col-sm-2 offset-sm-2">
                                <label for="email" data-error="">E-mail</label>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" id="email" name="email" class="form-control validate" required>
                            </div>
                        </div>

                        <%}%>

                        <div class="form-group row">
                            <div class="col-sm-2 offset-sm-2">
                                <label for="assunto" data-error="">Assunto</label>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" id="assunto" name="assunto" class="form-control validate" maxlength="30" size="30" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-2 offset-sm-2">
                                <label for="mensagem" data-error="">Mensagem</label>                            
                            </div>
                            <div class="col-sm-6">
                                <textarea class="form-control" id="mensagem" rows="3" name="mensagem" placeholder="Insira a sua mensagem aqui..." required></textarea>
                            </div>
                        </div>

                        <div class="text-center mt-4">
                            <button class="btn btn-default" name="opcao" value="faleConosco" type="submit">Enviar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
</body>
</html>
