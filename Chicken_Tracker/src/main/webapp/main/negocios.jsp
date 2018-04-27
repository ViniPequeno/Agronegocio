<% String css = "../_CSS/negocios.css";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<div class="container">
    <%  //Gera tabela se houver algum registro
        List<Negocio> negocios;
        //negocios = ConsultaNegocio.returnList();
        //if (negocios.size() > 0) {
    %>
    <div class="card card-cascade narrower mt-5">
        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Negócios</h4>

        </div>
        <div class="px-4">
            <div class="md-form mb-5">
                <input class="form-control pesquisar" type="text" placeholder="Pesquisar negócios" name="inputPesquisar">
            </div>
            <table class="table table-hover table-responsive-md btn-table table-bordered" style="margin-bottom: 20px">
                <thead class="thead-dark">
                    <tr class="text-white">
                        <th>Nome</th>
                        <th>Proprietário</th>
                        <th>CNPJ</th>
                        <th>Email</th>
                        <th>Fone 1</th>
                        <th>Fone 2</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>        
                    </tr>
                    <tr>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>       
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <%//} else {%>
    <!--<h2 class="py-5 text-center">Nenhum negócio registrado ainda</h2>-->
    <%//}%>
    
</div>
<%@include file="../rodape.jsp" %>
</body>
</html>
