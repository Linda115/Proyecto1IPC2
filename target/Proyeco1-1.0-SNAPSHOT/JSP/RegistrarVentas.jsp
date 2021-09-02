<%-- 
    Document   : RegistrarVentas
    Created on : 31 ago 2021, 11:11:34
    Author     : Linda Monterroso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Venta</title>
    </head>
    <body>
        <h1>Registrar Venta</h1>
        
        <<div class="container">

            <form  method="POST" action="/buscarcliente">
                <label >Escriba los caracteres de la venta</label>               
                <div class="row">
                    <div class="col-25">
                        <label for="NIT">NIT del cliente</label>
                    </div>
                    <div class="col-75">
                        <input type="number" id="NIT" name="NIT" placeholder="NIT" required>
                    </div>
                </div>               

                <div class="row">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Buscar</button>
                </div>
            </form>
        </div>
    </body>
</html>
