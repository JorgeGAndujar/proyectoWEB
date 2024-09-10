<%-- 
    Document   : otros_componentes
    Created on : 10 sept 2024, 9:28:46
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>COMPONENTES DIVERSOS DE UN FORMULARIO</h1>
        <form action="proceso.jsp">
        <p>
            1. Campo de texto normal <input type="text" name="txtNombre" />
        </p>
        <p>
            2. Campo de texto encriptado <input type="password" name="txtClave" />
        </p>
         <p>
            3. Boton radio de seleccion simple:
            <input type="radio" name="radioGenero" value="H" />Hombre <%-- mismo nombre para solo generar uno q haga click --%>  
            <input type="radio" name="radioGenero" value="M" />Mujer
        </p>
        <p>
            4. Caja check de selección simple
            <input type="checkbox" name="chbAceptar" />¿Autoriza acceder a sus datos personales?
        </p>
        <p>
            5. Caja check de selección múltiple
             <input type="checkbox" name="chbPasatiempo" value="Ajedrez" />Ajedrez
             <input type="checkbox" name="chbPasatiempo" value="Futbol" />Futbol
             <input type="checkbox" name="chbPasatiempo" value="Tenis" />Tenis
        </p>
        <p>
            6. Combo de selección simple
            <select name="cboCodigoPais" size="1">
                <option selected>Seleccionar<option/>
                <option value="CL">Chile<option/>
                <option value="PE">Peru<option/>
                <option value="ES">España<option/>
                <option value="MX">México<option/>
                <option value="UK">Inglaterra<option/> 
            </select>
        </p>
        <p>
            7. Lista de selección multiple
            <select name="lstMascota" multiple="true" size="3">
                <option value="Gato">Gato</option>
                <option value="Perro">Perro></option>
                <option value="Cerdo">Cerdo</option>
                <option value="Lince">Lince</option>
                <option value="Cobaya">Cobaya</option> 
            </select>
        </p>
        <p>
            8. Ingrese su correo
            <input type="email" 
                   pattern=".+@gmail.com"
                   size="18"
                   placeholder="usuario@gmail.com"
                   minlength="18"
                   maxlength="18"
                   list="listaEmailPorDefecto"
                   name="micorreo"
                   requiered />
            <datalist id="listaEmailPorDefecto">
                <option value="jorge@gmail.com">
                <option value="ismael@gmail.com">
                <option value="jose@gmail.com">
                <option value="raul@gmail.com">
            </datalist>
        </p>
        <p>
            9. Ingrese su teléfono
            <input type="tel"
                   name="miTelefono"
                   id="txtTelefono"
                   pattern="[0-9]{9,9}"
                   size="9"
                   placeholder ="xxxxxxxxx"
                   minlength="9"
                   maxlength="9"
                   list="listaTelefonosPorDefecto"
                   requiered >
            <datalist id="listaTelefonosPorDefecto"
                   <option value="654666383">
                   <option value="625566383">
                   <option value="634111383">
                   <option value="654662313">
                   <option value="624243832">
            </datalist>
        <p>
            10. Elija una hora de reunion entre las 9:00 y 18:00 horas
            <label for="lblReunion" </label>
            <input type="time"
                   name="txtHora"
                   min="9:00"
                   max="18:00"
                   id="lblReunion"
                   requiered >
        </p>
        <p>
            11.Elija una fecha, hora y minutos para su cita
             <label for="lblFechaHora" </label>
             <input type="datetime-local" id="txtFechaHora" name="txtFechaHora"
        </p>
        <p>
            <input type="submit" name="cmdEnviar" />
        </p>
        </form>
        
    </body>
</html>
