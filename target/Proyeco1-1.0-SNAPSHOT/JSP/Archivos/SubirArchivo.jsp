<%-- 
    Document   : SubirArchivo
    Created on : 5 sep 2021, 16:30:36
    Author     : Linda Monterroso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subir Archivos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="../Css/opMateriaPrima.css" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <form method="POST" action="SubirArchivo" enctype="multipart/form-data"´>
                <label for="datafile">Seleccione un archivo</label>
                <input type="file" name="datafile">
                <br>
                <button type="submit">Subir</button>
            </form>
        </div>
    </body>
</html>
