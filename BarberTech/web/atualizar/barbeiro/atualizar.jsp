<%@ page import="domain.model.Barbeiro" %>
<%@ page import="domain.dao.BarbeiroDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualização de Barbeiro</title>
</head>
<style>
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
            .container {
                margin-top: 5em;
            }
            .h2 {
                margin-top: 4em;
            }
</style>
<body>
<header class="bg-primary text-white text-center py-3">
            <a href="/BarberTech/menu_barbeiro.html">
                <img src="/BarberTech/images/voltar.png" alt="voltar" class="botao-voltar"/>
            </a>
            <h1>BARBERTECH</h1>
        </header>
<%
    // Verifica se o ID do barbeiro foi passado como parâmetro
    Long barbeiroId = Long.parseLong(request.getParameter("id"));
    if (barbeiroId != null) {
        // Instancia o BarbeiroDAO
        BarbeiroDAO barbeiroDAO = new BarbeiroDAO();

        // Busca o barbeiro pelo ID
        Barbeiro barbeiro = barbeiroDAO.buscarBarbeiroPorId(barbeiroId);

        // Verifica se o barbeiro foi encontrado
        if (barbeiro != null) {
%>

<h2>Atualização de Barbeiro</h2>

<form action="realizar_atualizacao.jsp" method="post">
    <!-- Hidden input para enviar o ID do barbeiro -->
    <input type="hidden" name="id" value="<%= barbeiro.getId()%>">

    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" value="<%= barbeiro.getNome()%>" required><br>

    <label for="cpf">CPF:</label>
    <input type="text" id="cpf" name="cpf" value="<%= barbeiro.getCpf()%>" required><br>

    <label for="telefone">Telefone:</label>
    <input type="text" id="telefone" name="telefone" value="<%= barbeiro.getTelefone()%>" required><br>

    <input type="submit" value="Atualizar">
</form>

<%
        } else {
%>
<p>Barbeiro não encontrado.</p>
<%
        }
    } else {
%>
<p>Parâmetro ID do barbeiro não foi fornecido.</p>
<%
    }
%>

</body>
</html>
