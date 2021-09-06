<%-- 
    Document   : CambiarNombreDeMueble
    Created on : 5 sep 2021, 23:34:54
    Author     : Linda Monterroso
--%>

<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar Nombre del mueble</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="../Css/opMateriaPrima.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="CambiarNombreMueble">
                <label for="materiaPrima">Escribe el nombre del mueble, y el nuevo nombre que deseas ingresar al sistema: </label>

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
                        <label for="materiaPrima">Escribe el tipo/nombre de mueble de la lista de arriba a la cual deseas cambiarle el nombre: </label>
                        <label for="Tipo">Nombre</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="tipo" name="tipo" placeholder="Tipo">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="Nombre">Escribe el nuevo nombre del mueble:</label>
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
