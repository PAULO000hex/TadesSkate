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

public class Filial {

    private int filial_id;
    private String endereco;
    private String cidade;
    private String estado;
    private String telefone;
    private String email;
    private String bairro;

    public Filial(int filial_id, String email, String telefone, String endereco, String cidade, String estado, String bairro) {
        this.filial_id = filial_id;
        this.email = email;
        this.telefone = telefone;
        this.endereco = endereco;
        this.cidade = cidade;
        this.estado = estado;
        this.bairro = bairro;

    }

    @Override
    public String toString() {
        return String.format("Email: %s <br/> Telefone: %s <br/> Endereço: %s <br/> Cidade: %s <br/> Estado: %s <br/> Bairro: %s <br/>", email, telefone, endereco, cidade, estado, bairro);
               
    }

}
