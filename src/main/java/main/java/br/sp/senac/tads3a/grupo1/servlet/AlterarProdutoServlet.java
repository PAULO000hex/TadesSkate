/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.java.br.sp.senac.tads3a.grupo1.DAO.ProdutoDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Produto;

/**
 *
 * @author Administrador
 */
public class AlterarProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Produto produto = ProdutoDAO.getProduto(id);
        request.setAttribute("produto", produto);

        request.getRequestDispatcher("/Produtos/CadastrarProduto.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String descricao = request.getParameter("descricao");
        String categoria = request.getParameter("categoria");
        String fabricante = request.getParameter("fabricante");
        double valor = Double.parseDouble(request.getParameter("valor"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double desconto = Double.parseDouble(request.getParameter("desconto"));
            int id = Integer.parseInt(request.getParameter("id"));
        Produto produto = new Produto(id, descricao, categoria, fabricante, valor, quantidade, desconto);
        boolean ok = ProdutoDAO.atualizar(produto);
        if (ok) {
            response.sendRedirect("sucesso.jsp");
        } else {
            response.sendRedirect("erro.jsp");
        }

    }

}
