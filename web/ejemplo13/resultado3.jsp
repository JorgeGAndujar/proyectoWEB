
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
        <h1>MOSTRAR ASIGNATURAS</h1>
        <%
            List<String> asignaturas_al = (ArrayList) request.getAttribute("asignaturas_al");
            if (asignaturas_al != null) {
                for (String asignaturas : asignaturas_al) {
                    out.println(asignaturas);
                }
            }
        %>
    </body>
</html>
