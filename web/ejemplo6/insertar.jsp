<%-- 
    Document   : insertar
    Created on : 9 sept 2024, 11:35:12
    Author     : Jorge
--%>
<%@page import="misrc.Validar"%>
<%@page import="com.mongodb.client.model.Updates"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
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
        <title>INSERTAR</title>
    </head>
    <body>
        <h1>INSERTAR DOCUMENTO</h1>
        <%--COMPONENTE JAVA (ACCION BOTONES) --%>
        <%
            String idAlumno = Validar.idAlumno(alumno);
            String nombre = "";
            String edad = "";
            String estatura = "";

            String mNombre = "";
            String mEdad = "";
            String mEstatura = "";
            if (request.getParameter("cmdGuardar") != null) {
                idAlumno = request.getParameter("txtIdAlumno");
                nombre = request.getParameter("txtNombre");
                edad = request.getParameter("txtEdad");
                estatura = request.getParameter("txtEstatura");

                if (Validar.nombre(nombre)) {
                    mNombre = "✅";
                } else {
                    mNombre = "❌";
                }

                if (Validar.edad(edad)) {
                    mEdad = "✅";
                } else {
                    mEdad = "❌";
                }

                if (Validar.estatura(estatura)) {
                    mEstatura = "✅";
                } else {
                    mEstatura = "❌";
                }

                if (mEdad.equalsIgnoreCase("✅") && mEstatura.equalsIgnoreCase("✅") && mNombre.equalsIgnoreCase("✅")) {
                    Document doc = new Document();
                    doc.append("idAlumno", idAlumno);
                    doc.append("nombre", nombre);
                    doc.append("edad", Integer.parseInt(edad));
                    doc.append("estatura", Double.parseDouble(estatura));
                    alumno.insertOne(doc);
                    out.println("OK:INSERTADO");
                }
            }

        %> 
        <%--COMPONENTE VISTA (HTML) --%>
        <form action="">
            <input type="text" name="txtIdAlumno" readonly value="<%=idAlumno%>"/><br>
            <input type="text" name="txtNombre" placeholder="INSERTE NOMBRE" value="<%=nombre%>"/><%=mNombre%><br> 
            <input type="text" name="txtEdad" placeholder="INSERTE EDAD" value="<%=edad%>"/><%=mEdad%><br> 
            <input type="text" name="txtEstatura" placeholder="INSERTE ESTATURA" value="<%=estatura%>"/><%=mEstatura%><br>   

            <input type="submit" value="GUARDAD" name="cmdGuardar" />
        </form>
    </body>
</html>
