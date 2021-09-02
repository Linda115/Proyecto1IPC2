<%-- 
    Document   : EnsamblarMuebles
    Created on : 30 ago 2021, 20:48:33
    Author     : Linda Monterroso
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ensamblar Muebles</title>
        <link href="opMateriaPrima.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        
    </head>
    <body>
        <div class="container">
            <form method="POST" action="ensamblar">
                <label for="Mueble">Selecciona el tipo de mueble que desea ensamblar: </label>
                <div class="row">
                    <div class="col-25">
                        <label for="Mueble">Tipo Mueble</label>
                    </div>
                    <div class="col-75">
                        <select id="Mueble" class="custom-select d-block w-100" name="Mueble" >
                            <option selected>Tipos de materia prima</option>
                            <% List<String> lista = CadenaDeDatos.getDatosColumna("muebles", "Nombre");
                                for (String cadena : lista) {%>
                            <option value "<%=cadena%>" > <%=cadena%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Ensamblar</button>
                </div>
            </form>
        </div>
    </body>
</html>