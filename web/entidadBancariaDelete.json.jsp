<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate"%><%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%><%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%@page import="com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria"%><% 
    EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();
    entidadBancariaDAO.delete(Integer.parseInt(request.getParameter("idEntidadBancaria"))); 
    ObjectMapper objectMapper = new ObjectMapper();
    String json = objectMapper.writeValueAsString(null);
    response.setContentType("application/json; chaset=UTF-8");
    out.print(json);
%>
