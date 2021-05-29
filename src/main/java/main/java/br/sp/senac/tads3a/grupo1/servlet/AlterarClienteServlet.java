/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.java.br.sp.senac.tads3a.grupo1.DAO.ClienteDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Cliente;

/**
 *
 * @author paulo
 */
public class AlterarClienteServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Integer id = Integer.parseInt(request.getParameter("id"));
        
        Cliente cliente = ClienteDAO.getCliente(id);
        request.setAttribute("cliente", cliente);
        
        request.getRequestDispatcher("/Clientes/CadastrarClientes.jsp").forward(request, response);
      
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String nascimento = request.getParameter("nascimento");
        String endereco = request.getParameter("endereco");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        int id = Integer.parseInt(request.getParameter("id"));
        int fk_filial_id = Integer.parseInt(request.getParameter("fk_filial_id"));
        
        Date date = Date.valueOf(nascimento);

        Cliente cliente = new Cliente(id, nome, sobrenome, cpf, email, telefone, endereco, bairro, cidade, estado,date,fk_filial_id);
        
        boolean ok = ClienteDAO.atualizarCliente(cliente);
        if (ok) {
           response.sendRedirect(request.getContextPath() + "/sucesso.jsp");
        } else {
            response.sendRedirect("erro.jsp");
        }

    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}