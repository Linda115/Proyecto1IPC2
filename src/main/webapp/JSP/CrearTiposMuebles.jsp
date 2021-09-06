<%-- 
    Document   : CrearTiposMuebles
    Created on : 5 sep 2021, 23:28:49
    Author     : Linda Monterroso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear/Inscribir tipos de muebles</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="../Css/opMateriaPrima.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="RegistrarMuebles">
                <label for="materiaPrima">Escribe los parametros para poder agregar el mueble al sistema </label>

                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Escribe el nombre/tipo de mueble deseas agregar: </label>
                        <label for="Tipo">Tipo</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="tipo" name="tipo" placeholder="Tipo">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="Precio">Precio</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="precio" name="precio" placeholder="Cantidad">
                    </div>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Registra  a base de Datos</button>
                </div>
            </form>
        </div>
    </body>
</html>
