/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package domain.model;

import java.time.LocalDateTime;

/**
 *
 * @author alunos
 */
public class Agenda {
    
    private Long id;
    private Barbeiro barbeiro;
    private Cliente cliente;
    private Double valor;
    private TipoCorte tipoCorte;
    private LocalDateTime data;

    public Agenda(Long id, Barbeiro barbeiro, Cliente cliente, Double valor, TipoCorte tipoCorte, LocalDateTime data) {
        this.id = id;
        this.barbeiro = barbeiro;
        this.cliente = cliente;
        this.valor = valor;
        this.tipoCorte = tipoCorte;
        this.data = data;
    }

    public Agenda(Barbeiro barbeiro, Cliente cliente, Double valor, TipoCorte tipoCorte, LocalDateTime data) {
        this.barbeiro = barbeiro;
        this.cliente = cliente;
        this.valor = valor;
        this.tipoCorte = tipoCorte;
        this.data = data;
    }

    public Barbeiro getBarbeiro() {
        return barbeiro;
    }

    public void setBarbeiro(Barbeiro barbeiro) {
        this.barbeiro = barbeiro;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
  

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Enum getTipoCorte() {
        return tipoCorte;
    }

    public void setTipoCorte(TipoCorte tipoCorte) {
        this.tipoCorte = tipoCorte;
    }

    public LocalDateTime getData() {
        return data;
    }

    public void setData(LocalDateTime data) {
        this.data = data;
    }

    
    
}
