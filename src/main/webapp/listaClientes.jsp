
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href=".../css/style.css" rel="stylesheet">
        <title>Lista de Clientes</title>
    </head>
    <body>
        <h1></h1>
        <table>
            <th>NOME</th>
            <th>SOBRENOME</th>
            <th>CPF</th>
            <th>EMAIL</th>
            <th>TELEFONE</th>
            <th>ENDERECO</th>
            <th>CIDADE</th>
            <th>ESTADO</th>
            <th>BAIRRO</th>
            <th>NASCIMENTO</th>
                <c:forEach items="${listaClientes}" var = "cliente" >

                <tr>
                    <td>${cliente.nome}</td>
                    <td>${cliente.sobrenome}</td>
                    <td>${cliente.cpf}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.telefone}</td>
                    <td>${cliente.endereco}</td>
                    <td>${cliente.cidade}</td>
                    <td>${cliente.estado}</td>
                    <td>${cliente.bairro}</td>
                    <td>${cliente.nascimento}</td>
                    <td><a href ="ExcluirClienteServlet?id=${cliente.cliente_id}">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <a href="index.jsp">voltar</a>

    </body>
</html>
