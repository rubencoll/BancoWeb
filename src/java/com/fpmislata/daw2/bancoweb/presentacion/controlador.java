/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.daw2.bancoweb.presentacion;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author alumno
 */

@Controller
public class controlador {

   
   

    @RequestMapping({"/beer.json"})
    public void read(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.getWriter().println("Hola Mundo");
            
            
        } catch (IOException ex) {
            Logger.getLogger(controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
