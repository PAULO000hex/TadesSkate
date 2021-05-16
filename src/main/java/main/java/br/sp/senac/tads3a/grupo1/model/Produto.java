/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.model;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;
import main.java.br.sp.senac.tads3a.grupo1.utils.Conexao;

@Getter
@Setter

public class Produto {

    private int produto_id;
    private String descricao;
    private String categoria;
    private String fabricante;
    private double valor;
    private int quantidade;
    private double desconto;

public Produto(int produto_id, String descricao, double valor){
this.produto_id = produto_id;
this.descricao = descricao;
this.valor = valor;
}

    public Produto(int produto_id, String descricao, String categoria, String fabricante, double valor, int quantidade, double desconto) {
        this.produto_id = produto_id;
        this.descricao = descricao;
        this.categoria = categoria;
        this.fabricante = fabricante;
        this.valor = valor;
        this.quantidade = quantidade;
        this.desconto = desconto;

    }

   @Override
    public String toString() {
        return String.format("Descrição: %s <br/> Categoria: %s <br/> Fabricante: %s <br/> Valor: %d <br/> Quantidade %i <br/> "
               + "Desconto: %d",
                descricao, categoria, fabricante, valor, quantidade, desconto);
   }

}
