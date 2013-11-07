<%-- 
    Document   : borrar
    Created on : 07-nov-2013, 9:58:31
    Author     : alumno
--%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate"%>
<%@page import="com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria"%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%>
<%


    //Borrar

    String idEntidadBancariaString = request.getParameter("idEntidadBancaria");
    
    int idEntidadBancaria = Integer.parseInt(idEntidadBancariaString);

    EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();
    
    EntidadBancaria entidadBancariaBuscada = new EntidadBancaria();
    entidadBancariaBuscada = entidadBancariaDAO.read(idEntidadBancaria);
    
    
    entidadBancariaDAO.delete(idEntidadBancaria);


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" >
    </head>
    <body>
        <h1>Se ha borrado la Entidad Bancaria con Identificador: <%=idEntidadBancaria %></h1>

        <table class="table">
            <th>IDENTIFICADOR</th>
            <th>CODIGO</th>
            <th>NOMBRE</th>
            <th>TIPO</th>
            <th>CIF</th>
  
            <tr>
                <td><%= entidadBancariaBuscada.getIdEntidadBancaria()%></td>
                <td><%= entidadBancariaBuscada.getCodigoEntidadBancaria()%></td>
                <td><%= entidadBancariaBuscada.getNombre()%></td>
                <td><%= entidadBancariaBuscada.getTipoEntidadBancaria()%></td>      
                <td><%= entidadBancariaBuscada.getCif()%></td>

            </tr>

        </table>
    </body>
</html>
