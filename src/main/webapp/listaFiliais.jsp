<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href=".../css/style.css" rel="stylesheet">
        <title>Lista de Filiais</title>
    </head>
    <body>
       <!--   <//c:import url="/menu.jsp"/> -->  
        <h1></h1>
        <table class="table table-dark table-striped">
            <th>Email</th>
            <th>Telefone</th>
            <th>Endereço</th>
            <th>Cidade</th>
            <th>Estado</th>

                <c:forEach items="${listaFiliais}" var = "filial" >
                <tr>
                    <td>${filial.email}</td>
                    <td>${filial.telefone}</td>
                    <td>${filial.endereco}</td>
                    <td>${filial.cidade}</td>
                    <td>${filial.estado}</td>
                    <td>${filial.bairro}</td>
              <td><a href ="AlterarFilialServlet?id=${filial.filial_id}">Alterar</a></td>
              <td><a href="ExcluirFilialServlet?id=${filial.filial_id}">Excluir</a></td>                  
              </tr>
            </c:forEach>
        </table>
        <a href="index.jsp">voltar</a>

    </body>
</html>
