
package main.java.br.sp.senac.tads3a.grupo1.model;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class Relatorio {

    private int filial_id;
    private String endereco;
    private int venda_id;
    private String nome_vendedor;
    private float valor_total;
    private String data;
    private String nome_cliente;
    private String descricao;
    private int produto_id;
    private int qtdcompra;
    private float total;
    
    public Relatorio(int venda_id, String nome_vendedor, float valor_total, String data, String nome_cliente) {
       this.venda_id = venda_id;
       this.nome_vendedor = nome_vendedor;
       this.valor_total = valor_total;
       this.data = data;
       this.nome_cliente = nome_cliente;
    }

    public Relatorio(int produto_id, String descricao, int qtdcompra, float total) {
        this.produto_id = produto_id;
        this.descricao = descricao;
        this.qtdcompra = qtdcompra;
        this.total = total;
    }

    public Relatorio(int filial_id, String endereco) {
      this.filial_id = filial_id;
      this.endereco = endereco;
    }

}
