<%@ page import="domain.model.Barbeiro" %>
<%@ page import="domain.dao.BarbeiroDAO" %>
<%@ page import="domain.model.Cliente" %>
<%@ page import="domain.dao.ClienteDAO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro</title>
    <!-- Adiciona um pouco de estilo para melhorar a apresentação -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: #4caf50; /* Cor verde para sucesso */
        }

        form {
            display: <%= request.getMethod().equalsIgnoreCase("post") ? "none" : "block" %>;
        }
    </style>
</head>
<body>

<%
    // Verifica se o formulário foi submetido
    if (request.getMethod().equalsIgnoreCase("post")) {
        String tipoCadastro = request.getParameter("tipo-cadastro");
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if ("barbeiro".equalsIgnoreCase(tipoCadastro)) {
            // Cria um objeto Barbeiro com os dados do formulário
            Barbeiro barbeiro = new Barbeiro(nome, cpf, telefone, email, senha);

            // Instancia o BarbeiroDAO
            BarbeiroDAO barbeiroDAO = new BarbeiroDAO();

            // Adiciona o barbeiro ao banco de dados
            barbeiroDAO.adicionarBarbeiro(barbeiro);
        } else if ("cliente".equalsIgnoreCase(tipoCadastro)) {
            // Cria um objeto Cliente com os dados do formulário
            Cliente cliente = new Cliente(nome, cpf, telefone, email, senha);

            // Instancia o ClienteDAO
            ClienteDAO clienteDAO = new ClienteDAO();

            // Adiciona o cliente ao banco de dados
            clienteDAO.adicionarCliente(cliente);
        }
    }
%>

<h1>CADASTRADO COM SUCESSO</h1>

<form action="" method="post">
    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" required><br>

    <label for="cpf">CPF:</label>
    <input type="text" id="cpf" name="cpf" required><br>

    <label for="telefone">Telefone:</label>
    <input type="text" id="telefone" name="telefone" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <label for="senha">Senha:</label>
    <input type="password" id="senha" name="senha" required><br>

    <label for="tipo-cadastro">Escolha o tipo:</label>
    <select id="tipo-cadastro" name="tipo-cadastro" required>
        <option value="barbeiro">Barbeiro</option>
        <option value="cliente">Cliente</option>
    </select>

    <input type="submit" value="Cadastrar">
</form>

</body>
</html>
