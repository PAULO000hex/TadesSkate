
package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.util.List;
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
public class ClienteServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Cliente> listaClientes = ClienteDAO.getClientes();
        request.setAttribute("listaClientes", listaClientes);
        request.getRequestDispatcher("/Protegido/listaClientes.jsp").forward(request, response);
    }
}