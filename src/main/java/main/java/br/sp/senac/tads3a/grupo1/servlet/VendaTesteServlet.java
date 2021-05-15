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
import main.java.br.sp.senac.tads3a.grupo1.DAO.ClienteDAO;
import main.java.br.sp.senac.tads3a.grupo1.DAO.FuncionarioDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Cliente;
import main.java.br.sp.senac.tads3a.grupo1.model.Funcionario;

/**
 *
 * @author PICHAU
 */
public class VendaTesteServlet extends HttpServlet {

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
          List<Produto> listaProdutos = ProdutoDAO.getProdutos();
          List<Cliente> listaClientes = ClienteDAO.getClientes();
          List<Funcionario> listaFuncionarios = FuncionarioDAO.getFuncionarios();
                  
          request.setAttribute("listaFuncionarios", listaFuncionarios);
          request.setAttribute("listaClientes", listaClientes);
          request.setAttribute("listaProdutos", listaProdutos);
          
          request.getRequestDispatcher("/Venda.jsp").forward(request, response); 
    }
}

    
