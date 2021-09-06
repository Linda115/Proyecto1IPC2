<%-- 
    Document   : EliminarUsuario
    Created on : 5 sep 2021, 23:49:23
    Author     : Linda Monterroso
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Usuario</title>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="EliminarUsuario">
                <label for="materiaPrima">Escribe el nombre del Usuario que deseas eliminar del sistema: </label>

                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Tipo Muebles</label>
                    </div>
                    <div class="col-75">
                        <table id="customers">
                            <tr>
                                <th>Nombre</th>
                                <th>Area</th>
                            </tr>
                            <%ResultSet result = CadenaDeDatos.getTabla("usuario");
                    while (result.next()) {%>
                            <tr>
                                <td><%=result.getString("Nombre")%></td>
                                <td><%=result.getString("Tipo")%></td>
                            </tr>
                            <%}%>
                        </table>

                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Escribe el nombre del usuario de la lista de arriba a la cual deseas Eliminar: </label>
                        <label for="Tipo">Nombre</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="tipo" name="tipo" placeholder="Tipo">
                    </div>
                </div>
                
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Eliminar</button>
                </div>
            </form>
        </div>
    </body>
</html>
