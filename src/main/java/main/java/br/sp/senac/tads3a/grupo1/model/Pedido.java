package main.java.br.sp.senac.tads3a.grupo1.model;

/**
 * @author vitor.oliveira
 */
public class Pedido {

    private int pedido_id;
    private int fk_venda_id;
    private int produto_id;
    private double valor;
    private int qtd;

    public Pedido() {
    }

    public int getPedido_id() {
        return pedido_id;
    }

    public void setPedido_id(int pedido_id) {
        this.pedido_id = pedido_id;
    }

    public int getFk_venda_id() {
        return fk_venda_id;
    }

    public void setFk_venda_id(int fk_venda_id) {
        this.fk_venda_id = fk_venda_id;
    }

    public int getProduto_id() {
        return produto_id;
    }

    public void setProduto_id(int produto_id) {
        this.produto_id = produto_id;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

}
