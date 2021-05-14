
package main.java.br.sp.senac.tads3a.grupo1.model;
import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
/**
 * @author vitor.oliveira
 */
public class Funcionario {

    private int funcionario_id;
    private String nome;
    private String sobrenome;
    private String CPF;
    private String email;
    private String telefone;
    private Date nascimento;
    private String departamento;
    private float salario;
    private String endereco;
    private String bairro;
    private String cidade;
    private String estado;

    public Funcionario(int funcionario_id, String nome, String sobrenome, String CPF, String email, String telefone, Date nascimento, String departamento, float salario, String endereco, String bairro, String cidade, String estado) {
        this.funcionario_id = funcionario_id;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.CPF = CPF;
        this.email = email;
        this.telefone = telefone;
        this.nascimento = nascimento;
        this.departamento = departamento;
        this.salario = salario;
        this.endereco = endereco;
        this.bairro = bairro;
        this.cidade = cidade;
        this.estado = estado;
        
    }
    
    @Override
    public String toString() {
      return String.format("Nome: %s <br/> Sobrenome: %s <br/> CPF: %s <br/> Email: %s <br/> Data de nascimento: %s <br/> Departamento: %s <br/>"
 + "Salário: %d <br/> Endereço: %s <br/> Bairro: %s <br/> Cidade: %s <br/> Estado: %s <br/>", nome, sobrenome, CPF, email, telefone, nascimento, departamento, salario, endereco, bairro, cidade, estado); 

}

    
    
    
    
}
