
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ejemplo12.Crud"%>
<%@page import="ejemplo12.ConexionMysqlBDEncriptar1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRAR USUARIO</title>
        <style>
          body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                display: flex;
                flex-direction: column;
            }

            label {
                margin-top: 10px;
                margin-bottom: 5px;
                font-weight: bold;
                color: #333;
            }

            input[type="text"], input[type="password"] {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                width: 100%;
                box-sizing: border-box;
                margin-bottom: 10px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 10px;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            #mensaje {
                color: #555;
                font-weight: bold;
                background-color: #f4f4f4;
                border: none;
                margin-top: 10px;
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
