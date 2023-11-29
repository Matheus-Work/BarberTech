package domain.dao;

import domain.model.Barbeiro;
import domain.model.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.ConnectDAO;

public class LoginDAO {

    private final Connection connection;

    public LoginDAO() {
        this.connection = ConnectDAO.conectar();
    }

    public Object verificarLogin(String email, String senha) {
        // Verifica na tabela clientes
        String clienteSql = "SELECT * FROM clientes WHERE email = ? AND senha = ?";
        // Verifica na tabela barbeiros
        String barbeiroSql = "SELECT * FROM barbeiros WHERE email = ? AND senha = ?";

        try (PreparedStatement clienteStatement = connection.prepareStatement(clienteSql);
             PreparedStatement barbeiroStatement = connection.prepareStatement(barbeiroSql)) {

            clienteStatement.setString(1, email);
            clienteStatement.setString(2, senha);

            barbeiroStatement.setString(1, email);
            barbeiroStatement.setString(2, senha);

            ResultSet clienteResultSet = clienteStatement.executeQuery();
            ResultSet barbeiroResultSet = barbeiroStatement.executeQuery();

            if (clienteResultSet.next()) {
                // Se encontrou um cliente, retorna um objeto Cliente com os dados
                return new Cliente(
                        clienteResultSet.getLong("id"),
                        clienteResultSet.getString("nome"),
                        clienteResultSet.getString("cpf"),
                        clienteResultSet.getString("telefone"),
                        clienteResultSet.getString("email"),
                        clienteResultSet.getString("senha")
                );
            } else if (barbeiroResultSet.next()) {
                // Se encontrou um barbeiro, retorna um objeto Barbeiro com os dados
                return new Barbeiro(
                        barbeiroResultSet.getLong("id"),
                        barbeiroResultSet.getString("nome"),
                        barbeiroResultSet.getString("cpf"),
                        barbeiroResultSet.getString("telefone"),
                        barbeiroResultSet.getString("email"),
                        barbeiroResultSet.getString("senha")
                );
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return null; // Retorna null se não encontrar cliente ou barbeiro
    }
}
