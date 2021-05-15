package main.java.br.sp.senac.tads3a.grupo1.servlet;

import main.java.br.sp.senac.tads3a.grupo1.DAO.FuncionarioDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Funcionario;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author vitor.oliveira
 */
public class testeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("filiais");
        System.out.println(nome);
        response.sendRedirect(request.getContextPath() + "Funcionarios/cadastrarFuncionario.jsp");
    }
}
