<%-- 
    Document   : procesar_formulario
    Created on : 11 sept 2024, 15:28:12
    Author     : Jorge
--%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Arrays"%>
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
    </head>
    <body>
        <h1>INFORMACIÓN RECIBIDA DEL FORMULARIO PARA REGISTRAR EN UNA BASE DE DATOS</h1>
        <%
            String nombreApellido = request.getParameter("txtNombre");
            String[] mascotas = request.getParameterValues("lstMascota");
            String pais = request.getParameter("cboPais");
            String[] pasatiempos = request.getParameterValues("chbPasatiempo");
            String correo = request.getParameter("txtCorreo");
            String sexo = request.getParameter("txtSexo");
            String telefono = request.getParameter("txtTelefono");
            String fechaHora = request.getParameter("txtFechaHora");
            String clave1 = request.getParameter("txtClave1");
            String autorizacion = request.getParameter("chbAutorizacion");
        %>

        <%=nombreApellido%><br><!-- comment -->
        <%=Arrays.toString(mascotas)%><br><!-- comment -->
        <%=pais%><br><!-- comment -->
        <%=Arrays.toString(pasatiempos)%><br>
        <%=correo%><br>
        <%=sexo%><br>
        <%=telefono%><br>
        <%=fechaHora%><br>
        <%=clave1%>
        <%=autorizacion%>

        <%
            try {
                String query = "INSERT INTO cliente(idCliente,nombreApellido,mascota,pais,pasatiempos,correo,sexo,telefono,fechaHora,clave,autorizacion)"
                        + "VALUE (NULL,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = conexion.prepareStatement(query);
                
                ps.setString(1, nombreApellido);
                Gson gson = new Gson();
                
                String mascotasJSON = gson.toJson(mascotas);
                ps.setString(2, mascotasJSON);
                
                ps.setString(3, pais);
                
                String pasatiemposJSON = gson.toJson(mascotas);
                ps.setString(4, pasatiemposJSON);
                
                ps.setString(5, correo);
                
                ps.setString(6, sexo);
                
                ps.setString(7, telefono);
                
                ps.setString(8, fechaHora);
     
                ps.setString(9, clave1);
                
                boolean autorizar = (autorizacion != null && autorizacion.equals("on"));
                ps.setBoolean(10, autorizar); 

                ps.executeUpdate();
                out.println("OK: INSERT");
            } catch (Exception e) {
                out.println("ERROR: NO INSERTADO");
            }
        %>
    </body>
</html>
