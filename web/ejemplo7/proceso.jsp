<%-- 
    Document   : proceso
    Created on : 10 sept 2024, 10:14:21
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PROCESO</title>
    </head>
    <body>
        <h1>INFORMACIÓN RECIBIDA DEL FORMULARIO</h1>
        <%
            String nombre = "";
            String clave = "";
            String genero = "";
            String autorizacion = "";
            String[] pasatiempos = null;
            String codigoPais = "";
            String[] mascotas = null;
            if (request.getParameter("cmdEnviar") != null) {
                nombre = request.getParameter("txtNombre");
                clave = request.getParameter("txtClave");
                genero = request.getParameter("radioGenero");
                autorizacion = request.getParameter("chbAceptar");
                pasatiempos = request.getParameterValues("chbPasatiempo");//values para varios datos
                codigoPais = request.getParameter("cboCodigoPais");
                mascotas = request.getParameterValues("lstMascota");
            }
        %>
        <input type="text" value="<%=nombre%>" />
        <input type="text" value="<%=clave%>" />
        <input type="text" value="<%=genero%>" />
        <input type="text" value="<%=autorizacion%>" />
        <br><br>
        <%
            if (pasatiempos != null) {
                for (int i = 0; i < pasatiempos.length; i++) {
                    out.println(pasatiempos[i] + "<br>");
                }
            }
        %>
        <br><br>
        <input type="text" value="<%=codigoPais%>" />
        <br><br>
        <%--
            if (mascotas != null) {
                for (int i = 0; i < mascotas.length; i++) {
                    out.println(mascotas[i] + "<br>");
                }
            }
        --%>
        <h2>PINTAR MASCOTAS EN UNA LISTA</h2>
        <%
            if (mascotas != null) {
        %>
        
        <select size="<%=mascotas.length%>">
            
        <%
            for (int i = 0; i < mascotas.length; i++) {
               out.println("<option>" + mascotas[i] + "<br>");
                }
        %>
        
        </select>
        
            <%
                }
            %>
            
      
        <h2>OTRA FORMA DE PINTAR MASCOTAS EN UNA LISTA</h2>
        <%
            if (mascotas != null) {
                out.println("<select size=" + mascotas.length + ">");
                for (int i = 0; i < mascotas.length; i++) {
                    out.println("<option>" + mascotas[i] + "</option>");
                }
                out.println("</select>");
            }
        %>
        <a href="otros_componentes.jsp">VOLVER AL FORMULARIO</a>
    </body>
</html>
