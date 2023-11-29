<%@ page import="domain.dao.ClienteDAO" %>
<%@ page import="domain.model.Cliente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exclusão de Cliente</title>
    <!-- Adiciona um pouco de estilo para melhorar a apresentação -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: #333; /* Cor escura para o título */
        }

        p {
            color: #888; /* Cor cinza para mensagens informativas */
        }
    </style>
</head>
<body>

<%
    // Verifica se o parâmetro "id" foi passado na URL
    String idParam = request.getParameter("id");
    if (idParam != null) {
        try {
            // Converte o parâmetro "id" para Long
            Long id = Long.parseLong(idParam);

            // Instancia o ClienteDAO
            ClienteDAO clienteDAO = new ClienteDAO();

            // Busca o cliente pelo ID
            Cliente cliente = clienteDAO.buscarClientePorId(id);

            // Verifica se o cliente foi encontrado
            if (cliente != null) {
                // Exclui o cliente do banco de dados
                clienteDAO.excluirCliente(id);
%>
                <h1>EXCLUÍDO COM SUCESSO</h1>
<%
            } else {
%>
                <p>Cliente não encontrado.</p>
<%
            }
        } catch (NumberFormatException e) {
%>
            <p>ID inválido.</p>
<%
        }
    } else {
%>
    <p>Parâmetro ID não fornecido.</p>
<%
    }
%>

</body>
</html>
