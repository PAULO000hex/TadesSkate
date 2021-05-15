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
import javax.servlet.http.HttpServletResponse;
import main.java.br.sp.senac.tads3a.grupo1.DAO.ClienteDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Cliente;

/**
 *
 * @author PICHAU
 */
public class ClienteVendaServlet extends HttpServlet {

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
        String cpf = request.getParameter("cpf");
        List<Cliente> listaProdutos = ClienteDAO.getClienteVenda(cpf);
        
        if (!listaProdutos.isEmpty()) {
            request.setAttribute("listaProdutos", listaProdutos);
            response.setStatus(200);
        } else {
            response.setStatus(500);
        }
    }
}
