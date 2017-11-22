<%@page import="java.text.SimpleDateFormat"%>
<%@page import="persistencia.LiderBD"%>
<%@page import="dominio.Lider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/validarUsuario.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Líderes</title>
    </head>
    <body>
        <%
        Lider lider = null;    
        String cpf = request.getParameter("cpf");
        if (cpf != null){
            lider = LiderBD.getByCpf(cpf);
        }else{ //está adicionando um líder
            lider = new Lider();
        }
        
        String dataNascimento = "";
        if (lider.getDataNascimento() != null){
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            dataNascimento = formato.format(lider.getDataNascimento());
        }
        %>
        <jsp:include page="../menu.jsp"></jsp:include>
        <h1>Cadastro de Líderes</h1>
        <form name="formCadastro" method="post" action="salvar.jsp">
            <label>Nome</label>
            <input type="text" name="nome" value="<%=lider.getNome()%>" />
            <br />
            <label>CPF</label>
            <input type="text" name="cpf" value="<%=lider.getCpf()%>" />
            <br />
            <label>Telefone</label>
            <input type="text" name="telefone" value="<%=lider.getTelefone()%>" />
            <br />
            <label>Cidade</label>
            <input type="text" name="cidade" value="<%=lider.getCidade()%>" />
            <br />
            <label>Estado</label>
            <%
            String estadoSelecionado = "SP";
            if (lider.getEstado() != null){
                estadoSelecionado = lider.getEstado();
            }
            %>
            <select name="estado">
                <option value="SP" <% if (estadoSelecionado.equals("SP")) out.println("selected"); %>>São Paulo</option>
                <option value="RJ" <% if (estadoSelecionado.equals("RJ")) out.println("selected"); %>>Rio de Janeiro</option>
            </select>
            <br />
            <label>Data de Nascimento</label>
            <input type="text" name="dataNascimento" value="<%=dataNascimento%>" />
            <br />
            <input type="submit" name="salvar" value="Salvar" />
            <input type="hidden" name="idAlterado" value="<%=cpf%>" />
        </form>
    </body>
</html>
