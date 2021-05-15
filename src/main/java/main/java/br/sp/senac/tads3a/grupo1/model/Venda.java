package main.java.br.sp.senac.tads3a.grupo1.model;

import java.sql.Date;
import java.util.ArrayList;

/**
 * @author vitor.oliveira
 */
public class Venda {

    private int venda_id;
    private int fk_funcionario_id;
    private int fk_cliente_id;
    private Date data;
    private double valor_total;   
    private ArrayList<Pedido> pedido;


    public Venda(int venda_id, int fk_funcionario_id, int fk_cliente_id, double valor_total, ArrayList<Pedido> pedido) {
        this.venda_id = venda_id;
        this.fk_funcionario_id = fk_funcionario_id;
        this.fk_cliente_id = fk_cliente_id;
        this.valor_total = valor_total;
        this.pedido = pedido;
    }
    


    public int getVenda_id() {
        return venda_id;
    }

    public void setVenda_id(int venda_id) {
        this.venda_id = venda_id;
    }

    public int getFk_funcionario_id() {
        return fk_funcionario_id;
    }

    public void setFk_funcionario_id(int fk_funcionario_id) {
        this.fk_funcionario_id = fk_funcionario_id;
    }

    public int getFk_cliente_id() {
        return fk_cliente_id;
    }

    public void setFk_cliente_id(int fk_cliente_id) {
        this.fk_cliente_id = fk_cliente_id;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public double getValor_total() {
        return valor_total;
    }

    public void setValor_total(double valor_total) {
        this.valor_total = valor_total;
    }

    public ArrayList<Pedido> getPedido() {
        return pedido;
    }

    public void setPedido(ArrayList<Pedido> pedido) {
        this.pedido = pedido;
    }
}
