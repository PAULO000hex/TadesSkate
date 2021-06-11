/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.java.br.sp.senac.tads3a.grupo1.DAO.VendaDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Pedido;
import main.java.br.sp.senac.tads3a.grupo1.model.Venda;

public class VenderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int funcionario_id = Integer.parseInt(request.getParameter("funcionario_id"));
        int cliente_id = Integer.parseInt(request.getParameter("fk_cliente_id"));
        float total = Float.parseFloat(request.getParameter("valor_total"));
        int fk_filial_id = Integer.parseInt(request.getParameter("filial_id"));

        String[] produtos = request.getParameterValues("produto_id");;
        String[] qtd = request.getParameterValues("qtd");
        String[] valor_un = request.getParameterValues("valor_un");
        String[] tabela = request.getParameterValues("tb-produtos");

        System.out.println(Arrays.toString(tabela));

        ArrayList<Pedido> itens = new ArrayList<>();
        for (int i = 0; i < produtos.length; i++) {
            Pedido pedido = new Pedido();
            pedido.setProduto_id(Integer.parseInt(produtos[i]));
            pedido.setQtd(Integer.parseInt(qtd[i]));
            pedido.setValor(Double.parseDouble(valor_un[i]));
            itens.add(pedido);
        }

        Venda venda = new Venda(-1, funcionario_id, cliente_id, total, fk_filial_id, itens);

        boolean vamover = VendaDAO.Vender(venda);

        if (vamover) {
            response.sendRedirect("../sucesso.jsp");
        } else {
            response.sendRedirect("../erro.jsp");
        }
    }

}
