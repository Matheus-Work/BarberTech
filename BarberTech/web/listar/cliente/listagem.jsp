<%@ page import="domain.model.Cliente" %>
<%@ page import="domain.dao.ClienteDAO" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listagem de Clientes</title>
        <!-- Adiciona um pouco de estilo para melhorar a apresentação -->
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                text-align: center;
                margin: 0;
            }

            h2 {
                color: #333; /* Cor escura para o título */
                margin-top:5em;
            }

            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #4caf50; /* Cor verde para o cabeçalho da tabela */
                color: white;
            }

            tr:hover {
                background-color: #f5f5f5; /* Cor de fundo quando passa o mouse sobre a linha */
            }

            a {
                text-decoration: none;
                color: #f00; /* Cor vermelha para o link de exclusão */
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
            <a href="/BarberTech/menu_barbeiro.html">
                <img src="/BarberTech/images/voltar.png" alt="voltar" class="botao-voltar"/>
            </a>
            <h1>BARBERTECH</h1>
        </header>
        <%
            // Instancia o ClienteDAO
            ClienteDAO clienteDAO = new ClienteDAO();

            // Lista todos os clientes
            List<Cliente> clientes = clienteDAO.listarClientes();
        %>

        <h2>Listagem de Clientes</h2>

        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Telefone</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <% for (Cliente cliente : clientes) {%>
                <tr>
                    <td><%= cliente.getId()%></td>
                    <td><%= cliente.getNome()%></td>
                    <td><%= cliente.getCpf()%></td>
                    <td><%= cliente.getTelefone()%></td>
                    <td><a href="<%= request.getContextPath()%>/excluir/cliente/realizar_exclusao.jsp?id=<%= cliente.getId()%>">excluir</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>

    </body>
</html>
