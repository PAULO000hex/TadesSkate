package main.java.br.sp.senac.tads3a.grupo1.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import main.java.br.sp.senac.tads3a.grupo1.model.Pedido;
import main.java.br.sp.senac.tads3a.grupo1.model.Venda;
import main.java.br.sp.senac.tads3a.grupo1.utils.Conexao;

public class VendaDAO {
    public static boolean Vender(Venda venda) {

        boolean ok = false;

        Connection con;
        PreparedStatement ps = null;

        try {
            String query = "INSERT INTO venda (valor_total,data,fk_funcionario_id,fk_cliente_id,fk_filial_id) "
                    + " VALUES "
                    + " (?, CURRENT_TIMESTAMP, ?,?,?) ";

            con = Conexao.getConexao();
            ps = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setDouble(1, venda.getValor_total());
            ps.setInt(2, venda.getFk_funcionario_id());
            ps.setInt(3, venda.getFk_cliente_id());
            ps.setInt(4, venda.getFk_filial_id());

            int linhasAfetadas = ps.executeUpdate();

            if (linhasAfetadas > 0) {
                ResultSet chavesGeradas = ps.getGeneratedKeys();

                if (chavesGeradas.next()) {

                    venda.setVenda_id(chavesGeradas.getInt(1));

                    for (Pedido item : venda.getPedido()) {
                        int i = 0;
                        System.out.println("/*/*/*/*/*/*/*/*/*/*/*/*/*/*//*/*/*/*/*");
                        System.out.println(i);
                        System.out.println("/*/*/*/*/*/*/*/*/*/*/*/*/*/*//*/*/*/*/*");

                        String pedidoQuery = "INSERT INTO pedido (fk_produto_id, fk_venda_id, fk_filial_id,qtd,valor_unitario) "
                                + " VALUES "
                                + " (?,?,?,?,?)";

                        PreparedStatement psPedido = con.prepareStatement(pedidoQuery);

                        psPedido.setInt(1, item.getProduto_id());
                        psPedido.setInt(2, venda.getVenda_id());
                        psPedido.setInt(3, venda.getFk_filial_id());
                        psPedido.setInt(4, item.getQtd());
                        psPedido.setDouble(5, item.getValor());

                        psPedido.executeUpdate();
                    }
                    ok = true;
                }
            } else {
                ok = false;
                throw new SQLException("Falha ao registrar a venda !");
            }
        } catch (SQLException e) {
            System.out.println(e);
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
