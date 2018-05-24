<%@page import="br.com.avicultura.chicken_tracker.Servlets.Perfil.ConsultaPerfil"%>
<!DOCTYPE html>
<%@include file="../cabecalho.jsp"%>
<div class="container">
    <div class="card">
        <div class="card-body">
            <div class="container">
                <h3 class="text-center">Fale Conosco</h3>
                <form method="post" action="">
                    <%if (!(sessao.isNew() || sessao.getAttribute("usuario_logado").equals("false"))) {
                            String login = (String) sessao.getAttribute("nome_usuario");
                            Perfil p = ConsultaPerfil.findById(login);
                    %>

                    <div class="md-form form-group">
                        <input type="text" id="inputEmail" name="inputEmail" class="form-control validate" value="<%=p.getEmail()%>" disabled="true" required>
                        <label for="inputEmail" data-error="">E-mail</label>
                    </div>

                    <% } else { %>
                    
                    <div class="md-form form-group">
                        <input type="text" id="inputEmail" name="inputEmail" class="form-control validate" autofocus required>
                        <label for="inputEmail" data-error="">E-mail</label>
                    </div>
                        
                    <%}%>
                    
                    <div class="md-form form-group">
                        <input type="text" id="inputAssunto" name="inputAssunto" class="form-control validate" required>
                        <label for="inputEmail" data-error="">Assunto</label>
                    </div>
                    
                    <div class="md-form form-group">
                        <input type="textarea" id="inputTexto" name="inputTexto" class="form-control validate" required>
                        <label for="inputTexto" data-error="">Assunto</label>
                    </div>
                    
                    <div class="text-center mt-4">
                        <button class="btn btn-default" type="submit">Enviar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
</body>
</html>
