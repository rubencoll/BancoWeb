<%-- 
    Document   : nuevo
    Created on : 07-nov-2013, 10:48:39
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insertar una Entidad Bancaria</h1>
        <form action="insert.jsp">
            <fieldset>
                <legend>Insertar Una nueva Entidad Bancaria</legend>            
                <label>Codigo</label>
                <input type="text" placeholder="Codigo de la Entidad." name="codigo">   
                <br />
                <br />
                <label>Nombre</label>
                <input type="text" placeholder="Nombre de la Entidad." name="nombre">   
                <br /><br />
                <label>CIF</label>
                <input type="text" placeholder="CIF de la Entidad." name="cif">   
                <br /><br />
                <select name="tipo">
                    <option value="BANCO">BANCO</option>
                    <option value="CAJA_DE_AHORRO">CAJA_DE_AHORRO</option>
                    <option value="COOPERATIVAS_DE_CREDITO">COOPERATIVAS_DE_CREDITO</option>
                    <option value="ESTABLECIMIENTOS_FINANCIEROS_DE_CREDITO">ESTABLECIMIENTOS_FINANCIEROS_DE_CREDITO</option>              
                </select>
                <br /><br />
                <button type="submit" class="btn">Insertar</button>
            </fieldset>
        </form>
    </body>
</html>
