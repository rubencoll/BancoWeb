<%-- 
    Document   : update
    Created on : 08-nov-2013, 10:07:33
    Author     : alumno
--%>


<%@page import="com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria"%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate"%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%>
<%@page import="com.fpmislata.daw2.bancoweb.negocio.TipoEntidadBancaria"%>
<%
    //Actualizar    


    int idEntidadBancaria = Integer.parseInt(request.getParameter("idEntidadBancaria"));
    
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    String cif = request.getParameter("cif");
    TipoEntidadBancaria tipoEntidadBancaria = TipoEntidadBancaria.valueOf(request.getParameter("tipo"));

    EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();

    EntidadBancaria entidadBancaria = entidadBancariaDAO.read(idEntidadBancaria);

    entidadBancaria.setCodigoEntidadBancaria(codigo);
    entidadBancaria.setNombre(nombre);
    entidadBancaria.setCif(cif);
    entidadBancaria.setTipoEntidadBancaria(tipoEntidadBancaria);


    entidadBancariaDAO.update(entidadBancaria);



%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <link href="css/bootstrap.css" rel="stylesheet" >
    </head>
    <body>
         <h1>Se ha actualizado con exito</h1>
         <br /><br />
        <table class="table">
            <th>IDENTIFICADOR</th>
            <th>CODIGO</th>
            <th>NOMBRE</th>
            <th>TIPO</th>
            <th>CIF</th>
            <tr>
                <td><%= entidadBancaria.getIdEntidadBancaria()%></td>
                <td><%= entidadBancaria.getCodigoEntidadBancaria()%></td>
                <td><%= entidadBancaria.getNombre()%></td>
                <td><%= entidadBancaria.getTipoEntidadBancaria()%></td>      
                <td><%= entidadBancaria.getCif()%></td>

            </tr>
        </table>
         
         
    </body>
</html>
