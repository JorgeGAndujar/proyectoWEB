<%-- 
    Document   : index
    Created on : 9 sept 2024, 11:01:15
    Author     : Jorge
--%>

<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  // Connection with MongoDB
    String databaseName = "campusfp";
    String serverName = "localhost";
    int puerto = 27017;

    // Create MongoDB client
    MongoClient mc = new MongoClient(serverName, puerto);
    MongoDatabase database = mc.getDatabase(databaseName);
    MongoCollection<Document> alumno = database.getCollection("alumno");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INDEX</title>
    </head>
    <body>
        <h1>INDEX</h1>
        <a href="ejemplo3/busca_mongodb_tabla.jsp">MOSTRAR</a><br>
        <a href="ejemplo5/actualizar_por_idAlumnos.jsp">BUSCAR-ELIMINAR-ACTUALIZAR</a><br>
        <a href="ejemplo6/insertar.jsp">INSERTAR</a><br>
        <a href="ejemplo7/otros_componentes.jsp">OTROS COMPONENTES</a><br>
        <a href="ejemplo7/calculadora.jsp">CALCULADORA</a><br>
        <a href="ejemplo7/formulario.jsp">FORMULARIO</a><br>
        <a href="ejemplo7/mostrar_basededatos.jsp">MOSTRAR BASE DE DATOS</a><br>
        <a href="ejemplo10/mi_delete_update.jsp">BORRAR Y ACTUALIZAR</a><br>
        <a href="ejemplo11/mostrar_cliente_mayor_gasto.jsp">CLIENTE MAYOR GASTO</a><br>
        <a href="ejemplo12/registrar_usuario.jsp">REGISTRAR USUARIO</a><br>
        <a href="ejemplo12/mostrar_usuarios.jsp">MOSTRAR USUARIOS</a><br>
        <a href="http://localhost:8080/PROYECTO_WEB_JAVA/MiServlet">MI SERVLET</a><br>
        <a href="ejemplo13/llamar_servlet.jsp">LLAMAR SERVLET CON UN BOTÓN</a><br>
        <a href="ejemplo13/llamar_servlet2.jsp">LLAMAR SERVLET2 CON UN BOTÓN</a><br>
        <a href="ejemplo13/menu.jsp">MENU</a><br>
        
    </body>
</html>
