<%-- 
    Document   : insertar
    Created on : 9 sept 2024, 11:35:12
    Author     : Jorge
--%>

<%@page import="misrc.Validar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERTAR</title>
    </head>
    <body>
        <h1>INSERTAR DOCUMENTO</h1>
        <%--COMPONENTE JAVA (ACCION BOTONES) --%>
        <%
            String idAlumno = "";
            String nombre = "";
            String edad = "";
            String estatura = "";
            if (request.getParameter("cmdGuardar") != null) {
                idAlumno = request.getParameter("txtIdAlumno");
                nombre = request.getParameter("txtNombre");
                edad = request.getParameter("txtEdad");
                estatura = request.getParameter("txtEstatura");

                if (Validar.edad(edad)) {
                    out.print("OK:EDAD");

                }else
                    out.print("ERROR EDAD");

            }
        %>
        <%--COMPONENTE VISTA (HTML) --%>
        <form action="">
            <input type="text" name="txtIdAlumno" value="<%= idAlumno%>"/> 
            <input type="text" name="txtNombre" value="<%= nombre%>"/> 
            <input type="text" name="txtEdad" value="<%= edad%>"/> 
            <input type="text" name="txtEstatura" value="<%= estatura%>"/>   
            <input type="submit" value="GUARDAD" name="cmdGuardar" />
        </form>
    </body>
</html>
