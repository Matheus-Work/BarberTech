<%@ page import="domain.model.Cliente" %>
<%@ page import="domain.dao.ClienteDAO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualização de Cliente</title>
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

        // Cria um objeto Cliente com os dados do formulário
        Cliente cliente = new Cliente(id, nome, cpf, telefone);

        // Instancia o ClienteDAO
        ClienteDAO clienteDAO = new ClienteDAO();

        // Atualiza o cliente no banco de dados
        clienteDAO.atualizarCliente(cliente);
%>
        <h1>ATUALIZADO COM SUCESSO</h1>
<%
    }
    // Se não for um POST, exibe os dados atuais do cliente
    else {
        Long id = Long.parseLong(request.getParameter("id"));
        ClienteDAO clienteDAO = new ClienteDAO();
        Cliente cliente = clienteDAO.buscarClientePorId(id);
%>
        <h1>Dados atuais do Cliente</h1>
        <p>ID: <%= cliente.getId() %></p>
        <p>Nome: <%= cliente.getNome() %></p>
        <p>CPF: <%= cliente.getCpf() %></p>
        <p>Telefone: <%= cliente.getTelefone() %></p>
<%
    }
%>

</body>
</html>
