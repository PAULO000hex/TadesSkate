/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import main.java.br.sp.senac.tads3a.grupo1.model.Cliente;
import main.java.br.sp.senac.tads3a.grupo1.utils.Conexao;

/**
 *
 * @author Administrador
 */
public class ClienteDAO {

    public static boolean DeletarCli(int id) {
        boolean ok = true;
        String query = "delete from cliente where cliente_id = ?";
        Connection con;
        try {
            con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

    public static boolean Cadastrar(Cliente cliente, Date nascimento) {
        boolean ok = true;
        String query = "insert into cliente (nome, sobrenome, cpf, email, telefone, endereco, cidade, estado, bairro, nascimento) "
                + "values(?,?,?,?,?,?,?,?,?,?)";
        try {
            Connection con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getSobrenome());
            ps.setString(3, cliente.getCpf());
            ps.setString(4, cliente.getEmail());
            ps.setString(5, cliente.getTelefone());
            ps.setString(6, cliente.getEndereco());
            ps.setString(7, cliente.getCidade());
            ps.setString(8, cliente.getEstado());
            ps.setString(9, cliente.getBairro());
            ps.setDate(10, nascimento);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;

    }

    public static List<Cliente> getClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String query = "select * from cliente";
        Connection con;
        try {
            con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("cliente_id");
                String nome = rs.getString("nome");
                String sobrenome = rs.getString("sobrenome");
                String cpf = rs.getString("cpf");
                String email = rs.getString("email");
                String telefone = rs.getString("telefone");
                String endereco = rs.getString("endereco");
                String cidade = rs.getString("cidade");
                String estado = rs.getString("estado");
                String bairro = rs.getString("bairro");
                Date nascimento = rs.getDate("nascimento");

                Cliente cliente = new Cliente(id, nome, sobrenome, cpf, email, telefone, endereco,
                        cidade, estado, bairro, nascimento);
                cliente.setNascimento(nascimento);
                clientes.add(cliente);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;
    }
    
            public static Cliente getCliente(int id){
       Cliente cliente = null;
       String query = "select * from cliente where cliente_id=?";
       Connection con;
       try{
          con = Conexao.getConexao();
          PreparedStatement ps = con.prepareStatement(query);
          ps.setInt(1, id);
          ResultSet rs = ps.executeQuery();
          
         if(rs.next()) {
             String nome = rs.getString("nome");
             String sobrenome = rs.getString("sobrenome");
             String cpf = rs.getString("cpf");
             String email = rs.getString("email");
             String telefone = rs.getString("telefone");
             String endereco = rs.getString("endereco");
             String cidade = rs.getString("cidade");
             String estado = rs.getString("estado");
             String bairro = rs.getString("bairro");
             Date nascimento = rs.getDate("nascimento");
       
         cliente = new Cliente(id ,nome,sobrenome,cpf,email,telefone,endereco,cidade,estado,bairro,nascimento);
}
}catch (SQLException ex){
        Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
}
 return cliente;
}
    
        public static boolean atualizarCliente(Cliente cliente){
    boolean ok = true;
    String query = "update cliente set nome=?,sobrenome=?,cpf=?,email=?,telefone=?,nascimento=?,endereco=?,cidade=?,bairro=?,estado=? where cliente_id=?";
    Connection con;
    try {
    con = Conexao.getConexao();
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, cliente.getNome());
    ps.setString(2, cliente.getSobrenome());
    ps.setString(3, cliente.getCpf());
    ps.setString(4, cliente.getEmail());
    ps.setString(5, cliente.getTelefone());
    ps.setDate(6, cliente.getNascimento());
    ps.setString(7, cliente.getEndereco());
    ps.setString(8, cliente.getCidade());
    ps.setString(9, cliente.getBairro());
    ps.setString(10, cliente.getEstado());
    ps.setInt(11, cliente.getCliente_id());
    ps.executeUpdate();
   }catch (SQLException ex){
    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
    ok = false;
}
return ok;
}
    

}
