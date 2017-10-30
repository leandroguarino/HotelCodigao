<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        String erro = request.getParameter("erro");
        if (erro != null){
            if (erro.equals("USUARIO_NAO_EXISTE")){
                %>
                Esse usuário não existe
                <%
            }
        }   
        %>
        <form name="formLogin" method="post" action="logar.jsp">
            <label>Login</label>
            <input type="text" name="login" /><br />
            <label>Senha</label>
            <input type="password" name="senha" />
            <input type="submit" name="entrar" value="Entrar" />
        </form>
    </body>
</html>
