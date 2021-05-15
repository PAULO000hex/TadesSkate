/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import main.java.br.sp.senac.tads3a.grupo1.DAO.ProdutoDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Produto;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PICHAU
 */
public class ProdutoVendaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String descricao = request.getParameter("descricao");
          List<Produto> listaProdutos = ProdutoDAO.getClienteVenda(descricao);
          request.setAttribute("listaProdutos", listaProdutos);
          request.getRequestDispatcher("/testes.jsp").forward(request, response); 
    }
}

    
