<%-- 
    Document   : RegistrarMateriaPrima
    Created on : 24 ago 2021, 17:31:56
    Author     : Linda Monterroso
--%>

<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyeco1.ConeccionDB.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <title>Registrar Materia Prima</title>
        <link href="opMateriaPrima.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <form method="POST" action="Registrar">
                <label for="materiaPrima">Selecciona la materia prima y la cantida que desea registrar: </label>
                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Tipo Materia Prima</label>
                    </div>
                    <div class="col-75">
                        <select id="materiaPrima" class="custom-select d-block w-100" name="materiaPrima" >
                            <option selected>Tipos de materia prima</option>
                            <% List<String> lista = CadenaDeDatos.getDatosColumna("materiaprima", "Tipo");
                                for (String cadena : lista) {%>
                            <option value "<%=cadena%>" > <%=cadena%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="cantidad">Cantidad</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="cantidad" name="cantidad" placeholder="Cantidad">
                    </div>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Registra  a base de Datos</button>
                </div>
            </form>
        </div>

    </body>
</html>
