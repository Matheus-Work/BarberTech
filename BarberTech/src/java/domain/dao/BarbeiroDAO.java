package domain.dao;

import domain.model.Barbeiro;
import util.ConnectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BarbeiroDAO {

    private final Connection connection;

    public BarbeiroDAO() {
        this.connection = ConnectDAO.conectar();
    }

    public void adicionarBarbeiro(Barbeiro barbeiro) {
        String sql = "INSERT INTO barbeiros (nome, cpf, telefone, email, senha) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, barbeiro.getNome());
            statement.setString(2, barbeiro.getCpf());
            statement.setString(3, barbeiro.getTelefone());
            statement.setString(4, barbeiro.getEmail());
            statement.setString(5, barbeiro.getSenha());
            statement.executeUpdate();
        } catch (SQLException e) {
             System.out.println(e.getMessage());
        }
    }

    public Barbeiro buscarBarbeiroPorId(Long id) {
        String sql = "SELECT * FROM barbeiros WHERE id = ?";
        Barbeiro barbeiro = null;

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                barbeiro = new Barbeiro(
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

        return barbeiro;
    }

    public List<Barbeiro> listarBarbeiros() {
        String sql = "SELECT * FROM barbeiros";
        List<Barbeiro> barbeiros = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Barbeiro barbeiro = new Barbeiro(
                        resultSet.getLong("id"),
                        resultSet.getString("nome"),
                        resultSet.getString("cpf"),
                        resultSet.getString("telefone"),
                        resultSet.getString("email"),
                        resultSet.getString("senha")
                );
                barbeiros.add(barbeiro);
            }
        } catch (SQLException e) {
             System.out.println(e.getMessage());
        }

        return barbeiros;
    }

    public void atualizarBarbeiro(Barbeiro barbeiro) {
        String sql = "UPDATE barbeiros SET nome = ?, cpf = ?, telefone = ?, email = ?, senha = ? WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, barbeiro.getNome());
            statement.setString(2, barbeiro.getCpf());
            statement.setString(3, barbeiro.getTelefone());
            statement.setString(4, barbeiro.getEmail());
            statement.setString(5, barbeiro.getSenha());
            statement.setLong(6, barbeiro.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void excluirBarbeiro(Long id) {
        String sql = "DELETE FROM barbeiros WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
