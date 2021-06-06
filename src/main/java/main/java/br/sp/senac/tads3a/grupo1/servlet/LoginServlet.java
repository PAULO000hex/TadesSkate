package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import main.java.br.sp.senac.tads3a.grupo1.DAO.FuncionarioDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Funcionario;

/**
 * @author Wesley
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        
        Funcionario usuario = FuncionarioDAO.getFuncionarioLogin(cpf, senha);
        
        if (usuario != null) {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("usuario", usuario);
            if (null != usuario.getDepartamento()) switch (usuario.getDepartamento()) {
                case "admin":
                    response.sendRedirect(request.getContextPath() + "/Protegido/Funcionarios/cadastrarFuncionario.jsp");
                    break;
                case "RH":
                    response.sendRedirect(request.getContextPath() + "/Protegido/Funcionarios/cadastrarFuncionario.jsp");
                    break;
                case "Gerência":
                    response.sendRedirect(request.getContextPath() + "/Protegido/VendaServlet");
                    break;
                case "Tecnologia":
                    response.sendRedirect(request.getContextPath() + "/Protegido/Funcionarios/cadastrarFuncionario.jsp");
                    break;
                case "BackOffice":
                    response.sendRedirect(request.getContextPath() + "/FuncionariosServlet");
                    break;
                case "Financeiro":
                    response.sendRedirect(request.getContextPath() + "/FilialServlet");
                    break;
                case "Comercial":
                    response.sendRedirect(request.getContextPath() + "/Protegido/Venda.jsp");
                    break;
                default:
                    break;
            }
        }else{
            response.sendRedirect("erro.jsp");
        }
    }
}