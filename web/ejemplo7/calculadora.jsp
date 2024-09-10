<%-- 
    Document   : calculadora
    Created on : 10 sept 2024, 11:54:06
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CALCULADORA</title>
    </head>
    <body>
        <h1>CALCULADORA</h1>
        <form action="calculadora.jsp">

            <h1>INFORMACIÓN RECIBIDA DEL FORMULARIO</h1>
            <%
                int numero1 = 0;
                int numero2 = 0;
                int resultado = 0;
                String operar = request.getParameter("radioOperaciones");
                if (request.getParameter("cmdCalcular") != null) {
                    numero1 = Integer.parseInt(request.getParameter("txtN1"));
                    numero2 = Integer.parseInt(request.getParameter("txtN2"));
                    switch (operar) {
                        case "+":
                            resultado = numero1 + numero2;
                            break;
                        case "-":
                            resultado = numero1 - numero2;
                            break;
                        case "*":
                            resultado = numero1 * numero2;
                            break;
                        case "/":
                            if (numero2 != 0) { // para evitar la división por cero
                                resultado = numero1 / numero2;
                            } else {
                                out.println("Error: División por cero");
                            }
                            break;  
                    }
                }
            %>
            1. INTRODUZCA EL NUMERO 1
            <p>
                <input type="number" name="txtN1" />
            </p>
            3. INTRODUZCA EL NUMERO 2
            <p>
                <input type="number" name="txtN2" />
            </p>

            4. CON QUE DESEA OPERAR:
            <p>
                <input type="radio" name="radioOperaciones" value="+" />Suma  
                <input type="radio" name="radioOperaciones" value="-" />Resta
                <input type="radio" name="radioOperaciones" value="*" />Multiplicar  
                <input type="radio" name="radioOperaciones" value="/" />Dividir
            </p>
            5. CALCULAR
            <p>
                <input type="submit" name="cmdCalcular" value="CALCULAR" />
            </p>
           
             6. EL RESULTADO ES:
            <p>
                <input type="number" name="txtResultado" value="<%=resultado%>" readonly/>
            </p>
        </form>
    </body>
</html>