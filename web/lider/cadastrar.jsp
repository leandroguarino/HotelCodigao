<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Líderes</title>
    </head>
    <body>
        <h1>Cadastro de Líderes</h1>
        <form name="formCadastro" method="post" action="salvar.jsp">
            <label>Nome</label>
            <input type="text" name="nome" value="" />
            <br />
            <label>CPF</label>
            <input type="text" name="cpf" value="" />
            <br />
            <label>Telefone</label>
            <input type="text" name="telefone" value="" />
            <br />
            <label>Cidade</label>
            <input type="text" name="cidade" value="" />
            <br />
            <label>Estado</label>
            <select name="estado">
                <option value="SP">São Paulo</option>
                <option value="RJ">Rio de Janeiro</option>
            </select>
            <br />
            <label>Data de Nascimento</label>
            <input type="text" name="dataNascimento" value="" />
            <br />
            <input type="submit" name="salvar" value="Salvar" />
        </form>
    </body>
</html>
