<%@page import="java.util.List"%><%@page import="java.util.ArrayList"%><%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAOImplHibernate"%><%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%><%@page import="com.fpmislata.daw2.bancoweb.datos.EntidadBancariaDAO"%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%@page import="com.fpmislata.daw2.bancoweb.negocio.EntidadBancaria"%><%
    List<EntidadBancaria> entidadesBancarias;
    EntidadBancariaDAO entidadBancariaDAO = new EntidadBancariaDAOImplHibernate();
    entidadesBancarias = entidadBancariaDAO.findAll();
    ObjectMapper objectMapper = new ObjectMapper();
    String json = objectMapper.writeValueAsString(entidadesBancarias);
    response.setContentType("application/json; chaset=UTF-8");
    out.print(json);
%>
