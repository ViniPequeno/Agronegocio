<%-- 
    Document   : Outros
    Created on : 21/05/2018, 11:27:39
    Author     : Yan e Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if (request.getSession().getAttribute("erroOutro") != null) {%>
        <h1><%=request.getSession().getAttribute("erroOutro")%></h1>
        <%} else {%>
        <h1>Pagina errada</h1>
        <%}%>
    </body>
</html>
