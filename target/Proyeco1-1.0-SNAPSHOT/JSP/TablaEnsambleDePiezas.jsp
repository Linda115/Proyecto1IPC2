<%-- 
    Document   : TablaEnsambleDePiezas
    Created on : 30 ago 2021, 22:21:07
    Author     : Linda Monterroso
--%>

<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!String tipo = "";%>
<%
    tipo = request.getParameter("result");

    pageContext.setAttribute("bandera", tipo);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ensamble de muebles</title>
        <link rel="stylesheet" href="tablas.css" type="text/css"/>
    </head>
    <body>
        <h1>Piezas a utilizar</h1>
        <form method="POST" action="ensamblar">
            <table id="customers">
                <tr>
                    <th>Tipo de pieza</th>
                    <th>Cantidad</th>
                </tr>
                <%List<String> lista = CadenaDeDatos.getDatosColumna("ensamblepiezas", "Pieza", "Cantidad", tipo, "Mueble");
                    for (int i = 0; lista.size() > i + 1; i += 2) {%>
                <tr>
                    <td><%=lista.get(i)%></td>
                    <td><%=lista.get(i + 1)%></td>
                </tr>
                <%}%>
                </div>

            </table>
            <div class="row">
                <button type="submit" class="btn btn-primary btn-lg btn-block">Ensamblar mueble y registrarlo a la sala de ventas</button>
            </div>
        </form>
    </body>
</html>
