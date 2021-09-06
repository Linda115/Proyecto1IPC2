/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Linda Monterroso
 */
@WebServlet(name = "InscribirDatos", urlPatterns = "/inscribir")
public class PostInscribirDatos extends HttpServlet {

    private static final String baseDatos = "materiaprima";

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ConeccionBD coneccionBd = new ConeccionBD();
        
       
        Connection coneccion = coneccionBd.getConection();
        
            
        try {
            PreparedStatement insert = coneccion.prepareStatement(String.format(
                            "INSERT INTO %s (Tipo, Precio, Cantidad) VALUES(?,?,?)", baseDatos
                    ));
            String tipo = request.getParameter("tipo");
            float costo = Float.parseFloat(request.getParameter("costo"));
            insert.setString(1, tipo);
            insert.setFloat(2, costo);
            insert.setInt(3, 0);

            insert.executeUpdate();
            
            response.sendRedirect(String.format("JSP/respuestaAccion.jsp?result=%s&errorMsg=&error=false", "hecho"));
            

        } catch (SQLException e) {
            
            response.sendRedirect(String.format("JSP/respuestaAccion.jsp?result=&errorMsg=%s&error=true", ErroresdeConexion.MessageError(e.getErrorCode(), e.getMessage())));
            
            
        } finally {
            if (coneccion != null) {
                try {
                    coneccion.close();
                    
                } catch (SQLException ex) {
                  response.sendRedirect(String.format("JSP/respuestaAccion.jsp?result=&errorMsg=%s&error=true", ErroresdeConexion.MessageError(ex.getErrorCode(), ex.getMessage())));
              
                }
            }
        }
    }
}

