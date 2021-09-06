/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(name = "RegistrarMuebles", urlPatterns = {"/JSP/RegistrarMuebles"})
public class RegistrarMuebles extends HttpServlet {

   
    private static final String baseDatos = "mueble";

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
                            "INSERT INTO %s (Nombre, Precio) VALUES(?,?)", baseDatos
                    ));
            String tipo = request.getParameter("tipo");
            float costo = Float.parseFloat(request.getParameter("precio"));
            insert.setString(1, tipo);
            insert.setFloat(2, costo);

            insert.executeUpdate();
            
            response.sendRedirect(String.format("respuestaAccion.jsp?result=%s&errorMsg=&error=false", "hecho"));
            

        } catch (SQLException e) {
            
            response.sendRedirect(String.format("respuestaAccion.jsp?result=&errorMsg=%s&error=true", ErroresdeConexion.MessageError(e.getErrorCode(), e.getMessage())));
            
            
        } finally {
            if (coneccion != null) {
                try {
                    coneccion.close();
                    
                } catch (SQLException ex) {
                  response.sendRedirect(String.format("respuestaAccion.jsp?result=&errorMsg=%s&error=true", ErroresdeConexion.MessageError(ex.getErrorCode(), ex.getMessage())));
              
                }
            }
        }
        
        //rocessRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
