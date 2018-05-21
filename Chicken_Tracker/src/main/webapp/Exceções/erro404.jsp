<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página não encontrada</title>
    </head>
    <body>
         
        <%
            if(request.getSession().getAttribute("usuario_logado")!=null){
        %>
        <div> Desculpe, <%=request.getSession().getAttribute("nome_usuario")%> esse caminho não existe!</div> 
        <a href="../seusNegocios/negocios.jsp"> Volte para tela de seus negócios </a>
        <%}else{%>
         <div> Desculpe, esse caminho não existe!</div>
        <%}%>
        <a href="../main/index.jsp"> Menu Principal</a>
    </body>
</html>
