<%-- 
    Document   : CambiarContraseñaUsuario
    Created on : 5 sep 2021, 23:49:04
    Author     : Linda Monterroso
--%>

<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar Contraseña de usuario</title>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="registrar">
                <label for="materiaPrima">Escribe el nombre del usuario, y la nuevo contraseña que deseas ingresar al sistema: </label>

                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Usuarios</label>
                    </div>
                    <div class="col-75">
                        <table id="customers">
                            <tr>
                                <th>Nombre</th>
                                <th>Contraseña</th>
                                <th>area</th>
                            </tr>
                            <%ResultSet result = CadenaDeDatos.getTabla("usuario");
                    while (result.next()) {%>
                            <tr>
                                <td><%=result.getString("Nombre")%></td>
                                <td><%=result.getString("Contraseña")%></td>
                                <td><%=result.getString("Tipo")%></td>
                            </tr>
                            <%}%>
                        </table>

                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Escribe el nombre de usuario de la lista de arriba a la cual deseas cambiarle la contraseña: </label>
                        <label for="Tipo">Nombre</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="tipo" name="tipo" placeholder="Tipo">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="Nombre">Escribe la nueva contrseña del usuario:</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="Nombre" name="Nombre" placeholder="Cantidad">
                    </div>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Registra  a base de Datos</button>
                </div>
            </form>
        </div>
    </body>
</html>
