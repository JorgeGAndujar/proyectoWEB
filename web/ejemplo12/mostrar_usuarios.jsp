
<%@page import="java.util.List"%>
<%@page import="ejemplo12.ConexionMysqlBDEncriptar1"%>
<%@page import="java.sql.*"%>
<%@page import="ejemplo12.Crud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
        </style>
    </head>
    <body>
        <h1>MOSTRAR REGISTROS</h1>



        <table border="1">
            <thead>
                <tr>
                    <th>IDUSUARIO</th>
                    <th>NOMBRE</th>
                    <th>LOGIN</th>
                    <th>CLAVE</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conexion = ConexionMysqlBDEncriptar1.obtenerConexion();
                    List<String[]> usuarios_al = Crud.obtenerTodosUsuarios(conexion);

                    for (String[] vector : usuarios_al) {
                %>        
                <tr>
                    <td><%=vector[0]%></td>
                    <td><%=vector[1]%></td>
                    <td><%=vector[2]%></td>
                    <td><%=vector[3]%></td>
                </tr>   
                <%
                    }
                %>


            </tbody>
        </table>

    </body>
</html>
