/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyeco1.ConeccionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Linda Monterroso
 */
public class EscritorDB {

    

    public String EscribirBDUSUARIO(List<String> values) {
        ConeccionBD coneccionBD = new ConeccionBD();
        Connection coneccion = coneccionBD.getConection();
        String respuesta = "";
        System.out.println("Entro a registrar");
        try {
            System.out.println("Entro a registrar");
            PreparedStatement insert = coneccion.prepareStatement(String.format(
                    "INSERT INTO %s (Nombre, Contraseña,Tipo) VALUES(?,?,?)", "usuario"
            ));
            if (values.size() == 3) {
                System.out.println("Entro a cambiar valores");
                System.out.println("Valor 0 "+values.get(0));
                
                insert.setString(1, values.get(0));
                insert.setString(2, values.get(1));
                insert.setInt(3, Integer.valueOf(values.get(2)));
                System.out.println("Entro a cambiar valores");
                insert.executeUpdate();
                System.out.println("Entro a cambiar valores 2");
                respuesta = "hecho";

            }else{
                respuesta = "No tiene los parametros necesarios";
            }

        } catch (SQLException e) {
            System.out.println(e);
            respuesta = ErroresdeConexion.MessageError(e.getErrorCode(), e.getMessage());

        } finally {
            if (coneccion != null) {
                try {
                    coneccion.close();

                } catch (SQLException ex) {
                    System.out.println(ex);
                    respuesta = ErroresdeConexion.MessageError(ex.getErrorCode(), ex.getMessage());
                }
            }
        }

        return respuesta;
    }

    public String EscribirBDPIEZA(List values) {
        ConeccionBD coneccionBD = new ConeccionBD();
        Connection coneccion = coneccionBD.getConection();
        String respuesta = "";
        System.out.println("Entro a registrar");

        try {
            PreparedStatement insert = coneccion.prepareStatement(String.format(
                    "INSERT INTO %s (Tipo, Precio, Cantidad) VALUES(?,?,?)", "materiaprima"
            ));
            if (values.size() == 2) {
                insert.setString(1, (String) values.get(0));
                insert.setString(2, (String) values.get(1));
                insert.setInt(3, 0);

                insert.executeUpdate();

                respuesta = "hecho";

            }

        } catch (SQLException e) {
            System.out.println(e);
            respuesta = ErroresdeConexion.MessageError(e.getErrorCode(), e.getMessage());

        } finally {
            if (coneccion != null) {
                try {
                    coneccion.close();

                } catch (SQLException ex) {
                    respuesta = ErroresdeConexion.MessageError(ex.getErrorCode(), ex.getMessage());
                }
            }
        }

        return respuesta;
    }

    public String EscribirBDMUEBLE(List values) {
        ConeccionBD coneccionBD = new ConeccionBD();
        Connection coneccion = coneccionBD.getConection();
        String respuesta = "";

        try {
            PreparedStatement insert = coneccion.prepareStatement(String.format(
                    "INSERT INTO %s (Nombre, Precio) VALUES(?,?)", "mueble"
            ));
            if (values.size() == 2) {
                insert.setString(1, (String) values.get(0));
                insert.setString(2, (String) values.get(1));

                insert.executeUpdate();

                respuesta = "hecho";

            }

        } catch (SQLException e) {
            System.out.println(e);
            respuesta = ErroresdeConexion.MessageError(e.getErrorCode(), e.getMessage());

        } finally {
            if (coneccion != null) {
                try {
                    coneccion.close();

                } catch (SQLException ex) {
                    respuesta = ErroresdeConexion.MessageError(ex.getErrorCode(), ex.getMessage());
                }
            }
        }

        return respuesta;
    }

    public String EscribirBDENSAMBLE_PIEZAS(List values) {
        ConeccionBD coneccionBD = new ConeccionBD();
        Connection coneccion = coneccionBD.getConection();
        String respuesta = "";
        System.out.println("Entro a registrar");
        try {
            PreparedStatement insert = coneccion.prepareStatement(String.format(
                    "INSERT INTO %s (Mueble_Nombre, MateriaPrima_Tipo,Cantidad) VALUES(?,?,?)", "ensamblepiezas"
            ));
            if (values.size() == 3) {
                insert.setString(1, (String) values.get(0));
                insert.setString(2, (String) values.get(1));
                insert.setString(3, (String) values.get(2));
                
                insert.executeUpdate();

                respuesta = "hecho";

            }

        } catch (SQLException e) {
            System.out.println(e);
            respuesta =  ErroresdeConexion.MessageError(e.getErrorCode(), e.getMessage());

        } finally {
            if (coneccion != null) {
                try {
                    coneccion.close();

                } catch (SQLException ex) {
                    respuesta =  ErroresdeConexion.MessageError(ex.getErrorCode(), ex.getMessage());
                }
            }
        }

        return respuesta;
    }

    public String EscribirBDENSAMBLAR_MUEBLE(List values) {
        ConeccionBD coneccionBD = new ConeccionBD();
        Connection coneccion = coneccionBD.getConection();
        String respuesta = "";
        System.out.println("Entro a registrar");
        try {
            PreparedStatement insert = coneccion.prepareStatement(String.format(
                    "INSERT INTO %s (Costo, Usuario_Nombre,Mueble_Nombre) VALUES(?,?,?)", "muebleensamblado"
            ));
            if (values.size() == 2) {
                insert.setDouble(1,0.00);
                insert.setString(2, (String) values.get(1));
                insert.setString(3, (String) values.get(0));

                insert.executeUpdate();

                respuesta = "hecho";

            }

        } catch (SQLException e) {
            System.out.println(e);
            respuesta =  ErroresdeConexion.MessageError(e.getErrorCode(), e.getMessage());

        } finally {
            if (coneccion != null) {
                try {
                    coneccion.close();

                } catch (SQLException ex) {

                }
            }
        }

        return respuesta;
    }

    public String EscribirBDCLIENTE(List values){
        ConeccionBD coneccionBD = new ConeccionBD();
        System.out.println("Entro a registrar");
        Connection coneccion = coneccionBD.getConection();
        String respuesta = "";
        
        try {
            if (values.size() == 3) {
                System.out.println("si entro acá 3");
                PreparedStatement insert = coneccion.prepareStatement(String.format(
                        "INSERT INTO %s (NIT, Nombre,Direccion) VALUES(?,?,?)", "clientes"
                ));

                 insert.setLong(1, Long.parseLong((String)values.get(1)));
                insert.setString(2, (String) values.get(1));
                insert.setString(3, (String) values.get(2));
                insert.executeUpdate();

                respuesta = "hecho";

            } else if (values.size() == 5) {
                System.out.println("si entro acá 5");
                PreparedStatement insert = coneccion.prepareStatement(String.format(
                        "INSERT INTO %s (NIT,Nombre,Direccion,Departamento,Municipio) VALUES(?,?,?,?,?)", "clientes"
                ));

                insert.setLong(1, Long.parseLong((String)values.get(1)));
                insert.setString(2, (String) values.get(0));
                insert.setString(3, (String) values.get(2));
                insert.setString(2, (String) values.get(4));
                insert.setString(3, (String) values.get(3));
                insert.executeUpdate();

                respuesta = "hecho";
                System.out.println(respuesta);
            }

        } catch (SQLException e) {
            System.out.println(e);
            respuesta =  ErroresdeConexion.MessageError(e.getErrorCode(), e.getMessage());

        } finally {
            if (coneccion != null) {
                try {
                    coneccion.close();

                } catch (SQLException ex) {

                }
            }
        }

        return respuesta;
    }
}
