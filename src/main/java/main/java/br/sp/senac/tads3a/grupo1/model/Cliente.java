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

public class Cliente {

    private int cliente_id;
    private String nome;
    private String sobrenome;
    private String cpf;
    private String email;
    private String telefone;
    private String endereco;
    private String cidade;
    private String estado;
    private String bairro;
    private Date nascimento;
    public Cliente(int cliente_id, String nome, String sobrenome, String cpf, String email, String telefone, String endereco, String cidade, String estado, String bairro,Date nascimento) {
        this.cliente_id = cliente_id;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.cpf = cpf;
        this.email = email;
        this.telefone = telefone;
        this.endereco = endereco;
        this.cidade = cidade;
        this.estado = estado;
        this.bairro = bairro;
        this.nascimento = nascimento;
      

    }

    @Override
    public String toString() {
        return String.format("Nome: %s <br/> Sobrenome: %s <br/> CPF: %s <br/> Email: %s <br/> Telefone %s <br/> "
                + "Endereco: %s <br/> Cidade: %s <br/> Estado: %s <br/> Bairro: %s </br> Nascimento:%s ",
                nome, sobrenome, cpf, email, telefone, endereco, cidade, estado, bairro, nascimento);
    }

}
