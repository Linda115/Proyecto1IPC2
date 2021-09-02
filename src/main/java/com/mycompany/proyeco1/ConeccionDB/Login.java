/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Linda Monterroso
 */
@WebServlet(name = "Login", urlPatterns = "/iniciar-Sesion")
public class Login extends HttpServlet {

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

        String usuario = request.getParameter("Nombre");
        String contraseña = request.getParameter("contraseña");
        int tipop = Integer.valueOf(request.getParameter("area"));
        int tipo;

        try {
            if (ComprobarUsuario.ExisteUsusario(usuario)) {
                if (ComprobarUsuario.ComprobarContraseña(usuario, contraseña)) {
                    tipo = ComprobarUsuario.getTipo(usuario, contraseña);
                    if (tipo == tipop){
                    switch (tipo) {
                        case 1:
                            response.sendRedirect(String.format("Areafabrica.html"));
                            break;
                        case 2:
                            response.sendRedirect(String.format("AreaProduccionDeVentas.html"));
                            break;
                        case 3:
                            response.sendRedirect(String.format("AreaFinanciera.html"));
                            break;
                    }
                    }else{
                        response.sendRedirect(String.format("respuestaAccion.jsp?result=&errorMsg=%s&error=true", "El usuario existe, pero no se encuentra en esa area"));
                    }
                } else {
                    response.sendRedirect(String.format("respuestaAccion.jsp?result=&errorMsg=%s&error=true", "Contrasena incorrecta"));
                }
            } else{
                response.sendRedirect(String.format("respuestaAccion.jsp?result=&errorMsg=%s&error=true", "No existe el usuario"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(String.format("respuestaAccion.jsp?result=&errorMsg=%s&error=true", ex.getMessage()));
        }

    }

}
