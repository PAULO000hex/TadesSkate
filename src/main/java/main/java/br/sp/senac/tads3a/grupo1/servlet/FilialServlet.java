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
public class FilialServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Filial> listaFiliais = FilialDAO.getFiliais();
        request.setAttribute("listaFiliais", listaFiliais);
        request.getRequestDispatcher("/Protegido/Filiais/listaFiliais.jsp").forward(request, response);
    }
}