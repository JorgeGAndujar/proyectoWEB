package servlet3;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

public class Servlet3 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String opcion = request.getParameter("opcion");

            Connection conexion = ConexionMysqlBDESCUELA.obtenerConexion();

            if (conexion != null) {
                if (opcion != null) {
                    switch (opcion) {
                        case "1":
                            List<String> usuarios_al = Metodos.mostrarUsuario(conexion);
                            request.setAttribute("usuarios_al", usuarios_al);
                            //REDIRECCIONAR EL ARRAY AL JSP
                            request.getRequestDispatcher("/ejemplo13/resultado1.jsp").forward(request, response);
                            break;
                        case "2":
                            List<String> alumnos_al = Metodos.mostrarAlumnos(conexion);
                            request.setAttribute("alumnos_al", alumnos_al);
                            //REDIRECCIONAR EL ARRAY AL JSP
                            request.getRequestDispatcher("/ejemplo13/resultado2.jsp").forward(request, response);
                            break;
                        case "3":
                            List<String> asignaturas_al = Metodos.mostrarModulo(conexion);
                            request.setAttribute("asignaturas_al", asignaturas_al);
                            //REDIRECCIONAR EL ARRAY AL JSP
                            request.getRequestDispatcher("/ejemplo13/resultado3.jsp").forward(request, response);
                            break;
                        case "4":
                            List<String> profesores_al = Metodos.mostrarProfesores(conexion);
                            request.setAttribute("profesores_al", profesores_al);
                            //REDIRECCIONAR EL ARRAY AL JSP
                            request.getRequestDispatcher("/ejemplo13/resultado4.jsp").forward(request, response);
                            break;

                    }
                }

                /*
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Servlet3</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>OK: CONEXION</h1>");
                out.println("</body>");
                out.println("</html>");
                 */
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Servlet3</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>ERROR: CONEXION</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
