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
import main.java.br.sp.senac.tads3a.grupo1.model.Relatorio;
import main.java.br.sp.senac.tads3a.grupo1.utils.Conexao;

public class RelatorioDAO {

    public static List<Relatorio> getVendas(String dataInicio, String dataFim, int filial_id) {
        List<Relatorio> relatorios = new ArrayList<>();
        String query = "SELECT venda_id, c.nome, valor_total, data, f.nome"
                + "FROM Venda p"
                + "INNER JOIN Funcionario c ON c.funcionario_id = p.fk_funcionario_id"
                + "INNER JOIN Cliente f ON f.cliente_id = p.fk_cliente_id"
                + "WHERE p.data BETWEEN ? AND ? AND p.fk_filial_id = ?";
        Connection con;
        try {
            con = Conexao.getConexao();
            System.out.println(con);
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, dataInicio);
            ps.setString(2, dataFim);
            ps.setInt(3, filial_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int venda_id = rs.getInt("venda_id");
                String nome_vendedor = rs.getString("nome");
                float valor_total = rs.getFloat("valor_total");
                String data = rs.getString("data");
                String nome_cliente = rs.getString("nome");
                Relatorio relatorio = new Relatorio(venda_id, nome_vendedor, valor_total, data, nome_cliente);
                relatorios.add(relatorio);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RelatorioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        System.out.println(relatorios);
        return relatorios;
    }

    public static List<Relatorio> getProdutosMaisVendidos(String dataInicio, String dataFim, int filial_id) {
        List<Relatorio> relatorios = new ArrayList<>();
        String query = "SELECT c.produto_id, c.descricao, COUNT(p.fk_produto_id) AS QtdCompra, SUM(p.valor_unitario) AS Total FROM Pedido p INNER JOIN Produto c ON c.produto_id = p.fk_produto_id WHERE p.data BETWEEN ? AND ? AND p.fk_filial_id = ? GROUP BY c.produto_id, c.descricao ORDER BY Total DESC";
        Connection con;
        try {
            con = Conexao.getConexao();
            System.out.println(con);
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, dataInicio);
            ps.setString(2, dataFim);
            ps.setInt(3, filial_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int produto_id = rs.getInt("produto_id");
                String descricao = rs.getString("descricao");
                int qtdcompra = rs.getInt("QtdCompra");
                float total = rs.getFloat("Total");
                Relatorio relatorio = new Relatorio(produto_id, descricao, qtdcompra, total);
                relatorios.add(relatorio);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RelatorioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        System.out.println(relatorios);
        return relatorios;
    }

    public static List<Relatorio> getFiliais() {
        List<Relatorio> relatorios = new ArrayList<>();
        String query = "SELECT filial_id, endereco FROM filial";
        Connection con;
        try {
            con = Conexao.getConexao();
            System.out.println(con);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int filial_id = rs.getInt("filial_id");
                String endereco = rs.getString("endereco");
                Relatorio relatorio = new Relatorio(filial_id, endereco);
                relatorios.add(relatorio);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RelatorioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        System.out.println(relatorios);
        return relatorios;
    }

}
