<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if (request.getSession().getAttribute("error") != null) {%>
        <h1><%=request.getSession().getAttribute("error")%></h1>
        <%} else {%>
        <h1>Pagina errada</h1>
        <%}%>
    </body>
</html>
