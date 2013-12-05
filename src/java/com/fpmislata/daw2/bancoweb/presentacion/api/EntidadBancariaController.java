/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.daw2.bancoweb.presentacion.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO;
import com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate;
import com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria;
import com.fpmislata.daw2.bancoweb.presentacion.controlador;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author alumno
 */
@Controller
public class EntidadBancariaController {
    
    @Autowired
    EntidadBancariaDAO entidadBancariaDAO;

    @RequestMapping(value = {"/EntidadBancaria/{idEntidadBancaria}"}, method = RequestMethod.GET)
    public void read(HttpServletRequest request, HttpServletResponse response, @PathVariable("idEntidadBancaria") int idEntidadBancaria) {

        try {

            EntidadBancaria entidadBancaria = entidadBancariaDAO.read(idEntidadBancaria);
            

            response.setStatus(HttpServletResponse.SC_OK);
            response.setContentType("application/json; chaset=UTF-8");
            
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(entidadBancaria);
            response.getWriter().println(json);


        } catch (Exception ex) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("text/plain; charset=UTF-8;");
            try {

                ex.printStackTrace(response.getWriter());
            } catch (IOException ex1) {
            }
        }

    }

    @RequestMapping(value = {"/EntidadBancaria/{idEntidadBancaria}"}, method = RequestMethod.DELETE)
    public void delete(HttpServletRequest request, HttpServletResponse response, @PathVariable("idEntidadBancaria") int idEntidadBancaria) {

        try {

            entidadBancariaDAO.delete(idEntidadBancaria);
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);

        } catch (Exception ex) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("text/plain; charset=UTF-8");
            try {    
                ex.printStackTrace(response.getWriter());
            } catch (IOException ex1) {
            }
        }

    }
}
