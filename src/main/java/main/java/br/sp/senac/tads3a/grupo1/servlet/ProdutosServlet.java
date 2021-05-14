package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.java.br.sp.senac.tads3a.grupo1.DAO.ProdutoDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Produto;

/**
 *
 * @author Administrador
 */
public class ProdutosServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Produto> listaProdutos = ProdutoDAO.getProdutos();
        request.setAttribute("listaProdutos", listaProdutos);
        request.getRequestDispatcher("/listaProdutos.jsp").forward(request, response);
    }
}
