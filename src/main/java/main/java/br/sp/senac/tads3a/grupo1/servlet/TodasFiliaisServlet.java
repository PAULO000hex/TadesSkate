/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.java.br.sp.senac.tads3a.grupo1.DAO.RelatorioDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Relatorio;

/**
 *
 * @author 004039631
 */
public class TodasFiliaisServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Relatorio> relatorios = RelatorioDAO.getFiliais();

        request.setAttribute("listaFiliais", relatorios);

        request.getRequestDispatcher("/Protegido/relatorioGeral.jsp").forward(request, response);

    }
}
