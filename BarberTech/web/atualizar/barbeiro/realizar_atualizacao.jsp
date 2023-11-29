<%@ page import="domain.model.Barbeiro" %>
<%@ page import="domain.dao.BarbeiroDAO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualização de Barbeiro</title>
</head>
<body>

<%
    // Verifica se o formulário foi submetido
    if (request.getMethod().equalsIgnoreCase("post")) {
        // Obtém os dados do formulário
        Long id = Long.parseLong(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");

        // Cria um objeto Barbeiro com os dados do formulário
        Barbeiro barbeiro = new Barbeiro(id, nome, cpf, telefone);

        // Instancia o BarbeiroDAO
        BarbeiroDAO barbeiroDAO = new BarbeiroDAO();

        // Atualiza o barbeiro no banco de dados
        barbeiroDAO.atualizarBarbeiro(barbeiro);
    }
    // Se não for um POST, exibe os dados atuais do barbeiro
    else {
        Long id = Long.parseLong(request.getParameter("id"));
        BarbeiroDAO barbeiroDAO = new BarbeiroDAO();
        Barbeiro barbeiro = barbeiroDAO.buscarBarbeiroPorId(id);
%>
<%
    }
%>
<h1>ATUALIZADO COM SUCESSO</h1>
</body>
</html>
