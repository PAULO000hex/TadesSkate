package main.java.br.sp.senac.tads3a.grupo1.model;

import java.sql.Date;
import java.util.ArrayList;
import lombok.Getter;
import lombok.Setter;


/**
 * @author vitor.oliveira
 */

@Getter
@Setter

public class Venda {

    private int venda_id;
    private int fk_funcionario_id;
    private int fk_cliente_id;
    private Date data;
    private double valor_total;   
    private int fk_filial_id;
    
    private ArrayList<Pedido> pedido;

    public Venda(int venda_id, int fk_funcionario_id, int fk_cliente_id, double valor_total, int fk_filial_id, ArrayList<Pedido> pedido) {
        this.venda_id = venda_id;
        this.fk_funcionario_id = fk_funcionario_id;
        this.fk_cliente_id = fk_cliente_id;
        this.valor_total = valor_total;
        this.pedido = pedido;
        this.fk_filial_id = fk_filial_id;
    }
}
