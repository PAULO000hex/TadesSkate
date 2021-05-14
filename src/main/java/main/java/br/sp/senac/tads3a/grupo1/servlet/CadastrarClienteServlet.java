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
 * @author Administrador
 */
public class CadastrarClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String bairro = request.getParameter("bairro");
        String nascimento = request.getParameter("nascimento");
        Date date = Date.valueOf(nascimento);

        Cliente cliente = new Cliente(-1, nome, sobrenome, cpf, email, telefone, endereco, cidade, estado, bairro,date);

        boolean ok = ClienteDAO.Cadastrar(cliente, date);
        if (ok) {
            response.sendRedirect(request.getContextPath() + "/sucesso.jsp");
        } else {

            response.sendRedirect(request.getContextPath() + "/erro.jsp");
        }
    }

}
