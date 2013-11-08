<%-- 
    Document   : actualizar
    Created on : 08-nov-2013, 9:41:13
    Author     : alumno
--%>

<%@page import="com.fpmislata.daw2.bancoweb.negocio.TipoEntidadBancaria"%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate"%>
<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%>
<%@page import="com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria"%>
<% 
    int idEntidadBancaria = Integer.parseInt(request.getParameter("idEntidadBancaria"));
    
    EntidadBancaria entidadBancaria = new EntidadBancaria();
    
    EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();
    
    entidadBancaria = entidadBancariaDAO.read(idEntidadBancaria);
    
    String codigo = entidadBancaria.getCodigoEntidadBancaria();
    String nombre = entidadBancaria.getNombre();
    String cif = entidadBancaria.getCif();
    TipoEntidadBancaria tipoEntidadBancaria = entidadBancaria.getTipoEntidadBancaria();
    

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar una Entidad Bancaria</h1>
        <form action="insert.jsp">
            <fieldset>
                <legend>Insertar Una nueva Entidad Bancaria</legend>            
                <label>Codigo</label>
                <input type="text" placeholder="Codigo de la Entidad." name="codigo" value="<%=codigo%>">   
                <br />
                <br />
                <label>Nombre</label>
                <input type="text" placeholder="Nombre de la Entidad." name="nombre" value="<%=nombre%>">   
                <br /><br />
                <label>CIF</label>
                <input type="text" placeholder="CIF de la Entidad." name="cif" value="<%=cif%>">   
                <br /><br />
                <select name="tipo">
                    <option value="BANCO" <%if(tipoEntidadBancaria==tipoEntidadBancaria.BANCO){out.print("selected");}%> >BANCO</option>
                    <option value="CAJA_DE_AHORRO" <%if(tipoEntidadBancaria==tipoEntidadBancaria.CAJA_DE_AHORRO){out.print("selected");}%>>CAJA_DE_AHORRO</option>
                    <option value="COOPERATIVAS_DE_CREDITO" <%if(tipoEntidadBancaria==tipoEntidadBancaria.COOPERATIVAS_DE_CREDITO){out.print("selected");}%>>COOPERATIVAS_DE_CREDITO</option>
                    <option value="ESTABLECIMIENTOS_FINANCIEROS_DE_CREDITO" <%if(tipoEntidadBancaria==tipoEntidadBancaria.ESTABLECIMIENTOS_FINANCIEROS_DE_CREDITO){ out.print("selected");}%> >ESTABLECIMIENTOS_FINANCIEROS_DE_CREDITO</option>              
                </select>
                <br /><br />
                <button type="submit" class="btn">Insertar</button>
            </fieldset>
        </form>
    </body>
</html>
