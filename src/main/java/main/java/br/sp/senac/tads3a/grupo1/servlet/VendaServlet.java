/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;
import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import main.java.br.sp.senac.tads3a.grupo1.DAO.ProdutoDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Produto;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import main.java.br.sp.senac.tads3a.grupo1.DAO.ClienteDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Cliente;
import main.java.br.sp.senac.tads3a.grupo1.model.Funcionario;

public class VendaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sessao = request.getSession();
        Funcionario f = (Funcionario) sessao.getAttribute("usuario");
           
        List<Produto> listaProdutos = ProdutoDAO.getProdutos(f.getFk_filial_id());
        List<Cliente> listaClientes = ClienteDAO.getClientes(f.getFk_filial_id());
                  
        request.setAttribute("listaClientes", listaClientes);
        request.setAttribute("listaProdutos", listaProdutos);
        
        request.getRequestDispatcher("/Protegido/Venda.jsp").forward(request, response); 
    }
}

    
