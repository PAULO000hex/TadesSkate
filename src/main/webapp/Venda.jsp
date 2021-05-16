<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <link href=".../css/style.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Venda</title>
        <style>
            .wrapper{
                height:80%;
            }
            .produto_half{
            width:50%;
            
            select{
                width:100%;
            }
            js-example-basic-single{
                width: 100%;
            }

        </style>
    </head>

    <body>
    <c:import url="/menu.jsp"/>      

        <form action="VendaServlet" method="POST">
            <div class="half">
                <div class="wrapper">
                    <div class="cliente">
                        <h3>CPF</h3>
                        <select class="js-example-basic-single" id="cliente" name="fk_cliente_id" required>
                            <option></option>
                            <c:forEach items="${listaClientes}" var = "cliente" >                   
                                <option value="${cliente.cliente_id}">${cliente.cpf} | ${cliente.nome} ${cliente.sobrenome} </option>                    
                            </c:forEach>
                        </select>
                    </div>
                    <div class="produto">
                        <h3>Descrição</h3>
                    <div class="produto_half">
                        <select class="js-example-basic-single" id="produto" name="produto" required>
                            <option></option>
                            <c:forEach items="${listaProdutos}" var = "produto" >
                                <option value="${produto.produto_id}" class="${produto.descricao}" id="${produto.valor}">${produto.produto_id} | ${produto.descricao}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="produto_half">
                        <input type="number" id="qtd" placeholder="Insira a quantidade" required>
                    </div>
                </div>
                <hr>
                <h3>Funcionário</h3>
                <select class="js-example-basic-single" id="funcionario" name="fk_funcionario_id" required>
                    <option></option>
                    <c:forEach items="${listaFuncionarios}" var = "funcionario" >                   
                        <option value="${funcionario.funcionario_id}">${funcionario.CPF} | ${funcionario.nome} ${funcionario.sobrenome} </option>                    
                    </c:forEach>
                </select>
            </div>
            <div class="btn">
                <input type="button" class="btnAdicionar" value="Adicionar Produto">
            </div>
        </div>               

        <div class="half-last">
            <div class="wrapper">
                <div class="produtos">
                    <table class="table table-dark table-striped" id="tabela">                
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th>Valor Un</th>
                    </table>
                </div>
                <input type="text" name="valor_total" id="valor_total">
            </div>
            <div class="btn">
                <input type="submit" class="btnFinalizar" value="Finalizar Venda">
            </div>
        </div>
    </form>

</body>
<script>
    var valorTotal = 0;

    $(document).ready(function () {


        $('.js-example-basic-single').select2();

        var id = findGetParameter('id');
        var nome = findGetParameter('nome');

        $('.filial_id').val(id);
        $('.filial_name').val(nome);

    });
    function findGetParameter(parameterName) {
        var result = null,
                tmp = [];
        var items = location.search.substr(1).split("&");
        for (var index = 0; index < items.length; index++) {
            tmp = items[index].split("=");
            if (tmp[0] === parameterName)
                result = decodeURIComponent(tmp[1]);
        }
        return result;
    }
    $('a').click(function () {
        var url = $(this).attr('href');
        var param = location.search;
        $(this).attr('href', url + param);
    });

    $('#cliente').change(function () {
        var cliente = $('#cliente').val();

    });



    var prod = 0;
    $('.btnAdicionar').click(function (e) {

        prod++;
        var produto = $('#produto option:selected').val();
        var funcionario = $('#funcionario option:selected').val();
        var cliente = $('#cliente option:selected').val();

        var qtd = $('#qtd').val();

        var html = '<tr><td value="' + $('#produto option:selected').attr('class') + '">' + $('#produto option:selected').attr('class') + '</td><td name="qtd1" value="' + qtd + '">' + qtd + '</td><td name="valor_un1" value="' + $('#produto option:selected').attr('id') + '">' + $('#produto option:selected').attr('id') + '</td></tr>';
        if (qtd != "" || produto != "" || funcionario != "") {
            $('#tabela').append(html);
            $('.half').append('<input type="hidden" id="produto_id"' + prod + ' name="produto_id" value="' + $('#produto option:selected').val() + '">');
            $('.half').append('<input type="hidden" id="descricao"' + prod + ' name="descricao" value="' + $('#produto option:selected').attr('class') + '">');
            $('.half').append('<input type="hidden" id="qtd"' + prod + ' name="qtd" value="' + qtd + '">');
            $('.half').append('<input type="hidden" id="valor_un"' + prod + ' name="valor_un" value="' + $('#produto option:selected').attr('id') + '">');

            valorTotal += parseFloat($('#produto option:selected').attr('id') * qtd);
            $('#valor_total').attr('value', valorTotal);

        } else {
            alert('Preencha todos os campos !');
        }
    });

</script>
</html>