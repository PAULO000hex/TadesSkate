
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
        <link href=".../css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <title>Funcionários</title>
    </head>
    <body>
        <c:import url="/menu.jsp"/>
        <input type="hidden" name="filial_id" class="filial_id" value="">
        <input type="hidden" name="filial_name" class="filial_name" value="">
        <h1></h1>
        <div class="fullpage">
            <table>
                <th>ID</th>
                <th>Nome</th>
                <th>CPF</th>
                <th>Email</th>
                <th>Departamento</th>
                <th>Salario</th>
                <th>Telefone</th>
                <th>Editar</th>
                <th>Excluir</th>
                <c:forEach items="${listaFuncionarios}" var = "funcionario" >
                    <tr>
                        <td>${funcionario.funcionario_id}</td>
                        <td>${funcionario.nome} ${funcionario.sobrenome}</td>
                        <td>${funcionario.CPF}</td>
                        <td>${funcionario.email}</td>
                        <td>${funcionario.departamento}</td>
                        <td>${funcionario.salario}</td>
                        <td class="phone">${funcionario.telefone}</td>
                        <td class="icon" id="edit"><a href ="AlterarFuncionarioServlet?id=${funcionario.funcionario_id}"><i class="fa fa-pencil-square" aria-hidden="true"></i></a></td>
                        <td class="icon" id="delete"><a href="ExcluirFuncionarioServlet?id=${funcionario.funcionario_id}"><i class="fa fa-times-circle" aria-hidden="true"></i></a></td>                  
                    </tr>
                </c:forEach>
            </table>
            <a href="/TadesSkate/">voltar</a>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            $('.phone').mask("(00) 00000-0000");
        });
    </script>
</html>