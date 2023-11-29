<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Solicitar CPF do Cliente</title>
        <!-- Adiciona os links para os arquivos do Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                margin: 0; /* Remover margens padrão do corpo */
                background-color: #f8f9fa; /* Fundo sutil */
            }

            form {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
            }

            h2 {
                color: #007bff; /* Cor azul para o título */
            }

            input[type="text"] {
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
            }

            input[type="submit"]:hover {
                background-color: #0056b3; /* Cor mais escura ao passar o mouse */
            }

            small {
                color: #6c757d; /* Cor cinza para a informação pequena */
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
            String valor = request.getParameter("valor");
            if ("agendar".equals(valor)) {
        %>

        <form action="/BarberTech/cadastro/agenda/cadastrar.jsp" method="post">
            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" placeholder="Digite o CPF (apenas números)">
            <small>Formato: 12345678901</small><br>

            <input type="submit" value="Enviar">
        </form>

        <%
        } else if ("listar".equals(valor)) {
        %>

        <form action="/BarberTech/listar/agenda/listagem.jsp" method="post">
            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" required placeholder="Digite o CPF (apenas números)">
            <small>Formato: 12345678901</small><br>

            <input type="submit" value="Enviar">
        </form>

        <%
            }
        %>

        <!-- Adiciona os scripts do Bootstrap (jQuery e Popper.js são necessários para alguns recursos do Bootstrap) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
