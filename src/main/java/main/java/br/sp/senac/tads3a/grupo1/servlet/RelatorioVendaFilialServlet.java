/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class RelatorioVendaFilialServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           
	HttpSession sessao = request.getSession();
        Funcionario f = (Funcionario) sessao.getAttribute("usuario");	
	String dataInicio = request.getParameter("dataInicio");	
	String dataFim = request.getParameter("dataFim");	

    List<Relatorio> relatorios = RelatorioDAO.getVendas(dataInicio, dataFim, f.getFk_filial_id());

    String json = new Gson().toJson(list);
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
    }
    }