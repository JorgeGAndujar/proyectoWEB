<%-- 
    Document   : formulario
    Created on : 11 sept 2024, 12:45:35
    Author     : Jorge
--%>

<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String url = "jdbc:mysql://localhost:3307/bdregistro";
    String usuario = "root";
    String clave = "12345678";
    Class.forName("com.mysql.cj.jdbc.Driver"); //SOLAMENTE PARA WEB
    Connection conexion = DriverManager.getConnection(url, usuario, clave);

    String query = "SELECT * FROM mascotas";

    PreparedStatement ps = conexion.prepareStatement(query);
    ResultSet rs = ps.executeQuery();

    Set<String> mascotas_ts = new TreeSet();

    while (rs.next()) {
        mascotas_ts.add(rs.getString(2));
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>REGISTRAR FORMULARIO</h1>
        <form action="procesar_formulario.jsp">
            
            1.Nombre Apellido Cliente: <input type="text" name="txtNombre" required/><br>
            
            2. Lista de selección multiple mascotas:
            <select name="lstMascota" multiple="true" size="3" required>
                <%
                    for (String descripcion : mascotas_ts) {
                        out.println("<option value=" + descripcion + ">" + descripcion + "</option>");
                    }
                %> 
            </select>
            <%
                String query1 = "SELECT idPais, descripcion FROM pais ORDER BY descripcion";
                ps = conexion.prepareStatement(query1);
                rs = ps.executeQuery();
            %>
            <br><br>
            3.Lista de selección simple pais:
            <select name="cboPais" size="1" required>
                <%
                    while (rs.next()) {
                        out.println("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                    }
                %>
            </select>
            <br><br>  
            <%
                String query3 = "SELECT descripcion FROM pasatiempos ORDER BY descripcion";
                ps = conexion.prepareStatement(query3);
                rs = ps.executeQuery();
            %>
            4.Checkbox selección multiple pasatiempos:

            <%
                while (rs.next()) {
                    out.println("<input type='checkbox' name='chbPasatiempo' value='" + rs.getString(1) + "'  />" + rs.getString(1));
                }
            %>
            <br>
            5.Selecione correo <input type="text" name="txtCorreo" size="100" required/><br>
            
            6.Selecione sexo 
            <p>
                <input type="radio" name="txtSexo" value="H" />HOMBRE
                <input type="radio" name="txtSexo" value="M" />MUJER
          
            </p>
            
            7.Selecione telefono <input type="number" name="txtTelefono" size="9" required /><br>
            
            8.Seleccione fecha y Hora
            <p>
             <label for="lblFechaHora"> </label>
             <input type="datetime-local" id="txtFechaHora" name="txtFechaHora" required /><br>
            </p>
            9.Seleccioone Clave
            <p>
             <input type="password" id="txtClave1" name="txtClave1" required /><br>
            </p>
            9.Seleccioone autorizacion
            <p>
             <input type="checkbox" name="chbAutorizacion" required /><br>
            </p>
            
            <input type="submit" name="cmdRegistrar" value="REGISTRAR" />
        </form>
    </body>
</html>
