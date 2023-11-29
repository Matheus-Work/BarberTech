<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro nova conta</title>
        <!-- Adiciona os links para os arquivos do Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            margin-top:4em;
        }
    </style>
    <body class="bg-light">
        <header class="bg-primary text-white text-center py-3">
            <a href="/BarberTech/index.html">
                <img src="/BarberTech/images/voltar.png" alt="voltar" class="botao-voltar"/>
            </a>
            <h1>BARBERTECH</h1>
        </header>
        <div class="container mt-5">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Cadastro</h2>

                        <form action="realizar_cadastro.jsp" method="post">
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="senha">Senha:</label>
                                <input type="password" id="senha" name="senha" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="nome">Nome:</label>
                                <input type="text" id="nome" name="nome" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="cpf">CPF:</label>
                                <input type="text" id="cpf" name="cpf" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="telefone">Telefone:</label>
                                <input type="text" id="telefone" name="telefone" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="tipo-cadastro">Escolha o tipo:</label>
                                <select id="tipo-cadastro" name="tipo-cadastro" class="form-control" required>
                                    <option value="barbeiro">Barbeiro</option>
                                    <option value="cliente">Cliente</option>
                                </select>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Cadastrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Adiciona os scripts do Bootstrap (jQuery e Popper.js são necessários para alguns recursos do Bootstrap) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
