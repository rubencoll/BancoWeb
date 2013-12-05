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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author alumno
 */
@Controller
public class EntidadBancariaController {

    @RequestMapping(value = {"/EntidadBancaria/{idEntidadBancaria}"}, method = RequestMethod.GET)
    public void read(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException, IOException {

        try {
            EntidadBancaria entidadBancaria = new EntidadBancaria();
            EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();
            entidadBancaria = entidadBancariaDAO.read(Integer.parseInt(request.getParameter("idEntidadBancaria")));
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(entidadBancaria);
            response.setContentType("application/json; chaset=UTF-8");

            response.getWriter().println(json);

        } catch (Exception ex) {  
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

    }

    @RequestMapping(value = {"/EntidadBancaria/{idEntidadBancaria}"}, method = RequestMethod.DELETE)
    public void delete(HttpServletRequest request, HttpServletResponse response) {

        try {

            EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();
            entidadBancariaDAO.delete(Integer.parseInt(request.getParameter("idEntidadBancaria")));
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(null);
            response.setContentType("application/json; chaset=UTF-8");
            response.getWriter().println(json);


        } catch (Exception ex) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

    }
}
