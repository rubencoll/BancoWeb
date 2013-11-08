<%-- 
    Document   : insert
    Created on : 08-nov-2013, 8:59:48
    Author     : alumno
--%>


<%@page import="com.fpmislata.daw2.bancoweb.negocio.TipoEntidadBancaria"%>
<%@page import="com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria"%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate"%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%>
<% 
    //Insertar
    
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    String cif = request.getParameter("cif");
    TipoEntidadBancaria tipoEntidadBancaria=TipoEntidadBancaria.valueOf(request.getParameter("tipo"));
    
    EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();
    
    EntidadBancaria entidadBancaria = new EntidadBancaria();
    
    entidadBancaria.setCodigoEntidadBancaria(codigo);
    entidadBancaria.setNombre(nombre);
    entidadBancaria.setCif(cif);
    entidadBancaria.setTipoEntidadBancaria(tipoEntidadBancaria);
    
    
    entidadBancariaDAO.insert(entidadBancaria);
    

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Se ha insertado con exito</h1>
    </body>
</html>
