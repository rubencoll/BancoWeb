<%@page import="com.fpmislata.daw2.bancoweb.datos.HibernateUtil"%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.fpmislata.daw2.bancoweb.negocio.TipoEntidadBancaria"%>
<%@page import="com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria"%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%>

<%

    EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();

    //Mostrar muchas entidades bancarias    

    List<EntidadBancaria> entidadesBancarias;

    entidadesBancarias = entidadBancariaDAO.findAll();
    
    //Para pasar un dato por el Get de la URL 

    String nombreB = request.getParameter("nombre");
    List<EntidadBancaria> entidadBancariaBuscadaGet;

    entidadBancariaBuscadaGet = entidadBancariaDAO.findByNombre(nombreB);


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link href="css/bootstrap.css" rel="stylesheet" >
        <style type="text/css">
            .cCentrado{
                float:left;
                text-align: center;
                border:1px solid black;
                border-color: blue ;
                width: 300px;
                height: 50px;
                padding-top: 15px;
                border-radius: 20px;
                background-color: skyblue;
            }

            .tablaCentrado{
                width: 1000px;
                border:1px solid black;
                border-color: blue ;
                margin:auto;   
                margin-top:150px;
                background-color: white;
            }

            th {
                background-color: skyblue ;
            }
   
            body {
                background-image: url('img/dark_blue.JPG');
                    
            }
        </style>
    </head>
    <body>
        <div class="tablaCentrado">
            <h1>Buscar Entidad Bancaria</h1>
            
            <div class="cCentrado" >
                <form class="form-search" method="GET" action="index.jsp">
                    <input name="nombre" type="text" class="input-medium search-query">
                    <button type="submit" class="btn">Buscar</button>

                </form>
            </div>
            <div class="cCentrado" >
                <a href="newForInsert.jsp" class="btn" >Insertar Entidad</a>
            </div>
            <br /><br />
            <br /><br />
            <hr>

            <h1>Entidad Bancaria Buscada: <% if (nombreB == null) {
                } else {
                    out.print(nombreB);
                }%></h1>
            <table class="table">
                <th>IDENTIFICADOR</th>
                <th>CODIGO</th>
                <th>NOMBRE</th>
                <th>TIPO</th>
                <th>CIF</th>
                <th>BORRAR</th>
                <th>ACTUALIZAR</th>
                    <%

                        for (EntidadBancaria entidadBancaria : entidadBancariaBuscadaGet) {
                    %>
                <tr>
                    <td><%= entidadBancaria.getIdEntidadBancaria()%></td>
                    <td><%= entidadBancaria.getCodigoEntidadBancaria()%></td>
                    <td><%= entidadBancaria.getNombre()%></td>
                    <td><%= entidadBancaria.getTipoEntidadBancaria()%></td>       
                    <td><%= entidadBancaria.getCif()%> </td>
                    <td><a href="delete.jsp?idEntidadBancaria=<%= entidadBancaria.getIdEntidadBancaria()%>" class="btn" >Borrar</a></td>
                    <td><a href="newForUpdate.jsp?idEntidadBancaria=<%= entidadBancaria.getIdEntidadBancaria()%>" class="btn" >Editar</a></td>
                </tr>
                <%
                    }
                %>

            </table>
        </div>
    </body>
</html>

