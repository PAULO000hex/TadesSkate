/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import main.java.br.sp.senac.tads3a.grupo1.DAO.RelatorioDAO;
import main.java.br.sp.senac.tads3a.grupo1.model.Funcionario;
import main.java.br.sp.senac.tads3a.grupo1.model.Relatorio;

/**
 *
 * @author 004039631
 */
public class RelatorioVendaGeralServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int filial = Integer.parseInt(request.getParameter("filial"));
        List<Relatorio> relatorios = RelatorioDAO.getVendas(filial);
        String json = new Gson().toJson(relatorios);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
