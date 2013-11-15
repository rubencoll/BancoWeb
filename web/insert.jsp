<%-- 
    Document   : insert
    Created on : 08-nov-2013, 8:59:48
    Author     : Ruben Coll Tovar
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
    TipoEntidadBancaria tipoEntidadBancaria = TipoEntidadBancaria.valueOf(request.getParameter("tipoEntidadBancaria"));

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
        <title>JInsert</title>
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
                background-image: url('img/texturas_metal.JPG');

            }
        </style>
    </head>
    <body>
        <div class="tablaCentrado">
            <h1>Se ha insertado con exito</h1>
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
                    &nbsp;&nbsp; <a href="index.jsp" class="btn" >Volver</a>
                    <br /><br />
        </div>
    </body>
</html>
