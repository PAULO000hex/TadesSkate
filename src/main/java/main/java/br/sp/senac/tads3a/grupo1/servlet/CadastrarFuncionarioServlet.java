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
public class CadastrarFuncionarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String CPF = request.getParameter("CPF");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String nascimento = request.getParameter("nascimento");
        String departamento = request.getParameter("departamento");
        float salario = Float.parseFloat(request.getParameter("salario"));
        String endereco = request.getParameter("endereco");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        
        Date date = Date.valueOf(nascimento);
       
        Funcionario funcionario = new Funcionario(-1,nome, sobrenome, CPF, email, telefone, date, departamento, salario, endereco, bairro, cidade, estado);
        
        boolean result = FuncionarioDAO.cadastrar(funcionario);
        
        if(result){
        response.sendRedirect(request.getContextPath()+"/sucesso.jsp");
        }else{
        String error = "Ocorreu um erro ao cadastrar o funcionário";
        request.setAttribute("Error", error);
        request.getRequestDispatcher("erro/jsp").forward(request, response);
        }

    }

}
