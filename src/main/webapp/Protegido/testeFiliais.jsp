<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <style>
            .container{
                text-align: center;
            }
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
            <p style="color: white">Usuário Logado: 
                ${sessionScope.usuario.nome} ${sessionScope.usuario.fk_filial_id}  id = ${sessionScope.usuario.funcionario_id} <a href="<c:url value="/LogoutServlet"/>" class="ms-3">Sair</a></p>
            
            <div class="image">
                <img src="../img/Tades.png" alt="alt"/>
            </div>
            <br/>
                <select id="filiais" name="filiais">
                    <c:forEach items="${testeFiliais}" var = "filial" >
                        <option id="${filial.filial_id}">${filial.cidade}</option>
                    </c:forEach>
                </select>
            <div class="btn">
                <input type="button" id="acessar" value="Acessar">
            </div>
        </div>
    </body>
    <script>
        $('#acessar').click(function(){
        //window.location.href = 'Venda.jsp?id='+$('#filiais option:selected').attr('id')+'&nome='+$('#filiais option:selected').text();
          window.location.href = 'VendaTesteServlet?id='+$('#filiais option:selected').attr('id')+'&nome='+$('#filiais option:selected').text();
//window.location.href = 'Funcionarios/cadastrarFuncionario.jsp?id='+$('#filiais option:selected').attr('id')+'&nome='+$('#filiais option:selected').text();
        });
    </script>
</html>
