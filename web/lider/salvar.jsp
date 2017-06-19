<%@page import="persistencia.LiderBD"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.Lider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de líderes</title>
    </head>
    <body>
        <%
        String idAlterado = request.getParameter("idAlterado");
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String dataNascimento = request.getParameter("dataNascimento");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Date data = formato.parse(dataNascimento);
        
        Lider lider;
        if (idAlterado != "null"){
            lider = LiderBD.getByCpf(idAlterado);
        }else{ //se for um novo cadastro
            lider = new Lider();
        }
        lider.setNome(nome);
        lider.setCpf(cpf);
        lider.setCidade(cidade);
        lider.setEstado(estado);
        lider.setDataNascimento(data);
        lider.setTelefone(telefone);
        if (idAlterado != "null"){
            LiderBD.alterar(lider);
            out.println("Líder alterado com sucesso");
        }else{
            LiderBD.inserir(lider);
            out.println("Líder cadastrado com sucesso");
        }
        %>
        
    </body>
</html>
