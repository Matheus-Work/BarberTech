<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="domain.model.Agenda"%>
<%@page import="domain.dao.AgendaDAO"%>
<%@page import="domain.model.Barbeiro"%>
<%@page import="domain.model.Cliente"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Agendas</title>
    </head>
    <body>
        <h1>Listagem de Agendas</h1>

        <%
        List<Agenda> agendas = new AgendaDAO().listarAgendas();
        if (agendas != null && !agendas.isEmpty()) { %>

        <table border="1">
            <thead>
                <tr>
                    <th>Barbeiro</th>
                    <th>Cliente</th>
                    <th>Valor</th>
                    <th>Tipo de Corte</th>
                    <th>Data</th>
                </tr>
            </thead>
            <tbody>
                <%-- Itera sobre a lista de agendas --%>
                <% for (Agenda agenda : agendas) {%>
                <tr>
                    <td><%= agenda.getBarbeiro().getNome()%></td>
                    <td><%= agenda.getValor()%></td>
                    <td><%= agenda.getTipoCorte()%></td>
                    <td><%= agenda.getData()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% } else { %>
        <p>Nenhuma agenda encontrada.</p>
        <% }%>

    </body>
</html>
