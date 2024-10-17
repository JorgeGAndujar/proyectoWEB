<%-- 
    Document   : update
    Created on : 16 oct 2024, 14:27:55
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
        <h1>ACTUALIZAR REGISTROS</h1>
        <form action="http://localhost:8080/PROYECTO_WEB_JAVA/ServletCrud?opcion=4">
            <input type="hidden" name="txtOpcion" value="4"/>
            PRODUCTO<br>
            <input type="text" name="txtNombre" placeholder="Ingrese Nombre NUEVO"/><br>
            DATOS GENERALES DEL PRODUCTO<br>
            <input type="text" name="txtMarca" placeholder="Ingrese Marca NUEVO"/><br>
            <input type="text" name="txtModelo" placeholder="Ingrese Modelo NUEVO"/><br>
            <input type="text" name="txtPrecio" placeholder="Ingrese Precio NUEVO"/><br>
            DATOS TECNICOS DEL PRODUCTO<br>
            <input type="text" name="txtPantalla" placeholder="Ingrese Pantalla NUEVO"/><br>
            <input type="text" name="txtResolucion" placeholder="Ingrese Resolución NUEVO"/><br>
            <input type="submit" name="actualizar" value="ACTUALIZAR">
        </form>
    </body>
</html>
