package com.mycompany.proyeco1.ConeccionDB;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.mycompany.proyeco1.ConeccionDB.EscritorDB;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Linda Monterroso
 */
public class LeerArchivoTxt {

    public String leerArchivo(BufferedReader bufferedReader) throws IOException {
        System.out.print("Si entro acá");
        String errores = "";
        EscritorDB escritor = new EscritorDB();
        int contador = 0;

        String linea;
        while ((linea = bufferedReader.readLine()) != null) {
                    System.out.print("Si entro acá: "+linea);

            String objeto = this.QueObjetoEs(linea);
            System.out.println(objeto);
            byte var13 = -1;
            switch (objeto) {
                case "USUARIO":
                    var13 = 1;
                    break;
                case "PIEZA":
                    var13 = 2;
                    break;
                case "MUEBLE":
                    var13 = 3;
                    break;
                case "ENSAMBLE_PIEZAS":
                    var13 = 4;
                    break;
                case "ENSAMBLAR_MUEBLE":
                    var13 = 5;
                    break;
                case "CLIENTE":
                    var13 = 6;
                    break;

            }

            List<String> campos;
            String[] cadena;
            String nuevoError;
            switch (var13) {
                case 1:
                    campos = this.separador(linea, "USUARIO(");
                    contador++;
                    nuevoError = escritor.EscribirBDUSUARIO(campos);

                    if (nuevoError.equals("hecho")) {
                        System.out.println(nuevoError);
                    } else {
                        errores = errores + "Error en la linea " + String.valueOf(contador) + ": " + nuevoError+" ";
                        //errores = errores+"Error en la linea ";
                    }

                    break;
                case 2:
                    campos = this.separador(linea, "PIEZA(");
                    nuevoError = escritor.EscribirBDPIEZA(campos);
                    if (nuevoError.equals("hecho")) {
                        System.out.println(nuevoError);
                    } else {
                        errores = errores + "Error en la linea " + String.valueOf(contador) + ": " + nuevoError+" ";
                        //errores = errores+"Error en la linea ";
                    }
                    break;
                case 3:
                    campos = this.separador(linea, "MUEBLE(");
                    nuevoError = escritor.EscribirBDMUEBLE(campos);
                    if (nuevoError.equals("hecho")) {
                        System.out.println(nuevoError);
                    } else {
                        errores = errores + "Error en la linea " + String.valueOf(contador) + ": " + nuevoError+" ";
                        //errores = errores+"Error en la linea ";
                    }
                    break;
                case 4:
                    campos = this.separador(linea, "ENSAMBLE_PIEZAS(");
                    nuevoError = escritor.EscribirBDENSAMBLE_PIEZAS(campos);
                    if (nuevoError.equals("hecho")) {
                        System.out.println(nuevoError);
                    } else {
                        errores = errores + "Error en la linea " + String.valueOf(contador) + ": " + nuevoError+" ";
                        //errores = errores+"Error en la linea ";
                    }
                    break;
                case 5:
                    campos = this.separador(linea, "ENSAMBLAR_MUEBLE(");
                    nuevoError = escritor.EscribirBDENSAMBLAR_MUEBLE(campos);
                    if (nuevoError.equals("hecho")) {
                        System.out.println(nuevoError);
                    } else {
                        errores = errores + "Error en la linea " + String.valueOf(contador) + ": " + nuevoError+" ";
                        //errores = errores+"Error en la linea ";
                    }
                    break;
                case 6:
                    campos = this.separador(linea, "CLIENTE(");
                    nuevoError = escritor.EscribirBDCLIENTE(campos);
                    if (nuevoError.equals("hecho")) {
                        System.out.println(nuevoError);
                    } else {
                        errores = errores + "Error en la linea " + String.valueOf(contador) + ": " + nuevoError+" ";
                        //errores = errores+"Error en la linea ";
                    }
                    break;

                default:

            }
        }
        return errores;
    }

    private String QueObjetoEs(String linea) {
        String objeto = linea.substring(0, linea.indexOf("("));
        return objeto;
    }

    private List separador(String linea, String inicio) {
         System.out.println(linea);
        String lineaDeCampos = linea.substring(inicio.length(), linea.length() - 1);
        lineaDeCampos = lineaDeCampos.replace("“", "");
        lineaDeCampos = lineaDeCampos.replace("”", "");
        System.out.println(lineaDeCampos);
        
        List<String> myList = new ArrayList<String>(Arrays.asList(lineaDeCampos.split(",")));
        return myList;
    }

}