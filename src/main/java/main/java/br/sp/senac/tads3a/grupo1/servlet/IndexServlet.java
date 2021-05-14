package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.java.br.sp.senac.tads3a.grupo1.DAO.FilialDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Filial;

/**
 *
 * @author Administrador
 */
public class IndexServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Filial> testeFiliais = FilialDAO.getFiliais();
        request.setAttribute("testeFiliais", testeFiliais);
        request.getRequestDispatcher("/testeFiliais.jsp").forward(request, response);
    }
}