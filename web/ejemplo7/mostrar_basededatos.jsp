<%-- 
    Document   : mostrar_basededatos
    Created on : 12 sept 2024, 11:20:37
    Author     : Jorge
--%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="org.bson.Document"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = "jdbc:mysql://localhost:3307/bdregistro";
    String usuario = "root";
    String clave = "12345678";
    Class.forName("com.mysql.cj.jdbc.Driver"); //SOLAMENTE PARA WEB
    Connection conexion = DriverManager.getConnection(url, usuario, clave);

%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .cabecera{
                border: none;
                text-align: center;
                outline: none;
                color: white;
                background: black;
                width: 12%;
                font-size: 14px;
            }
            .cuerpo{
                border: none;
                text-align: center;
                outline: none;
                color: blue;
                width: 12%;
                font-size: 12;

            }
            div{
                text-align: center;
                color: red;
                font-family: Courier New;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <table border="1">
            <h1>MOSTRAR BASE DE DATOS CLIENTES</h1>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NOMBREAPELLIDO</th>
                    <th>MASCOTAS</th>
                    <th>PAIS</th>
                    <th>PASATIEMPOS</th>
                    <th>CORREO</th>
                    <th>SEXO</th>
                    <th>TELEFONO</th>
                    <th>FECHAHORA</th>
                    <th>CLAVE</th>
                    <th>AUTORIZACION</th>
                </tr>
            </thead>
            <tbody>
                <%                
                    String sql = "SELECT * FROM cliente";
                    PreparedStatement ps = conexion.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    try {
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("idCliente") + "</td>");
                            out.println("<td>" + rs.getString("nombreApellido") + "</td>");
                            out.println("<td>" + rs.getString("mascota") + "</td>");
                            out.println("<td>" + rs.getString("pais") + "</td>");
                            out.println("<td>" + rs.getString("pasatiempos") + "</td>");
                            out.println("<td>" + rs.getString("correo") + "</td>");
                            out.println("<td>" + rs.getString("sexo") + "</td>");
                            out.println("<td>" + rs.getString("telefono") + "</td>");
                            out.println("<td>" + rs.getString("fechaHora") + "</td>");
                            out.println("<td>" + rs.getString("clave") + "</td>");
                            out.println("<td>" + rs.getBoolean("autorizacion") + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                    
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
