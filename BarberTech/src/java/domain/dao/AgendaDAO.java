package domain.dao;

import domain.model.Agenda;
import domain.model.Barbeiro;
import domain.model.Cliente;
import domain.model.TipoCorte;
import util.ConnectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class AgendaDAO {

    private final Connection connection;

    public AgendaDAO() {
        this.connection = ConnectDAO.conectar();
    }

    public void adicionarAgenda(Agenda agenda) {
        String sql = "INSERT INTO agendas (barbeiro_id, cliente_id, valor, tipo_corte, data) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, agenda.getBarbeiro().getId());
            statement.setLong(2, agenda.getCliente().getId());
            statement.setDouble(3, agenda.getValor());
            statement.setString(4, agenda.getTipoCorte().name());
            statement.setObject(5, agenda.getData());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Agenda buscarAgendaPorId(Long id) {
        String sql = "SELECT * FROM agendas WHERE id = ?";
        Agenda agenda = null;

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                Barbeiro barbeiro = new BarbeiroDAO().buscarBarbeiroPorId(resultSet.getLong("barbeiro_id"));
                Cliente cliente = new ClienteDAO().buscarClientePorId(resultSet.getLong("cliente_id"));

                agenda = new Agenda(
                        resultSet.getLong("id"),
                        barbeiro,
                        cliente,
                        resultSet.getDouble("valor"),
                        TipoCorte.valueOf(resultSet.getString("tipo_corte")),
                        resultSet.getObject("data", LocalDateTime.class)
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return agenda;
    }

    public List<Agenda> listarAgendas() {
        String sql = "SELECT * FROM agendas";
        List<Agenda> agendas = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Barbeiro barbeiro = new BarbeiroDAO().buscarBarbeiroPorId(resultSet.getLong("barbeiro_id"));
                Cliente cliente = new ClienteDAO().buscarClientePorId(resultSet.getLong("cliente_id"));

                Agenda agenda = new Agenda(
                        resultSet.getLong("id"),
                        barbeiro,
                        cliente,
                        resultSet.getDouble("valor"),
                        TipoCorte.valueOf(resultSet.getString("tipo_corte")),
                        resultSet.getObject("data", LocalDateTime.class)
                );
                agendas.add(agenda);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return agendas;
    }

// Update only the date
    public void atualizarDataAgenda(Agenda agenda) {
        String sql = "UPDATE agendas SET data = ? WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setObject(1, agenda.getData());
            statement.setLong(2, agenda.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void excluirAgenda(Long id) {
        String sql = "DELETE FROM agendas WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Agenda> buscarAgendasPorCpfCliente(String cpf) {
        String sql = "SELECT * FROM agendas "
                + "INNER JOIN clientes ON agendas.cliente_id = clientes.id "
                + "WHERE clientes.cpf = ?";
        List<Agenda> agendas = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, cpf);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Barbeiro barbeiro = new BarbeiroDAO().buscarBarbeiroPorId(resultSet.getLong("barbeiro_id"));
                Cliente cliente = new ClienteDAO().buscarClientePorId(resultSet.getLong("cliente_id"));

                Agenda agenda = new Agenda(
                        resultSet.getLong("id"),
                        barbeiro,
                        cliente,
                        resultSet.getDouble("valor"),
                        TipoCorte.valueOf(resultSet.getString("tipo_corte")),
                        resultSet.getObject("data", LocalDateTime.class)
                );
                agendas.add(agenda);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return agendas;
    }

    public List<Agenda> buscarAgendasPorCpfBarbeiro(String cpf) {
        String sql = "SELECT * FROM agendas "
                + "INNER JOIN barbeiros ON agendas.barbeiro_id = barbeiros.id "
                + "WHERE barbeiros.cpf = ?";
        List<Agenda> agendas = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, cpf);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Barbeiro barbeiro = new BarbeiroDAO().buscarBarbeiroPorId(resultSet.getLong("barbeiro_id"));
                Cliente cliente = new ClienteDAO().buscarClientePorId(resultSet.getLong("cliente_id"));

                Agenda agenda = new Agenda(
                        resultSet.getLong("id"),
                        barbeiro,
                        cliente,
                        resultSet.getDouble("valor"),
                        TipoCorte.valueOf(resultSet.getString("tipo_corte")),
                        resultSet.getObject("data", LocalDateTime.class)
                );
                agendas.add(agenda);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return agendas;
    }

}
