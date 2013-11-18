/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.daw2.bancoweb.datos;

import com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;



/**
 *
 * @author alumno
 */
public class EntidadBancariaDAOImplHibernate extends GenericDAOImplHibernate<EntidadBancaria, Integer> implements EntidadBancariaDAO {

    @Override
    public List<EntidadBancaria> findByCodigo(String codigo) {

        Session session = sessionFactory.getCurrentSession(); //Abrimos la sesion

        Query query = session.createQuery("SELECT entidadBancaria FROM EntidadBancaria entidadBancaria WHERE codigoentidadbancaria=?");

        query.setString(0, codigo);
        
        List<EntidadBancaria> entidadesBancarias = query.list();

        return entidadesBancarias;
    }

    
    @Override
    public List<EntidadBancaria> findByNombre(String nombre) {
        
        Session session = sessionFactory.getCurrentSession(); //Abrimos la sesion

        Query query = session.createQuery("SELECT entidadBancaria FROM EntidadBancaria entidadBancaria WHERE nombre LIKE ?");

        query.setString(0, "%"+nombre+"%");
  
        List<EntidadBancaria> entidadesBancarias = query.list();

        return entidadesBancarias;
    }
    

}
