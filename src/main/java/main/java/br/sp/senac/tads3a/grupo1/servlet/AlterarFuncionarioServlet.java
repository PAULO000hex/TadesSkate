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
import main.java.br.sp.senac.tads3a.grupo1.DAO.FuncionarioDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Funcionario;

/**
 *
 * @author Administrador
 */
public class AlterarFuncionarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Funcionario funcionario = FuncionarioDAO.getFuncionario(id);
        request.setAttribute("funcionario", funcionario);

        request.getRequestDispatcher("/Funcionarios/cadastrarFuncionario.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String cpf = request.getParameter("CPF");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String nascimento = request.getParameter("nascimento");
        String departamento = request.getParameter("departamento");
        float salario = Float.parseFloat(request.getParameter("salario"));
        String endereco = request.getParameter("endereco");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String senha = request.getParameter("senha");
        int id = Integer.parseInt(request.getParameter("id"));
        
        Date date = Date.valueOf(nascimento);

        Funcionario funcionario = new Funcionario(id, nome, sobrenome, cpf, email, telefone, date, departamento, salario, endereco, bairro, cidade, estado, senha);
        
        boolean ok = FuncionarioDAO.atualizar(funcionario);
        if (ok) {
            response.sendRedirect("sucesso.jsp");
        } else {
            response.sendRedirect("erro.jsp");
        }

    }

}
