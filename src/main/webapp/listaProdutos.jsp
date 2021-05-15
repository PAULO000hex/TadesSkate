
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href=".../css/style.css" rel="stylesheet">
        <title>Lista de Produtos</title>
    </head>
    <body>
        <input type="hidden" name="filial_id" class="filial_id" value="">
        <input type="hidden" name="filial_name" class="filial_name" value="">
        <!--   <//c:import url="/menu.jsp"/> -->
        <h1></h1>
        <table class="table table-dark table-striped">
            <th>Descrição</th>
            <th>Categoria</th>
            <th>Fabricante</th>
            <th>Valor</th>
            <th>Quantidade</th>
            <th>Desconto</th>

            <c:forEach items="${listaProdutos}" var = "produto" >
                <tr>
                    <td>${produto.descricao}</td>
                    <td>${produto.categoria}</td>
                    <td>${produto.fabricante}</td>
                    <td>${produto.valor}</td>
                    <td>${produto.quantidade}</td>
                    <td>${produto.desconto}</td>  
                    <td><a href ="AlterarProdutoServlet?id=${produto.produto_id}">Alterar</a></td>
                    <td><a href="ExcluirProdutoServlet?id=${produto.produto_id}">Excluir</a></td>                  
                </tr>
            </c:forEach>
        </table>
        <a href="index.jsp">voltar</a>

    </body>
</html>