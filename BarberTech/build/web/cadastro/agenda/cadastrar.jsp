<%@ page import="java.util.List" %>
<%@ page import="domain.dao.BarbeiroDAO" %>
<%@ page import="domain.model.Barbeiro" %>
<%@ page import="domain.model.Cliente" %>
<%@ page import="domain.dao.ClienteDAO" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Agendamento</title>
        <!-- Adiciona os links para os arquivos do Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script>
            // Função JavaScript para atualizar o valor ao selecionar o tipo de corte
            function atualizarValor() {
                var tipoCorteSelecionado = document.getElementById("tipoCorte").value;
                var valorInput = document.getElementById("valor");

                // Lógica para definir o valor com base no tipo de corte
                var valor = 0.0;
                if (tipoCorteSelecionado === "CABELO") {
                    valor = 30.0;
                } else if (tipoCorteSelecionado === "BARBA") {
                    valor = 20.0;
                } else if (tipoCorteSelecionado === "COMPLETO") {
                    valor = 45.0;
                }

                // Formata o valor com duas casas decimais e o símbolo "R$"
                valorInput.value = "R$" + valor.toFixed(2);
            }
        </script>
        <style>
            body {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                background-color: #f8f9fa; /* Fundo sutil */
            }

            form {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                text-align: center;
            }

            h2 {
                color: #007bff; /* Cor azul para o título */
                margin-top: 4em;
            }

            label {
                font-weight: bold;
                margin-top: 10px;
            }

            input[type="text"],
            select,
            input[type="datetime-local"] {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #007bff;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-top: 15px;
            }

            input[type="submit"]:hover {
                background-color: #0056b3; /* Cor mais escura ao passar o mouse */
            }

            p {
                color: red; /* Cor vermelha para mensagens de erro */
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
            String cpf = request.getParameter("cpf");

            BarbeiroDAO barbeiroDAO = new BarbeiroDAO();
            List<Barbeiro> barbeiros = barbeiroDAO.listarBarbeiros();

            ClienteDAO clienteDAO = new ClienteDAO();
            Cliente cliente = clienteDAO.buscarClientePorCPF(cpf);

            if (cliente != null) {
        %>

        <h2>Agendar</h2>

        <form action="realizar_agendamento.jsp" method="post">
            <label for="barbeiroId">Selecione o Barbeiro:</label>
            <select id="barbeiroId" name="barbeiroId" required>
                <option value="">Selecione</option>
                <% // Itera sobre a lista de barbeiros e preenche as opções do dropdown
                    for (Barbeiro barbeiro : barbeiros) {
                %>
                <option value="<%= barbeiro.getId()%>"><%= barbeiro.getNome()%></option>
                <%
                    }
                %>
            </select><br>

            <input type="hidden" id="clienteId" name="clienteId" value="<%= cliente.getId()%>"><br>

            <label for="tipoCorte">Tipo de Corte:</label>
            <select id="tipoCorte" name="tipoCorte" required onchange="atualizarValor()">
                <option value="">Selecione</option>
                <option value="CABELO">CABELO</option>
                <option value="BARBA">BARBA</option>
                <option value="COMPLETO">COMPLETO</option>
            </select><br>

            <label for="valor">Valor:</label>
            <input type="text" id="valor" name="valor" readonly><br>

            <label for="dataHora">Data e Hora:</label>
            <input type="datetime-local" id="dataHora" name="dataHora" required><br>

            <input type="submit" value="Agendar">
        </form>

        <%
        } else {
        %>
        <p>Cliente não encontrado. Verifique o CPF fornecido.</p>
        <%
            }
        %>

        <!-- Adiciona os scripts do Bootstrap (jQuery e Popper.js são necessários para alguns recursos do Bootstrap) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
