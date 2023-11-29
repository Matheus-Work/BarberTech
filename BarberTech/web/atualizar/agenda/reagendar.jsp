<%@page import="java.time.LocalDateTime"%>
<%@ page import="domain.model.Agenda" %>
<%@ page import="domain.dao.AgendaDAO" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reagendar Agenda</title>
    <!-- Bootstrap CSS link -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h1 class="text-center">Reagendar Agenda</h1>
            </div>
            <div class="card-body">

                <%
                    // Verifica se o formulário foi submetido
                    if (request.getMethod().equalsIgnoreCase("post")) {
                        try {
                            // Obtém os dados do formulário
                            Long agendaId = Long.parseLong(request.getParameter("id"));

                            // Obtém a nova data do formulário e converte para LocalDateTime
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                            String novaDataString = request.getParameter("novaData");
                            LocalDateTime novaData = LocalDateTime.parse(novaDataString, formatter);

                            AgendaDAO agendaDAO = new AgendaDAO();

                            Agenda agenda = agendaDAO.buscarAgendaPorId(agendaId);

                            agenda.setData(novaData);

                            agendaDAO.atualizarDataAgenda(agenda);

                            // Imprime a mensagem de sucesso
                %>
                            <div class="alert alert-success" role="alert">
                                Reagendado com sucesso
                            </div>
                <%
                        } catch (Exception e) {
                            // Imprime a mensagem de erro
                %>
                            <div class="alert alert-danger" role="alert">
                                Erro: <%= e.getMessage() %>
                            </div>
                <%
                        }
                    }
                %>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js scripts (required for Bootstrap components) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
