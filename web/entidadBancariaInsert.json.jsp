<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%><%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate"%><%@page import="com.fpmislata.daw2.bancoweb.negocio.TipoEntidadBancaria"%><%@page import="com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria"%><%
    String nombre = request.getParameter("nombre");
    String codigoEntidadBancaria = request.getParameter("codigoEntidadBancaria");
    String cif = request.getParameter("cif");
    TipoEntidadBancaria tipoEntidadBancaria = TipoEntidadBancaria.valueOf(request.getParameter("tipoEntidadBancaria"));
    EntidadBancaria entidadBancaria = new EntidadBancaria();
    entidadBancaria.setNombre(nombre);
    entidadBancaria.setCodigoEntidadBancaria(codigoEntidadBancaria);
    entidadBancaria.setCif(cif);
    entidadBancaria.setTipoEntidadBancaria(tipoEntidadBancaria);
    EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();
    entidadBancariaDAO.insert(entidadBancaria);
    ObjectMapper objectMapper = new ObjectMapper();
    String json = objectMapper.writeValueAsString(null);    //No devolvemos nada
    response.setContentType("application/json; chaset=UTF-8");
    out.print(json);
%>
