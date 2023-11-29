<%@ page import="domain.model.Cliente" %>
<%@ page import="domain.dao.ClienteDAO" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Atualização de Cliente</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                margin: 0;
            }

            h2 {
                color: #333;
                margin-top:4em;
            }

            form {
                width: 50%;
                margin: 0 auto;
                text-align: left;
            }

            label {
                display: block;
                margin-top: 10px;
            }

            input {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                cursor: pointer;
            }
            .botao-voltar {
                position: absolute;
                left: 1em;
                top: 0.8em;
                height: 2em;
                width: 2em;
            }
            header {
                background-color: #007bff;
                color: #fff;
                padding: 15px 0;
                text-align: center;
                width: 100%;
                position: fixed;
                top: 0;
                z-index: 1000;
            }
            header h1 {
                font-size: 2rem;
                margin: 0;
            }
        </style>
    </head>
    <body>
        <header class="bg-primary text-white text-center py-3">
            <a href="/BarberTech/menu_cliente.html">
                <img src="/BarberTech/images/voltar.png" alt="voltar" class="botao-voltar"/>
            </a>
            <h1>BARBERTECH</h1>
        </header>
        <%
            // Verifica se o ID do cliente foi passado como parâmetro
            Long clienteId = Long.parseLong(request.getParameter("id"));
            if (clienteId != null) {
                // Instancia o ClienteDAO
                ClienteDAO clienteDAO = new ClienteDAO();

                // Busca o cliente pelo ID
                Cliente cliente = clienteDAO.buscarClientePorId(clienteId);

                // Verifica se o cliente foi encontrado
                if (cliente != null) {
        %>

        <h2>Atualização de Cliente</h2>

        <form action="realizar_atualizacao.jsp" method="post">
            <!-- Hidden input para enviar o ID do cliente -->
            <input type="hidden" name="id" value="<%= cliente.getId()%>">

            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="<%= cliente.getNome()%>" required>

            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" value="<%= cliente.getCpf()%>" required>

            <label for="telefone">Telefone:</label>
            <input type="text" id="telefone" name="telefone" value="<%= cliente.getTelefone()%>" required>

            <input type="submit" value="Atualizar">
        </form>

        <%
        } else {
        %>
        <p>Cliente não encontrado.</p>
        <%
            }
        } else {
        %>
        <p>Parâmetro ID do cliente não foi fornecido.</p>
        <%
            }
        %>

    </body>
</html>
