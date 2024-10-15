<%-- 
    Document   : create
    Created on : 15 oct 2024, 11:32:18
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                font-family: "Courier New";
                font-size: 14px;
            }
        </style>    
    </head>
    <body>
        <h1>INSERTAR UN REGISTRO</h1>
        <form action="">
            PRODUCTO<br>
            <input type="text" name="txtNombre" placeholder="Ingrese nombre"/><br>
            DATOS GENERALES DEL PRODUCTO<br>
            <input type="text" name="txtMarca" placeholder="Ingrese marca"/><br>
            <input type="text" name="txtModelo" placeholder="Ingrese modelo"/><br>
            <input type="text" name="txtPrecio" placeholder="Ingrese precio"/><br>
            DATOS TECNICOS DEL PRODUCTO<br>
            <input type="text" name="txtPantalla" placeholder="Ingrese Pantalla"/><br>
            <input type="text" name="txtResolucion" placeholder="Ingrese Resolución"/><br>
            
            <input type="submit" name="insertar" value="INSERTAR"/>
        </form>
    </body>
</html>
