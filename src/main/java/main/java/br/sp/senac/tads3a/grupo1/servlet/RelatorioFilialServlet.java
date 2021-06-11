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

/**
 *
 * @author PICHAU
 */
public class RelatorioFilialServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
	String filial = request.getParameter("filial");	
	String dataInicio = request.getParameter("dataInicio");	
	String dataFim = request.getParameter("dataFim");	

    List<Pedido> list = new ArrayList<>(); //-> Pega o valor da DAO
    relatorios = RelatorioDAO.getRelatorioPorFilial(dataInicio, dataFim, filial);

    String json = new Gson().toJson(list);
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
    }

}
