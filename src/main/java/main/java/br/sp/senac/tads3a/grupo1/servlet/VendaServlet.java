/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.java.br.sp.senac.tads3a.grupo1.DAO.VendaDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Pedido;
import main.java.br.sp.senac.tads3a.grupo1.model.Venda;

/**
 *
 * @author Gabriel
 */
@WebServlet(name = "CadastrarVendaServlet", urlPatterns = {"/CadastrarVendaServlet"})
public class VendaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        double valor_total = Double.parseDouble(request.getParameter("valor_total"));
        int fk_funcionario_id = Integer.parseInt(request.getParameter("fk_funcionario_id"));
        int fk_cliente_id = Integer.parseInt(request.getParameter("fk_cliente_id"));

//        String[]     produto_id = request.getParameterValues("produto_id");
//        String[]            qtd = request.getParameterValues("qtd");
//        String[] valor_unitario = request.getParameterValues("valor_un");

//        Pedido pedido = new Pedido();

        ArrayList<Pedido> listaItensVenda = new ArrayList<Pedido>();
//        for (int i = 0; i < produto_id.length; i++) {
//            pedido.setProduto_id(Integer.parseInt(produto_id[i]));
//            pedido.setQtd(Integer.parseInt(qtd[i]));
//            pedido.setValor(Integer.parseInt(valor_unitario[i]));
//            listaItensVenda.add(pedido);
//        }

        Venda vendas = new Venda(-1, fk_funcionario_id, fk_cliente_id, valor_total, listaItensVenda);

        boolean result = VendaDAO.Vender(vendas, 1);
        if (result) {
            response.sendRedirect(request.getContextPath() + "/sucesso.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/erro.jsp");
        }

    }

}
