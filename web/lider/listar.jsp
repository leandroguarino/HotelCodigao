<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Lider"%>
<%@page import="persistencia.LiderBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de líderes</title>
    </head>
    <body>
        <h1>Lista de líderes</h1>
        
        <table>
            <thead>
                <tr>
                    <th>CPF</th>
                    <th>Nome</th>
                    <th>Data de Nascimento</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <%
            SimpleDateFormat formato=new SimpleDateFormat("dd/MM/yyyy");    
                
            ArrayList<Lider> lideres = LiderBD.listar();

            for(int i=0; i < lideres.size(); i++){
                Lider cadaLider = lideres.get(i);
                String dataNascimento = "";
                if (cadaLider.getDataNascimento() != null){
                    dataNascimento = formato.format(cadaLider.getDataNascimento());
                }
                %>
                <tr>
                    <td><%=cadaLider.getCpf()%></td>
                    <td><%=cadaLider.getNome()%></td>
                    <td><%=dataNascimento%></td>
                    <td>
                        <a href="cadastrar.jsp">Alterar</a>
                        <a href="excluir.jsp?cpf=<%=cadaLider.getCpf()%>" onclick="return confirm('Deseja realmente excluir?')">Excluir</a>
                    </td>
                </tr>
                <%
            }
            %>
            </tbody>
        </table>
    </body>
</html>
