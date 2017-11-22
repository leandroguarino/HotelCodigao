<%@page import="dominio.Funcionario"%>
<%
Funcionario funcionarioLogado = null;
if (session.getAttribute("funcionario") != null){
    funcionarioLogado = (Funcionario) session.getAttribute("funcionario");
}else{
    response.sendRedirect("/HotelCodigao/index.jsp");
}
%>