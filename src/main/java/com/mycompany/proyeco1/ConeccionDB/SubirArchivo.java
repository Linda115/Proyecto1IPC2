/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Linda Monterroso
 */
@WebServlet(name = "SubirArchivo", urlPatterns = {"/JSP/Archivos/SubirArchivo"})
@MultipartConfig(location = "/org")
public class SubirArchivo extends HttpServlet {



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
         Part filePart = request.getPart("datafile");
        InputStream fileStream = filePart.getInputStream();
        
        try (BufferedReader in = new BufferedReader(new InputStreamReader(fileStream, "UTF-8"))) {
            
            
            
            LeerArchivoTxt leerArchivos = new LeerArchivoTxt();
            String errores = leerArchivos.leerArchivo(in);
            
            
            response.sendRedirect(String.format("MostrarErrores.jsp?errores=%s", errores));
        } catch (Exception ex) {
            response.sendRedirect(String.format("MostrarErrores.jsp?errores=%s", "Error a leer el archivo "+ex.getMessage()));
            // manejo de error
        }
        //processRequest(request, response);
    }


}
