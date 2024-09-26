
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ejemplo12.Crud"%>
<%@page import="ejemplo12.ConexionMysqlBDEncriptar1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            form {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 80vh;
            }
        </style>
    </head>
    <body>
        <h1>REGISTRAR USUARIO</h1>
        <%
            String nombre = "";
            String login = "";
            String clave = "";
            String mensaje = "";
            if (request.getParameter("accion") != null) {
                
                nombre = request.getParameter("txtNombre");
                login = request.getParameter("txtLogin");
                clave = request.getParameter("txtClave");
                Connection conexion = ConexionMysqlBDEncriptar1.obtenerConexion();
                boolean correcto = Crud.insertarUsuario(conexion, nombre, login, clave);
                if (correcto == true) {
                    mensaje = "INSERTADO CORRECTO";
                } else {
                    mensaje = "ERROR AL INSERTAR";
                }
            }
        %>
        <form>
            <label for="nombre">NOMBRE</label>
            <input type="text" name="txtNombre" id="nombre" required/>
            <label for="login">LOGIN</label>
            <input type="text" name="txtLogin" id="login" required/>
            <label for="clave">CLAVE</label>
            <input type="password" name="txtClave" id="clave" required/>
            
            <label for="mensaje">MENSAJE</label>
            <input type="text" name="txtMensaje" id="mensaje" value="<%=mensaje%>" required disabled />

            <input type="submit" name="accion" value="Registrar"/>


        </form>
    </body>
</html>
