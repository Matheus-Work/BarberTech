<%@page import="domain.dao.AgendaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="domain.model.Agenda"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Reagendar Agenda</title>
    <!-- Inclua os links para os arquivos do Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
</style>
<body>
    <header class="bg-primary text-white text-center py-3">
            <a href="/BarberTech/menu_cliente.html">
                <img src="/BarberTech/images/voltar.png" alt="voltar" class="botao-voltar"/>
            </a>
            <h1>BARBERTECH</h1>
        </header>
    <div class="container">
        <h1 class="mt-4">Reagendar Agenda</h1>

        <%
            // Obtém o objeto Agenda da solicitação
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                Long id = Long.parseLong(idParam);
                AgendaDAO agendaDAO = new AgendaDAO();
                Agenda agenda = agendaDAO.buscarAgendaPorId(id);

                // Se a agenda existir
                if (agenda != null) {
        %>

        <form action="reagendar.jsp" method="post">
            <input type="hidden" name="id" value="<%= agenda.getId() %>">

            <!-- Barbeiro -->
            <div class="form-group">
                <label>Barbeiro:</label>
                <input type="text" class="form-control" value="<%= agenda.getBarbeiro().getNome() %>" readonly>
            </div>

            <!-- Cliente -->
            <div class="form-group">
                <label>Cliente:</label>
                <input type="text" class="form-control" value="<%= agenda.getCliente().getNome() %>" readonly>
            </div>

            <!-- Valor -->
            <div class="form-group">
                <label>Valor:</label>
                <input type="text" class="form-control" value="<%= agenda.getValor() %>" readonly>
            </div>

            <!-- Tipo de Corte -->
            <div class="form-group">
                <label>Tipo de Corte:</label>
                <input type="text" class="form-control" value="<%= agenda.getTipoCorte() %>" readonly>
            </div>

            <!-- Data -->
            <div class="form-group">
                <label>Data:</label>
                <input type="datetime-local" class="form-control" name="novaData" value="<%= agenda.getData().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")) %>">
            </div>

            <!-- Botão de envio -->
            <button type="submit" class="btn btn-primary">Reagendar</button>
        </form>

        <%
            } else {
        %>
            <p class="text-danger">Agenda não encontrada.</p>
        <%
            }
        } else {
        %>
            <p class="text-danger">ID não fornecido.</p>
        <%
        }
        %>
    </div>
</body>
</html>
