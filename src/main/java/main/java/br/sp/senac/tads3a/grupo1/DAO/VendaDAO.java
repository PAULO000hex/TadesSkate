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
import main.java.br.sp.senac.tads3a.grupo1.model.Pedido;
import main.java.br.sp.senac.tads3a.grupo1.model.Venda;
import main.java.br.sp.senac.tads3a.grupo1.utils.Conexao;

public class VendaDAO {

    public static boolean Vender(Venda venda, int filial_id) {
        boolean ok = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            String query = "INSERT INTO venda(valor_total,data,funcionario_id,cliente_id,filial_id)VALUES(?,?,?,?,?)";
            con = Conexao.getConexao();
            ps = con.prepareStatement(query);
            ps.setDouble(1, venda.getValor_total());
            ps.setDate(2, venda.getData());
            ps.setInt(3, venda.getFk_funcionario_id());
            ps.setInt(4, venda.getFk_cliente_id());
            ps.setInt(5, filial_id);

            int linhasAfetadas = ps.executeUpdate();

            if (linhasAfetadas > 0) {
                ok = true;

                ResultSet chavesGeradas = ps.getGeneratedKeys();
                if (chavesGeradas.next()) {
                    venda.setVenda_id(chavesGeradas.getInt(1));

//                    for (Pedido pedido : venda.getPedido()) {
//
//                        PreparedStatement psPedido = con.prepareStatement("INSERT INTO pedido(produto_id,venda_id,filial_id,quantidade,valor_unitario)VALUES(?,?,?,?,?)");
//
//                        psPedido.setInt(1, pedido.getProduto_id());
//                        psPedido.setInt(2, venda.getVenda_id());
//                        psPedido.setInt(3, filial_id);
//                        psPedido.setInt(4, pedido.getQtd());
//                        psPedido.setDouble(5, pedido.getValor());
//
//                        int itensAfetados = psPedido.executeUpdate();
//                        if (itensAfetados < 0) {
//                            throw new SQLException("Falha ao registrar a venda !");
//                        }
//                    }
                } else {
                    throw new SQLException("Falha ao obter o ID da venda!.");
                }
            }
        } catch (Exception e) {

        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(VendaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return ok;
    }
}
