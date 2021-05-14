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
 * @author paulo
 */
public class CadastrarFilialServlet extends HttpServlet {

 

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String bairro = request.getParameter("bairro");

        Filial filial = new Filial(-1, email, telefone, endereco, cidade, estado, bairro);

        boolean ok = FilialDAO.Cadastrar(filial);
        if (ok) {
            response.sendRedirect(request.getContextPath() + "/sucesso.jsp");
        } else {

            response.sendRedirect(request.getContextPath() + "/erro.jsp");
        }
    }

 
}
