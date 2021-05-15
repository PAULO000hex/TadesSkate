<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <style>
            body{
                background-color: #232323;
            }
            .card{
                text-align: center;
                height: 300px;
            }
            .btn{
                text-align: center;
                width:100%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="image">
                <<img src="img/Tades.png" alt="alt"/>
            </div>
            <br/>


            <div class="card">
                <select id="filiais">
                    <c:forEach items="${testeFiliais}" var = "filial" >
                        <option id="${filial.filial_id}">${filial.cidade}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="btn">
                <input type="button" id="acessar" value="Acessar">
<!--            <a href="Funcionarios/cadastrarFuncionario.jsp"><input type="button" value="Acessar"></a>
                <a href="FuncionariosServlet"><input type="button" value="Acessar"></a>
                <a href="Produtos/CadastrarProduto.jsp"><input type="button" value="Acessar"></a>
                <a href="ProdutosServlet"><input type="button" value="Acessar"></a>
                <a href="Filiais/CadastrarFilial.jsp"><input type="button" value="Acessar"></a>
                <a href="FilialServlet"><input type="button" value="Acessar"></a>
                <a href="Clientes/CadastrarClientes.jsp"><input type="button" value="Acessar"></a>
                <a href="Clientes/ClienteServlet"><input type="button" value="Acessar"></a>
                <a href="IndexServlet"><input type="button" value="Acessar"></a>-->

            </div>
        </div>
    </body>
    <script>
        $('#acessar').click(function(){
            window.location.href = 'Funcionarios/cadastrarFuncionario.jsp?id='+$('#filiais option:selected').attr('id')+'&nome='+$('#filiais option:selected').text();
        })
    </script>
</html>
