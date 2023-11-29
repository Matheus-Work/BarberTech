<%@ page import="domain.dao.AgendaDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exclusão de Agenda</title>
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

            // Instancia o AgendaDAO
            AgendaDAO agendaDAO = new AgendaDAO();

            // Exclui a agenda pelo ID
            agendaDAO.excluirAgenda(id);
%>
            <h1>CANCELADO COM SUCESSO</h1>
<%
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
