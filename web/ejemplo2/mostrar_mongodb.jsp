<%-- 
    Document   : mostrar_mongodb
    Created on : 4 sept 2024, 14:17:43
    Author     : Jorge
--%>

<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MOSTRAR TODOS LOS DOCUMENTOS DE UNA COLECCION</h1>
        <%
            //CONEXION CON MONGODB
            String databaseName = "campusfp";
            String serverName = "localhost";//127.0.0.1
            int puerto = 27017;

            // Crear la conexión al servidor de MongoDB
            MongoClient mc = new MongoClient(serverName, puerto);

            // Obtener la base de datos
            MongoDatabase database = mc.getDatabase(databaseName);
            MongoCollection<Document> alumno = database.getCollection("alumno");
            
            out.println("OK CONEXION" + "<br><br>");
            
            //MOSTRAR TODOS LOS DOCUMENTOS
            try (MongoCursor<Document> cursor = alumno.find().iterator()) {
            while (cursor.hasNext()) {
                Document doc = cursor.next();
                out.print(doc.toJson() + "<br><br>");
                //System.out.println(doc.toJson());
            }
        }
        %>
    </body>
</html>
