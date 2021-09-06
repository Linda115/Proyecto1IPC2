/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Linda Monterroso
 */
@WebServlet(name = "BuscarCliente", urlPatterns = "/JSP/buscarcliente")
public class BuscarCliente extends HttpServlet {

    private static final String baseDatos = "clientes";

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        ResultSet result = CadenaDeDatos.getDatosColumnaCondicional(baseDatos, Long.parseLong(request.getParameter("NIT")), "NIT");
        try { 
            
                if (result.next()) {
                    long nit = Long.parseLong(result.getString("NIT"));
                    String Nombre = result.getString("Nombre");
                    String Direccion = result.getString("Direccion");
                    String Municipio = result.getString("Municipio");
                    String departamento = result.getString("Departamento");

                    response.sendRedirect(String.format("ObtenerDatosRegistroVentas.jsp?nombre=" + Nombre + "&nit=" + nit + "&direccion=" + Direccion + "&municipio=" + Municipio + "&departamento=" + departamento + "&Hay-error=false"));
                }else{
                    response.sendRedirect(String.format("ObtenerDatosRegistroVentas.jsp?nombre=null&nit=null&direccion=null&municipio=null&departamento=null&Hay-error=true"));
        
                }
            
        } catch (SQLException ex) {
            response.sendRedirect(String.format("ObtenerDatosRegistroVentas.jsp?nombre=null&nit=null&direccion=null&municipio=null&departamento=null&Hay-error=true"));
        }
    }

}
