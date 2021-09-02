/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java;

import java.io.*;
import java.sql.Date;

/**
 *
 * @author Linda Monterroso
 */
public class PasaraCSV {
    
    private PrintWriter printw = null;
    private FileWriter filewriter = null;
    private File fileReporteViajes = new File("C:\\Users\\Linda Monterroso\\Documents\\NetBeansProjects\\ManejadorAeropuerto\\ReportesporAereolinea.html");
    
    public void EscribirCSV(String nombreTabla, Date fechainicio, Date fechafinal){
        if (fileReporteViajes.exists()){
            fileReporteViajes.delete();
        }


        try {
            filewriter = new FileWriter("ReportesporAereolinea.html",true);//declarar el archivo
            printw = new PrintWriter(filewriter);//declarar un impresor
            
            
            printw.println("" );
            int item = 0;
            /*for (Aerolíneas aerolíneas: aerolíneas){
                printw.println("        <div>Aereolinea: "+aerolíneas.getNOMBRE_AEROLINEA()+"</div>\n");
                printw.println("        <div>Ruta mas concurrida" + rutasMasConcurridas[item] + "</div>\n");
                printw.println("        <div>Vuelos que han echo esta ruta: </div>\n");
                if (vuelosConcurridos.size()!=0) {
                    ArrayList<Vuelo> vuelos = vuelosConcurridos.get(item);
                    for (Vuelo vuelo1 : vuelos) {
                        printw.println("        <div>Vuelo :" + vuelo1.getCODIGO_VUELO() + " </div>\n");
                        printw.println("        <div>pasajeros:" + vuelo1.getOcupados().size() + " </div>\n");
                    }
                }
                item++;
            }
            printw.println("    </body>\n" +
                    "</html>");
            printw.close();*/
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    
}
