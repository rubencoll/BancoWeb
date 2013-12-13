/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.daw2.bancoweb.presentacion.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO;
import com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate;
import com.fpmislata.daw2.bancoweb.negocio.BussinessMessage;
import com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria;
import com.fpmislata.daw2.bancoweb.presentacion.controlador;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
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

    //Leer una entidad que le pasamos un Id
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

    //Borrar una entidad que le pasamos un Id
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

    //Leer todos las entidades
    @RequestMapping(value = {"/EntidadBancaria"}, method = RequestMethod.GET)
    public void findAll(HttpServletRequest request, HttpServletResponse response) {

        try {

            List<EntidadBancaria> entidadesBancarias = entidadBancariaDAO.findAll();

            response.setStatus(HttpServletResponse.SC_OK);
            response.setContentType("application/json; chaset=UTF-8");

            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(entidadesBancarias);
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

    //Insertar una nueva entidad 
    @RequestMapping(value = {"/EntidadBancaria"}, method = RequestMethod.POST)
    public void insert(HttpServletRequest request, HttpServletResponse response, @RequestBody String json) {

        try {

            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
            EntidadBancaria entidadBancaria = (EntidadBancaria) objectMapper.readValue(json, EntidadBancaria.class);

            entidadBancariaDAO.insert(entidadBancaria);

            response.setStatus(HttpServletResponse.SC_OK);
            response.setContentType("application/json; chaset=UTF-8");

            String jsonSalida = objectMapper.writeValueAsString(entidadBancaria);
            response.getWriter().println(jsonSalida);

        } catch (ConstraintViolationException exCVE) {

            List<BussinessMessage> bussinessMassageList = new ArrayList<>();

            System.out.println("No se ha podido insertar el profesor debido a los siguientes errores:");
            for (ConstraintViolation constraintViolation : exCVE.getConstraintViolations()) {

                BussinessMessage bussinessMessage = new BussinessMessage();

                bussinessMessage.setField(constraintViolation.getPropertyPath().toString());
                bussinessMessage.setMessage(constraintViolation.getMessage());
                bussinessMassageList.add(bussinessMessage);

            }

            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
            try {

                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.setContentType("application/json; chaset=UTF-8");
                String jsonError = objectMapper.writeValueAsString(bussinessMassageList);
                response.getWriter().println(jsonError);
            } catch (Exception ex) {
            }


        } catch (Exception ex) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("text/plain; charset=UTF-8;");
            try {

                ex.printStackTrace(response.getWriter());
            } catch (IOException ex1) {
            }
        }




    }

    //Actualizar una EntidadBancaria
    @RequestMapping(value = {"/EntidadBancaria/{idEntidadBancaria}"}, method = RequestMethod.PUT)
    public void update(HttpServletRequest request, HttpServletResponse response, @PathVariable("idEntidadBancaria") int idEntidadBancaria, @RequestBody String json) {

        try {

            EntidadBancaria entidadBancariaLeida = entidadBancariaDAO.read(idEntidadBancaria);

            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
            EntidadBancaria entidadBancaria = (EntidadBancaria) objectMapper.readValue(json, EntidadBancaria.class);

            entidadBancariaLeida.setNombre(entidadBancaria.getNombre());
            entidadBancariaLeida.setCodigoEntidadBancaria(entidadBancaria.getCodigoEntidadBancaria());
            entidadBancariaLeida.setCif(entidadBancaria.getCif());
            entidadBancariaLeida.setTipoEntidadBancaria(entidadBancaria.getTipoEntidadBancaria());

            entidadBancariaDAO.update(entidadBancariaLeida);

            response.setStatus(HttpServletResponse.SC_OK);
            response.setContentType("application/json; chaset=UTF-8");

            String jsonSalida = objectMapper.writeValueAsString(entidadBancariaLeida);
            response.getWriter().println(jsonSalida);


        } catch (Exception ex) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("text/plain; charset=UTF-8;");
            try {

                ex.printStackTrace(response.getWriter());
            } catch (IOException ex1) {
            }
        }
    }
}
