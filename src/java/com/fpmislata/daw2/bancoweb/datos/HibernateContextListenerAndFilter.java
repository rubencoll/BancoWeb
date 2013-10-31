/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.daw2.bancoweb.datos;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author alumno
 */
public class HibernateContextListenerAndFilter implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent sce) {
       HibernateUtil.buildSessionFactory();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        HibernateUtil.closeSessionFactory();
    }
    
}
