/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
public class AlterarFilialServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Filial filial = FilialDAO.getFilial(id);
        request.setAttribute("filial", filial);

        request.getRequestDispatcher("/Filiais/CadastrarFilial.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String bairro = request.getParameter("bairro");
            int id = Integer.parseInt(request.getParameter("id"));
        Filial filial = new Filial(id, email, telefone, endereco, cidade, estado, bairro);
        boolean ok = FilialDAO.atualizar(filial);
        if (ok) {
            response.sendRedirect("sucesso.jsp");
        } else {
            response.sendRedirect("erro.jsp");
        }

    }

}
