<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="domain.model.Agenda"%>
<%@page import="domain.dao.AgendaDAO"%>
<%@page import="domain.model.Barbeiro"%>
<%@page import="domain.model.Cliente"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listagem de Agendas</title>
    <!-- Adiciona um pouco de estilo para melhorar a apresentação -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0
        }

        h2 {
            color: #333; /* Cor escura para o título */
            margin-top: 4em;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
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
            color: #007bff; /* Cor azul para os links */
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
            <h1 class="text-white">BARBERTECH</h1>
        </header>
<%
    AgendaDAO agendaDAO = new AgendaDAO();
    String cpf = request.getParameter("cpf");
    List<Agenda> agendas = agendaDAO.buscarAgendasPorCpfBarbeiro(cpf);
%>

<% if (agendas != null && !agendas.isEmpty()) { %>
    <h2>Agenda de <%= agendas.get(0).getCliente().getNome() %> </h2>
    <table border="1">
        <thead>
            <tr>
                <th>Barbeiro</th>
                <th>Valor</th>
                <th>Tipo de Corte</th>
                <th>Data</th>
                <th>Remarcar</th>
                <th>Cancelar</th>
            </tr>
        </thead>
        <tbody>
            <% DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"); %>
            <% NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("pt", "BR")); %>
            <% for (Agenda agenda : agendas) { %>
                <tr>
                    <td><%= agenda.getBarbeiro().getNome()%></td>
                    <td><%= currencyFormatter.format(agenda.getValor()) %></td>
                    <td><%= agenda.getTipoCorte()%></td>
                    <td><%= agenda.getData().format(formatter)%></td>
                    <td><a href="/BarberTech/atualizar/agenda/atualizar.jsp?id=<%= agenda.getId()%>">Remarcar</a></td>
                    <td><a href="/BarberTech/excluir/agenda/excluir.jsp?id=<%= agenda.getId()%>">Cancelar</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>
<% } else { %>
    <p>Nenhuma agenda encontrada.</p>
<% } %>

</body>
</html>
