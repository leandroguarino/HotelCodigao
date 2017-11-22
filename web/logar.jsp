<%@page import="dominio.Funcionario"%>
<%@page import="persistencia.FuncionarioBD"%>
<%
String login = request.getParameter("login");
String senha = request.getParameter("senha");

Funcionario funcionarioEncontrado = FuncionarioBD.procurarPorLoginSenha(login, senha);
if (funcionarioEncontrado != null){
    session.setAttribute("funcionario", funcionarioEncontrado);
    response.sendRedirect("lider/listar.jsp");
}else{
    response.sendRedirect("index.jsp?erro=USUARIO_NAO_EXISTE");
}
%>