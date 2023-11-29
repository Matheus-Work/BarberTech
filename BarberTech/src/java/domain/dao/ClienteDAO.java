package domain.dao;

import domain.model.Cliente;
import util.ConnectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    private final Connection connection;

    public ClienteDAO() {
        this.connection = ConnectDAO.conectar();
    }

    public void adicionarCliente(Cliente cliente) {
        String sql = "INSERT INTO clientes (nome, cpf, telefone, email, senha) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, cliente.getNome());
            statement.setString(2, cliente.getCpf());
            statement.setString(3, cliente.getTelefone());
            statement.setString(4, cliente.getEmail());
            statement.setString(5, cliente.getSenha());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Cliente buscarClientePorId(Long id) {
        String sql = "SELECT * FROM clientes WHERE id = ?";
        Cliente cliente = null;

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                cliente = new Cliente(
                        resultSet.getLong("id"),
                        resultSet.getString("nome"),
                        resultSet.getString("cpf"),
                        resultSet.getString("telefone"),
                        resultSet.getString("email"),
                        resultSet.getString("senha")
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return cliente;
    }

    public List<Cliente> listarClientes() {
        String sql = "SELECT * FROM clientes";
        List<Cliente> clientes = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Cliente cliente = new Cliente(
                        resultSet.getLong("id"),
                        resultSet.getString("nome"),
                        resultSet.getString("cpf"),
                        resultSet.getString("telefone"),
                        resultSet.getString("email"),
                        resultSet.getString("senha")
                );
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return clientes;
    }

    public void atualizarCliente(Cliente cliente) {
        String sql = "UPDATE clientes SET nome = ?, cpf = ?, telefone = ?, email = ?, senha = ? WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, cliente.getNome());
            statement.setString(2, cliente.getCpf());
            statement.setString(3, cliente.getTelefone());
            statement.setString(4, cliente.getEmail());
            statement.setString(5, cliente.getSenha());
            statement.setLong(6, cliente.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void excluirCliente(Long id) {
        String sql = "DELETE FROM clientes WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public Cliente buscarClientePorCPF(String cpf) {
    String sql = "SELECT * FROM clientes WHERE cpf = ?";
    Cliente cliente = null;

    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, cpf);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            cliente = new Cliente(
                    resultSet.getLong("id"),
                    resultSet.getString("nome"),
                    resultSet.getString("cpf"),
                    resultSet.getString("telefone"),
                    resultSet.getString("email"),
                    resultSet.getString("senha")
            );
        }
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }

    return cliente;
}
}
