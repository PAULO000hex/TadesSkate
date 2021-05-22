
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href=".../css/style.css" rel="stylesheet">
        <title>Lista de Funcionarios</title>
    </head>
    <body>
        <!--   <//c:import url="/menu.jsp"/> -->
        <input type="hidden" name="filial_id" class="filial_id" value="">
        <input type="hidden" name="filial_name" class="filial_name" value="">
        <h1></h1>

        <table class="table table-dark table-striped">
            <th>Nome</th>
            <th>Sobrenome</th>
            <th>CPF</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Data de Nascimento</th>
            <th>Departamento</th>
            <th>Salario</th>
            <th>Endereço</th>
            <th>Cidade</th>
            <th>Bairro</th>
            <th>Estado</th>
                <c:forEach items="${listaFuncionarios}" var = "funcionario" >
                <tr>
                    <td>${funcionario.nome}</td>
                    <td>${funcionario.sobrenome}</td>
                    <td>${funcionario.CPF}</td>
                    <td>${funcionario.email}</td>
                    <td>${funcionario.nascimento}</td>
                    <td>${funcionario.departamento}</td>
                    <td>${funcionario.salario}</td>
                    <td>${funcionario.endereco}</td>
                    <td>${funcionario.cidade}</td>  
                    <td>${funcionario.bairro}</td>
                    <td>${funcionario.estado}</td>
                    <td><a href ="AlterarFuncionarioServlet?id=${funcionario.funcionario_id}">Alterar</a></td>
                    <td><a href="ExcluirFuncionarioServlet?id=${funcionario.funcionario_id}">Excluir</a></td>                  
                </tr>
            </c:forEach>
        </table>
        <a href="/TadesSkate/">voltar</a>

    </body>
</html>