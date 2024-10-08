package servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Servlet2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String opcion = "";
            double resultado = 0.0;
            if ((opcion = request.getParameter("operacion")) != null) {
                double numero = Double.parseDouble(request.getParameter("txtNumero"));
                
                switch (opcion) {
                    case "RAIZ CUADRADA":
                        resultado = Math.sqrt(numero);
                        break;
                    case "RAIZ CUBICA":
                        resultado = Math.cbrt(numero);
                        break;
                    case "CUADRADO":
                        resultado = Math.pow(numero, 2);
                        break;
                }

            }

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + " RESULTADO " + opcion + " " + resultado + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
