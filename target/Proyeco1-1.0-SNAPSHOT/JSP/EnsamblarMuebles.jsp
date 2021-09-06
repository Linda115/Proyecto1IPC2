<%-- 
    Document   : EnsamblarMuebles
    Created on : 30 ago 2021, 20:48:33
    Author     : Linda Monterroso
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyeco1.ConeccionDB.CadenaDeDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
    function ConfirmEnsamblar()
    {
    <%List<String> lista = CadenaDeDatos.getDatosColumna("ensamblepiezas", "Mueble_Nombre", "MateriaPrima_Tipo", String.valueOf(request.getAttribute("tipo")), "Mueble");
    %>
        var respuesta = confirm("Piezas y cantidad a utilizar para ensamblar\n\ "
    <%for (int i = 0; lista.size() > i + 1; i += 2) {%>
        "<%=lista.get(i)%>" "<%=lista.get(i + 1)%>\n\ "<%}%>);

        if (respuesta == true) {
            return true;
        } else {
            return false;
        }
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ensamblar Muebles</title>
        <link href="opMateriaPrima.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    </head>
    <body>
        <div class="container">
            <form method="POST" action="ensamblar" >
                <label for="Mueble">Selecciona el tipo de mueble que desea ensamblar: </label>
                <div class="row">
                    <div class="col-25">
                        <label for="Mueble">Tipo Mueble</label>
                    </div>
                    <div class="col-75">
                        <table id="customers">
                            <tr>
                                <th>Nombre/tipo de Mueble</th>
                            </tr>
                            <%ResultSet result = CadenaDeDatos.getTabla("mueble");
                                if (result != null) {
                                    while (result.next()) {%>
                            <tr>
                                <td><%=result.getString("Nombre")%></td>
                            </tr>
                            <%}
                                }%>
                        </table>
                    </div>

                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="materiaPrima">Escribe el tipo de mueble de la lista de arriba el cual deseas ensamblar: </label>
                        <label for="Tipo">Tipo</label>
                    </div>
                    <div class="col-75">
                        <input type="text" id="tipo" name="tipo" placeholder="Tipo">
                    </div>
                </div>
                <div class="row">
                    <a href="ensamblar" ><button type="button" class="btn btn-block" onclick="return ConfirmEnsamblar()">Ensamblar</button></a>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Ensamblar</button>
                </div>
            </form>
        </div>
    </body>
</html>