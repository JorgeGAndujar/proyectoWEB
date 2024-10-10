
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
        <h1>MOSTRAR ALUMNOS</h1>
        <%
            List<String> alumnos_al = (ArrayList) request.getAttribute("alumnos_al");
            if (alumnos_al != null) {
                for (String alumnos : alumnos_al) {
                    out.println(alumnos);
                }
            }
        %>
    </body>
</html>
