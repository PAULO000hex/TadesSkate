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
public class CadastrarProdutoServlet extends HttpServlet {

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String descricao = request.getParameter("descricao");
        String categoria = request.getParameter("categoria");
        String fabricante = request.getParameter("fabricante");
        double valor = Double.parseDouble(request.getParameter("valor"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double desconto = Double.parseDouble(request.getParameter("desconto"));
        int filial_id = Integer.parseInt(request.getParameter("filial_id"));


        Produto produto = new Produto(-1,descricao, categoria, fabricante, valor, quantidade, desconto);

        boolean ok = ProdutoDAO.Cadastrar(produto,filial_id);
        if (ok) {
            response.sendRedirect(request.getContextPath() + "/sucesso.jsp");
        } else {

            response.sendRedirect(request.getContextPath() + "/erro.jsp");
        }
    }
}
