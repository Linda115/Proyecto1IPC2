/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import com.mycompany.proyeco1.ConeccionDB.EliminarMateriaPrimaDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Linda Monterroso
 */
@WebServlet(name = "EliminarDatos", urlPatterns = {"/JSP/eliminarCantidad"})
public class PostEliminarCantidadMateriaPrima extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tipo = request.getParameter("tipo");
        int cantidad = Integer.valueOf(request.getParameter("cantidad"));
        if (EliminarMateriaPrimaDB.DeletePIEZAS(tipo,cantidad)) {
            response.sendRedirect(String.format("respuestaAccion.jsp?result=%s&errorMsg=&error=false", "hecho"));
        } else {
            response.sendRedirect(String.format("respuestaAccion.jsp?result=&errorMsg=%s&error=true", "Error"));
        }
    }
    
}
