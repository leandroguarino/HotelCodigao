<%@page import="persistencia.LiderBD"%>
<%
String cpf = request.getParameter("cpf");
LiderBD.excluir(cpf);
response.sendRedirect("listar.jsp");
%>