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
import main.java.br.sp.senac.tads3a.grupo1.model.Produto;
import main.java.br.sp.senac.tads3a.grupo1.utils.Conexao;

/**
 *
 * @author Administrador
 */
public class ProdutoDAO {

    public static boolean DeletarPro(int id) {
        boolean ok = true;
        String query = "delete from produto where produto_id =?";
        Connection con;
        try {
            con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }

    public static boolean Cadastrar(Produto produto, int filial_id) {
        boolean ok = true;
        String query = "insert into produto (descricao, categoria, fabricante, valor, quantidade, desconto,fk_filial_id) "
                + "values(?,?,?,?,?,?,?)";
        try {
            Connection con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, produto.getDescricao());
            ps.setString(2, produto.getCategoria());
            ps.setString(3, produto.getFabricante());
            ps.setDouble(4, produto.getValor());
            ps.setInt(5, produto.getQuantidade());
            ps.setDouble(6, produto.getDesconto());
            ps.setInt(7, filial_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;

    }

    public static List<Produto> getProdutos() {
        List<Produto> produtos = new ArrayList<>();
        String query = "select * from produto";
        Connection con;
        try {
            con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("produto_id");
                String descricao = rs.getString("descricao");
                String categoria = rs.getString("categoria");
                String fabricante = rs.getString("fabricante");
                double valor = rs.getDouble("valor");
                int quantidade = rs.getInt("quantidade");
                double desconto = rs.getDouble("desconto");

                Produto produto  = new Produto(id,descricao, categoria, fabricante, valor, quantidade, desconto);
                produtos.add(produto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produtos;
    }

    public static Produto getProduto(int id){
       Produto produto = null;
       String query = "select * from produto where produto_id=?";
       Connection con;
       try{
          con = Conexao.getConexao();
          PreparedStatement ps = con.prepareStatement(query);
          ps.setInt(1, id);
          ResultSet rs = ps.executeQuery();
          
         if(rs.next()) {
         String descricao = rs.getString("descricao");
         String categoria = rs.getString("categoria");
         String fabricante = rs.getString("fabricante");
         double valor = rs.getDouble("valor");
         int quantidade = rs.getInt("quantidade");
         double desconto = rs.getDouble("desconto");
         produto = new Produto(id, descricao, categoria, fabricante, valor, quantidade, desconto);
}
}catch (SQLException ex){
        Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
}
 return produto;
}

   public static List<Produto> getProdutoVenda(String descricao){
    List<Produto> produtos = new ArrayList<>();
    String query = "select produto_id, descricao, valor from produto where descricao like ?";
    Connection con;
    try{
    con = Conexao.getConexao();
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, descricao);
   ResultSet rs = ps.executeQuery();

   while(rs.next()) {
   int id = rs.getInt("produto_id");
   double valor = rs.getDouble("valor");
Produto produto = new Produto(id, descricao, valor);
   produtos.add(produto);
  }
   }catch (SQLException ex){
     Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex); 
}
return produtos;

}

    public static boolean atualizar(Produto produto){
boolean ok = true;
String query = "update produto set descricao=?,categoria=?,fabricante=?,valor=?,quantidade=?,desconto=? where produto_id=?";
Connection con;
try {
con = Conexao.getConexao();
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1, produto.getDescricao());
ps.setString(2, produto.getCategoria());
ps.setString(3, produto.getFabricante());
ps.setDouble(4, produto.getValor());
ps.setInt(5, produto.getQuantidade());
ps.setDouble(6, produto.getDesconto());
ps.setInt(7, produto.getProduto_id());
ps.executeUpdate();
}catch (SQLException ex){
  Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
  ok = false;
}
return ok;
}
}
