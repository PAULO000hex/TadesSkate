/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import main.java.br.sp.senac.tads3a.grupo1.model.Filial;
import main.java.br.sp.senac.tads3a.grupo1.utils.Conexao;

/**
 *
 * @author Administrador
 */
public class FilialDAO {

    public static boolean DeletarFi(int id) {
        boolean ok = true;
        String query = "delete from filial where filial_id=?";
        Connection con;
        try {
            con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

public static boolean Cadastrar(Filial filial) {
        boolean ok = true;
        String query = "insert into filial (email, telefone, endereco, cidade, estado, bairro) "
                + "values(?,?,?,?,?,?)";
        try {
            Connection con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, filial.getEmail());
            ps.setString(2, filial.getTelefone());
            ps.setString(3, filial.getEndereco());
            ps.setString(4, filial.getCidade());
            ps.setString(5, filial.getEstado());
            ps.setString(6, filial.getBairro());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;

    }

    public static List<Filial> getFiliais() {
        List<Filial> filiais = new ArrayList<>();
        String query = "select * from filial";
        Connection con;
        try {
            con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("filial_id");
                String email = rs.getString("email");
                String telefone = rs.getString("telefone");
                String endereco = rs.getString("endereco");
                String cidade = rs.getString("cidade");
                String estado = rs.getString("estado");
                String bairro = rs.getString("bairro");

                Filial filial  = new Filial(id, email, telefone, endereco, cidade, estado, bairro);
                filiais.add(filial);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return filiais;
    }

    public static Filial getFilial(int id){
       Filial filial = null;
       String query = "select * from filial where filial_id=?";
       Connection con;
       try{
          con = Conexao.getConexao();
          PreparedStatement ps = con.prepareStatement(query);
          ps.setInt(1, id);
          ResultSet rs = ps.executeQuery();
          
         if(rs.next()) {
         String email = rs.getString("email");
         String telefone = rs.getString("telefone");
         String endereco = rs.getString("endereco");
         String cidade = rs.getString("cidade");
         String estado = rs.getString("estado");
         String bairro = rs.getString("bairro");
         filial = new Filial(id, email,telefone,endereco,cidade,estado,bairro);
}
}catch (SQLException ex){
        Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
}
 return filial;
}

    public static boolean atualizar(Filial filial){
boolean ok = true;
String query = "update filial set email=?,telefone=?,endereco=?,cidade=?,estado=?,bairro=? where filial_id=?";
Connection con;
try {
con = Conexao.getConexao();
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1, filial.getEmail());
ps.setString(2, filial.getTelefone());
ps.setString(3, filial.getEndereco());
ps.setString(4, filial.getCidade());
ps.setString(5, filial.getEstado());
ps.setString(6, filial.getBairro());
ps.setInt(7, filial.getFilial_id());
ps.executeUpdate();
}catch (SQLException ex){
  Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
  ok = false;
}
return ok;
}
}
