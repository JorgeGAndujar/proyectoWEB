<%-- 
    Document   : tabla2
    Created on : 6 sept 2024, 11:09:59
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>SELECCIONE LA TABLA DE MULTIPLICAR</h1>
        <%-- componente JAVA --%>
        <%
            //ENTRADA
            String n = "";
            boolean bandera = false;
            //ACCION
            if (request.getParameter("cmdAceptar") != null) {
                try {
                    int num = Integer.parseInt(request.getParameter("txtN"));
                    if (num >= 0 && num <= 12) {
                        n = num + "";
                        bandera = true;
                    }
                } catch (Exception e) {

                }
            }
        %>
        <%--COMPONENTE VISTA(HTML)--%>
        <form>
            <!--ENTRADA -->
            <input type="text" name="txtN" value="<%=n%>" placeholder="ESCRIBIR NUMERO TABLA" />
            <!-- ACCION -->
            <input type="submit" value="ACEPTAR" name="cmdAceptar" />   
        </form>

        <%
            if (bandera == true) {
                for (int j = 1; j <= 12; j++) {
        %>


        <%=n%> X <%=j%> = <%=Integer.parseInt(n) * j%><br>

        <%
                }
            }
        %>
    </body>
</html>
