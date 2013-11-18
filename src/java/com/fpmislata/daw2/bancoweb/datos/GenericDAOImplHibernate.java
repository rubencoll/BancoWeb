/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpmislata.daw2.bancoweb.datos;

import com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


/**
 *
 * @author alumno
 */
public class GenericDAOImplHibernate<T, ID extends Serializable> implements GenericDAO<T, ID> {

    SessionFactory sessionFactory;

    public GenericDAOImplHibernate() {

        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    @Override
    public T read(ID id) {

        //Session session = sessionFactory.openSession(); //Abrimos la sesion
        
        Session session = sessionFactory.getCurrentSession(); //Abrimos la sesion

        T t = (T) session.get(getEntityClass(), id);

        //session.close();    //Cerramos la session

        return t;
    }

    @Override
    public void insert(T t) {

        Session session = sessionFactory.getCurrentSession(); //Abrimos la sesion

        session.beginTransaction(); //Indicamos transferencia

        session.save(t);  //guardamos el objeto

        session.getTransaction().commit();  //Hacemos el commit

    }

    @Override
    public void update(T t) {

        Session session = sessionFactory.getCurrentSession(); //Abrimos la sesion

        session.beginTransaction();

        session.update(t);

        session.getTransaction().commit();

       
    }

    @Override
    public void delete(ID id) {

        Session session = sessionFactory.getCurrentSession(); //Abrimos la sesion

        T t = (T) session.get(getEntityClass(), id);
        // EntidadBancaria entidadBancariaBorrar = read(idEntidadBancaria);

        session.beginTransaction();

        session.delete(t);

        session.getTransaction().commit();

        
    }

    @Override
    public List<T> findAll() {

        Session session = sessionFactory.getCurrentSession(); //Abrimos la sesion   
        
        Query query = session.createQuery("SELECT t FROM "+getEntityClass().getName()+" t");
        
        List<T> tList = query.list(); 

        return tList;
    }

    private Class<T> getEntityClass() {
        return (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }
}
