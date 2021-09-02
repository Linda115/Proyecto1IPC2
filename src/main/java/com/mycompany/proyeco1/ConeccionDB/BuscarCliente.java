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
@WebServlet(name = "BuscarCliente", urlPatterns = "/buscarcliente")
public class BuscarCliente extends HttpServlet {

    private static final String baseDatos = "cliente";


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
        
        
        int nit = Integer.valueOf(request.getParameter("NIT"));
            
        ResultSet result = CadenaDeDatos.getDatosColumnaCondicional(baseDatos, String.valueOf(nit), "NIT");
        
        try {
            if(result.next()){
                int nit1 = Integer.valueOf(result.getString("NIT"));
                String Nombre = result.getString("Nombre");
                String Direccion = result.getString("Direccion");
                String Municipio = result.getString("Municipio");
                String departamento = result.getString("Departamento");
                
                response.sendRedirect(String.format("ObtenerDatosREgistroVentas.jsp?nombre="+Nombre+"&nit="+nit1+"&direccion="+Direccion+"&municipio="+Municipio+"&departamento="+departamento+"&Hay-error=false"));
            }
        } catch (SQLException ex) {
            response.sendRedirect(String.format("ObtenerDatosREgistroVentas.jsp?nombre=null&nit=null&direccion=null&municipio=null&departamento=null&Hay-error=true"));
        }
    }
    
}
