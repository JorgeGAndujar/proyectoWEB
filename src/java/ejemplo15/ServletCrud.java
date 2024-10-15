package ejemplo15;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

public class ServletCrud extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Connection conexion = ConexionPostgresqlTienda.obtenerConexion();
            if (conexion != null) {
                out.println("OK:CONEXION");

                String opcion = request.getParameter("txtOpcion");
                switch (opcion) {
                    case "1":
                        String nombre = request.getParameter("txtNombre");
                        String marca = request.getParameter("txtMarca");
                        String modelo = request.getParameter("txtModelo");
                        double precio;
                        try {
                            precio = Double.parseDouble(request.getParameter("txtPrecio"));
                        } catch (NumberFormatException e) {
                            out.println("ERROR: Precio inválido");
                            return;
                        }
                        String pantalla = request.getParameter("txtPantalla");
                        String resolucion = request.getParameter("txtResolucion");

                        if (OperacionesCrud.insertarProducto(conexion, nombre, marca, modelo, precio, pantalla, resolucion)) {
                            out.println("OK: INSERT");
                        } else {
                            out.println("ERROR: INSERT");
                        }
                        break;
                    case "2":
                        List<String> productos_al = OperacionesCrud.mostrarProductos(conexion);
                        for(String p: productos_al){
                            out.println(p + "<br>");
                        }

                }

            } else {
                out.println("ERROR:CONEXION");
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletCrud</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCrud at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
