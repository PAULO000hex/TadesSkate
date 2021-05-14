<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
        <link href=".../css/style.css" rel="stylesheet">


        <title>Cadastro de Filial</title>
    </head>
    <body>  
    <c:if test="${empty filial}">                                                                                                                                                                                                                                                                                  
        <div class="menu">
            <div class="message">
                <h3>Olá Paulo - Tecnologia</h3>
            </div>
            <div class="logo">
                <img src=".../img/Tades.png" alt="alt"/>
            </div>
            <hr>
            <div class="options">
                <ul>
                    <a href="CadastrarFilial.jsp"><li>Cadastrar Filial</li></a>
                    <a href=".../FilialServlet"><li>Listar Filial</li></a>
                </ul>
            </div>
        </div>
        <form action = "CadastrarFilialServlet" method="POST" >
            <div class="half">
                <div class="space"><h1>Cadastro De Filiais</h1></div>
                <div class="field">
                    <h2>Email</h2>
                    <input class="txt" type="text" name="email">
                </div>
                <div class="field">
                    <h2>Telefone</h2>
                    <input class="txt" type="text" name="telefone"></div>
                <div class="field">
                    <h2>Endereço</h2>
                    <input class="txt" type="text" name="endereco"></div>
            </div>
            <div class="half-last">
                 <div class="space">
                <h1>&nbsp;</h1>
            </div>
            <div class="field">
                <h2>Cidade</h2>
                <input class="txt" type="text" name="cidade">
            </div>
            <div class="field">
                <h2>Estado</h2>
                <input class="txt" type="text" name="estado">
            </div>
            <div class="field">
                <h2>Bairro</h2>
                <input class="txt" type="text" name="bairro">
            </div>
            <div class="btn"><input type="submit"></div>  
        </div>
    </form> 
        </c:if>
        
        <c:if test="${not empty filial}">
        <div class="menu">
            <div class="message">
                <h3>Olá Amanda - Tecnologia</h3>
            </div>
            <div class="logo">
                <img src=".../img/Tades.png" alt="alt"/>
            </div>
            <hr>
            <div class="options">
                <ul>
                    <a href="CadastrarFilial.jsp"><li>Alterar Filial</li></a>
                </ul>
            </div>
        </div>
        
        <form action = "AlterarFilialServlet" method="POST" >
            <div class="half">
                <div class="space"><h1>Alteração de Filiais</h1></div>
                <div class="field">
                    <input type="text" name="id" hidden="true" value="${filial.filial_id}"/> 
                    <h2>Email</h2>
                    <input class="txt" type="text" name="email" value="${filial.email}">
                </div>
                <div class="field">
                    <h2>Telefone</h2>
                    <input class="txt" type="text" name="telefone" value="${filial.telefone}"></div>
                <div class="field">
                    <h2>Endereço</h2>
                    <input class="txt" type="text" name="endereco" value="${filial.endereco}"></div>
            </div>
            <div class="half-last">
                 <div class="space">
                <h1>&nbsp;</h1>
            </div>
            <div class="field">
                <h2>Cidade</h2>
                <input class="txt" type="text" name="cidade" value="${filial.cidade}">
            </div>
            <div class="field">
                <h2>Estado</h2>
                <input class="txt" type="text" name="estado" value="${filial.estado}">
            </div>
            <div class="field">
                <h2>Bairro</h2>
                <input class="txt" type="text" name="bairro" value="${filial.bairro}">
            </div>
            <div class="btn"><input type="submit"></div>  
        </div>
    </form> 
        </c:if>

</body>
</html>
