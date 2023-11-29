<%@ page import="domain.model.Cliente" %>
<%@ page import="domain.model.Barbeiro" %>
<%@ page import="domain.dao.LoginDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
    // Verifica se o formulário foi submetido
    if (request.getMethod().equalsIgnoreCase("post")) {
        String email = request.getParameter("email");
        String senha = request.getParameter("password");

        LoginDAO loginDAO = new LoginDAO();
        Object usuario = loginDAO.verificarLogin(email, senha);

        if (usuario instanceof Cliente) {
             response.sendRedirect("/BarberTech/menu_cliente.html");
        } else if (usuario instanceof Barbeiro) {
            response.sendRedirect("/BarberTech/menu_barbeiro.html");
        } else {
            response.sendRedirect("/Barbertech/index.html");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Verificação de Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            .login-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }

            input {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                box-sizing: border-box;
            }

            button {
                background-color: #4caf50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button:hover {
                background-color: #45a049;
            }

            .error-message {
                color: red;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Verificação de Login</h2>
            <form action="verifica_login.jsp" method="post">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Senha:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Verificar Login</button>
            </form>

            <%
                if ("true".equals(request.getParameter("erro"))) {
            %>
            <p class="error-message">Login ou senha incorretos. Tente novamente.</p>
            <%
                }
            %>
        </div>
    </body>
</html>
