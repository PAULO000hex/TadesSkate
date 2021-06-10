/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.br.sp.senac.tads3a.grupo1.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import main.java.br.sp.senac.tads3a.grupo1.model.Funcionario;

/**
 *
 * @author Wesley
 */
public class AutorizacaoFilter implements Filter {
    
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public AutorizacaoFilter() {
    }
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        
        HttpSession session = httpServletRequest.getSession();
        if (session.getAttribute("usuario") == null) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/index.jsp");
        }
        
        Funcionario funcionario = (Funcionario) session.getAttribute("usuario");
        String url = httpServletRequest.getRequestURI();
        
        if (url.contains("/Funcionarios") && !funcionario.isRH() && !funcionario.isAdmin() && !funcionario.isTecnologia()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/naoAutorizado.jsp");
        }
        
        if (url.contains("/Protegido/Venda") && !funcionario.isComercial() && !funcionario.isGerente()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/naoAutorizado.jsp");
        }
        
        if (url.contains("/Clientes") && !funcionario.isGerente() && !funcionario.isTecnologia()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/naoAutorizado.jsp");
        }
        
        if (url.contains("/Filiais") && !funcionario.isGerente() && !funcionario.isTecnologia() && !funcionario.isFinanceiro()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/naoAutorizado.jsp");
        }
        
        if (url.contains("/Produtos") && !funcionario.isTecnologia()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/naoAutorizado.jsp");
        }
        
        if (url.contains("/Protegido/listaClientes.jsp") && !funcionario.isGerente() && !funcionario.isTecnologia() && !funcionario.isFinanceiro()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/naoAutorizado.jsp");
        }
        
        if (url.contains("/Protegido/listaFuncionarios.jsp") && !funcionario.isTecnologia() && !funcionario.isBackOffice() && !funcionario.isRH()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/naoAutorizado.jsp");
        }
        
        if (url.contains("/Protegido/relatorioFilial.jsp") && !funcionario.isTecnologia() && !funcionario.isFinanceiro()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/naoAutorizado.jsp");
        }
        
        if (url.contains("/Protegido/relatorioGeral.jsp") && !funcionario.isTecnologia() && !funcionario.isFinanceiro()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/naoAutorizado.jsp");
        }
    }    
    
//    public boolean verificaAcesso(String url, Funcionario funcionario){
//        boolean nOk = false;
//        
//        if (
//            (url.contains("/Funcionarios") && !funcionario.isRH() && !funcionario.isAdmin() && !funcionario.isTecnologia()) ||
//            (url.contains("/Protegido/listaFuncionarios.jsp") && !funcionario.isRH()) ||
//            (url.contains("/Protegido/Venda") && !funcionario.isComercial())
//            ) {
//            nOk = true;
//        }
//                
//        return nOk;
//    }
    
    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        if (debug) {
            log("AutorizacaoFilter:doFilter()");
        }
        
        doBeforeProcessing(request, response);
        
        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }
        
        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("AutorizacaoFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AutorizacaoFilter()");
        }
        StringBuffer sb = new StringBuffer("AutorizacaoFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}


/**
 * <filter>
        <filter-name>AutorizacaoFilter</filter-name>
        <filter-class>main.java.br.sp.senac.tads3a.grupo1.filter.AutorizacaoFilter</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>AutorizacaoFilter</filter-name>
        <url-pattern>/Protegido/*</url-pattern>
    </filter-mapping>
 */