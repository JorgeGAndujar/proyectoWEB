<%-- 
    Document   : delete
    Created on : 16 oct 2024, 14:05:30
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
        <style>
            body{
                font-family: "Courier New";
                font-size: 14px;
            }
        </style>    
        <h1>BORRAR REGISTROS</h1>
        <form action="http://localhost:8080/PROYECTO_WEB_JAVA/ServletCrud?opcion=3">
            <input type="hidden" name="txtOpcion" value="3"/>
            <input type="text" name="txtNombre" placeholder="Ingrese Nombre del Producto a Eliminar"/><br>
            <input type="submit" name="delete" value="DELETE">
        </form>
    </body>
</html>
