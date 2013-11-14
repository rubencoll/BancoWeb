<%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate"%><%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%><%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%@page import="com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria"%><% 
    EntidadBancaria entidadBancaria = new EntidadBancaria();
    EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();
    entidadBancaria = entidadBancariaDAO.read(Integer.parseInt(request.getParameter("idEntidadBancaria"))); 
    ObjectMapper objectMapper = new ObjectMapper();
    String json = objectMapper.writeValueAsString(entidadBancaria);
    response.setContentType("application/json; chaset=UTF-8");
    out.print(json);
%>