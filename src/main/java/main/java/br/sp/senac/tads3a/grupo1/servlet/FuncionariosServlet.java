package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class FuncionariosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Funcionario> listaFuncionarios = FuncionarioDAO.getFuncionarios();
        
        request.setAttribute("listaFuncionarios", listaFuncionarios);
        request.getRequestDispatcher("/listaFuncionarios.jsp").forward(request, response);
    }
}