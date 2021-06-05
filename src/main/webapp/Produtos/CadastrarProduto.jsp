
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

        <c:import url="/menu.jsp"/>
        <title>Cadastro de Produto</title>
    </head>
    <body>  
        <c:if test="${empty produto}">                                                                                                                                                                                                                                                                                  

            <form action = "CadastrarProdutoServlet" method="POST" >
             <input type="hidden" name="filial_id" class="filial_id" value="${sessionScope.usuario.fk_filial_id}">
                <div class="half">
                    <div class="space"><h1>Cadastro De Produtos</h1></div>             
                    <div class="field">
                        <h2>Descrição</h2>
                        <input required class="txt" type="text" id="tst" name="descricao">
                    </div>
                    <div class="field">
                        <h2>Categoria</h2>
                        <input  required class="txt" type="text" name="categoria"></div>
                    <div class="field">
                        <h2>Fabricante</h2>
                        <input required class="txt" type="text" name="fabricante"></div>
                </div>
                <div class="half-last">
                    <div class="space">
                        <h1>&nbsp;</h1>
                    </div>
                    <div class="field">
                        <h2>Valor</h2>
                        <input  required class="txt" type="text" name="valor">
                    </div>
                    <div class="field">
                        <h2>Quantidade</h2>
                        <input required class="txt" type="text" name="quantidade">
                    </div>
                    <div class="field">
                        <h2>Desconto</h2>
                        <input class="txt" type="text" name="desconto">
                    </div>
                    <div class="btn"><input type="submit"></div>  
                </div>
            </form> 
        </c:if>

        <c:if test="${not empty produto}">
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
                        <a href="CadastrarProduto.jsp"><li>Cadastrar Produto</li></a>
                    </ul>
                </div>
            </div>

            <form action = "AlterarProdutoServlet" method="POST" >
            <input type="hidden" name="filial_id" class="filial_id" value="${sessionScope.usuario.fk_filial_id}">
                <div class="half">
                    <div class="space"><h1>Cadastro De Produtos</h1></div>
                    <div class="field">
                        <input type="text" name="id" hidden="true" value="${produto.produto_id}"/> 
                        <h2>Descrição</h2>
                        <input class="txt" type="text" name="descricao" value="${produto.descricao}">
                    </div>
                    <div class="field">
                        <h2>Categoria</h2>
                        <input class="txt" type="text" name="categoria" value="${produto.categoria}"></div>
                    <div class="field">
                        <h2>Fabricante</h2>
                        <input class="txt" type="text" name="fabricante" value="${produto.fabricante}"></div>
                </div>
                <div class="half-last">
                    <div class="space">
                        <h1>&nbsp;</h1>
                    </div>
                    <div class="field">
                        <h2>Valor</h2>
                        <input class="txt" type="text" name="valor" value="${produto.valor}">
                    </div>
                    <div class="field">
                        <h2>Quantidade</h2>
                        <input class="txt" type="text" name="quantidade" value="${produto.quantidade}">
                    </div>
                    <div class="field">
                        <h2>Desconto</h2>
                        <input class="txt" type="text" name="desconto" value="${produto.desconto}">
                    </div>
                    <div class="btn"><input type="submit"></div>  
                </div>
            </form> 
        </c:if>

    </body>
</html>