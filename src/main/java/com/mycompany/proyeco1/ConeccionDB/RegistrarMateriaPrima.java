/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Linda Monterroso
 */

@WebServlet(name = "RegistrarDatos", urlPatterns = {"/JSP/registrar"})
public class RegistrarMateriaPrima extends HttpServlet {
    
    private  final String baseDatos = "materiaprima";
    private  final String cantidadCadena = "cantidad";
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ConeccionBD coneccionBd = new ConeccionBD();
        Connection coneccion = coneccionBd.getConection();

       
        try {
             PreparedStatement allQuery = coneccion
                    .prepareStatement(String.format("SELECT * FROM %s WHERE Tipo = ?", baseDatos));
             String tipo = request.getParameter("tipo");
             System.out.print("El tipo de materia prima es: "+tipo);
             int cantidad = Integer.valueOf(request.getParameter("cantidad"));
            
            allQuery.setString(1,tipo);
            ResultSet result = allQuery.executeQuery();
            if (result.next()){
                cantidad = cantidad + result.getInt("Cantidad");
            }
            
            PreparedStatement update = coneccion
                    .prepareStatement(String.format(
                            "UPDATE %s SET Cantidad = ? WHERE  Tipo = ?",
                            baseDatos
                    ));
            
            update.setInt(1, cantidad);
            update.setString(2, tipo);

            update.executeUpdate();
            
            response.sendRedirect(String.format("respuestaAccion.jsp?result=%s&errorMsg=&error=false", "hecho"));
            

        } catch (SQLException e) {
            response.sendRedirect(String.format("respuestaAccion.jsp?result=&errorMsg=%s&error=true", e.getMessage()));
               
        } 
    }
    
    
    
}
