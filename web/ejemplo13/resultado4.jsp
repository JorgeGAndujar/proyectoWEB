<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MOSTRAR PROFESORES</h1>
        <%
            List<String> profesores_al = (ArrayList) request.getAttribute("profesores_al");
            if (profesores_al != null) {
                for (String profesores : profesores_al) {
                    out.println(profesores);
                }
            }
        %>
    </body>
</html>
