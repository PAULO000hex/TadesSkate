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
        <title>Filiais</title>
    </head>
    <body>
        <c:import url="/menu.jsp"/>
        <h1></h1>
        <div class="fullpage">
            <table>
                <th>Email</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Cidade</th>
                <th>Estado</th>
                <th>Editar</th>
                <th>Excluir</th>

                <c:forEach items="${listaFiliais}" var = "filial" >
                    <tr>
                        <td>${filial.email}</td>
                        <td>${filial.telefone}</td>
                        <td>${filial.endereco}</td>
                        <td>${filial.cidade}</td>
                        <td>${filial.estado}</td>
                        <td>${filial.bairro}</td>
                        <td class="icon" id="edit"><a href ="AlterarFilialServlet?id=${filial.filial_id}"><i class="fa fa-pencil-square" aria-hidden="true"></i></a></td>
                        <td class="icon" id="delete"><a href="ExcluirFilialServlet?id=${filial.filial_id}"><i class="fa fa-times-circle" aria-hidden="true"></i></a></td>  
                    </tr>
                </c:forEach>
            </table>
            <a href="/TadesSkate/">voltar</a>
        </div>
    </body>
</html>
