<%-- 
    Document   : EliminarMueble
    Created on : 5 sep 2021, 23:44:09
    Author     : Linda Monterroso
--%>

<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar mueble</title>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="EliminarMueble">
                <label for="materiaPrima">Escribe el nombre del mueble que deseas eliminar del sistema: </label>

                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Tipo Muebles</label>
                    </div>
                    <div class="col-75">
                        <table id="customers">
                            <tr>
                                <th>Tipo de mueble/Nombre mueble</th>
                                <th>Costo</th>
                            </tr>
                            <%ResultSet result = CadenaDeDatos.getTabla("mueble");
                    while (result.next()) {%>
                            <tr>
                                <td><%=result.getString("Nombre")%></td>
                                <td><%=result.getString("Precio")%></td>
                            </tr>
                            <%}%>
                        </table>

                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Escribe el tipo/nombre de mueble de la lista de arriba a la cual deseas Eliminar: </label>
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
