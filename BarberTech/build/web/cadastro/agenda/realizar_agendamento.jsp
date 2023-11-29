<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="domain.model.Barbeiro" %>
<%@ page import="domain.model.Cliente" %>
<%@ page import="domain.dao.BarbeiroDAO" %>
<%@ page import="domain.dao.ClienteDAO" %>
<%@ page import="domain.model.TipoCorte" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="domain.model.Agenda" %>
<%@ page import="domain.dao.AgendaDAO" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.Locale" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agendado com sucesso</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: #4CAF50;
        }

        .success-message {
            background-color: #DFF2BF;
            border: 1px solid #4CAF50;
            padding: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<%
    // Verifica se o formulário foi submetido
    if (request.getMethod().equalsIgnoreCase("post")) {
        try {
            // Obtém os dados do formulário
            Long barbeiroId = Long.parseLong(request.getParameter("barbeiroId"));
            Long clienteId = Long.parseLong(request.getParameter("clienteId"));
            TipoCorte tipoCorte = TipoCorte.valueOf(request.getParameter("tipoCorte"));

            // Obtém a data do formulário e converte para LocalDateTime
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime data = LocalDateTime.parse(request.getParameter("dataHora"), formatter);

            String valorString = request.getParameter("valor").replaceAll("[^0-9.,]", "");
            valorString = valorString.replace(",", ".");
            double valor = Double.parseDouble(valorString);

            ClienteDAO clienteDAO = new ClienteDAO();
            BarbeiroDAO barbeiroDAO = new BarbeiroDAO();

            Cliente cliente = clienteDAO.buscarClientePorId(clienteId);
            Barbeiro barbeiro = barbeiroDAO.buscarBarbeiroPorId(barbeiroId);

            // Cria um objeto Agenda com os dados do formulário
            Agenda agenda = new Agenda(barbeiro, cliente, valor, tipoCorte, data);

            // Instancia o AgendaDAO
            AgendaDAO agendaDAO = new AgendaDAO();

            // Adiciona a agenda ao banco de dados
            agendaDAO.adicionarAgenda(agenda);
        } catch (Exception e) {
            e.printStackTrace(); // Adicione esta linha para imprimir a pilha de exceções
        }
    } // Se não for um POST, exibe o formulário para agendamento
    else {
%>

<%
    }
%>

    <h1>Agendado com sucesso</h1>

    <div class="success-message">
        <p>Seu agendamento foi realizado com sucesso. Obrigado!</p>
    </div>

</body>
</html>
