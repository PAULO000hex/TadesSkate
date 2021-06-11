<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
        <link href=".../css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <title>Cadastrar Funcionário</title>
    </head>

    <body>
        <c:import url="/menu.jsp" />

        <form action="VenderServlet" method="POST">
            <input type="hidden" name="filial_id" class="filial_id" value="${sessionScope.usuario.fk_filial_id}">
            <input type="hidden" name="funcionario_id" class="funcionario_id"
                   value="${sessionScope.usuario.funcionario_id}">

            <div class="half">
                <div class="wrapper">
                    <div class="cliente">
                        <h3>Cliente</h3>
                        <select class="js-example-basic-single" id="cliente" name="fk_cliente_id" required>
                            <option></option>
                            <c:forEach items="${listaClientes}" var="cliente">
                                <option value="${cliente.cliente_id}">${cliente.cpf} | ${cliente.nome} ${cliente.sobrenome}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="produto">
                        <h3>Descrição</h3>
                        <div class="produto_half">
                            <select class="js-example-basic-single" id="produto" name="produto" required>
                                <option></option>
                                <c:forEach items="${listaProdutos}" var="produto">
                                    <option value="${produto.produto_id}" class="${produto.descricao}"
                                            id="${produto.valor}">${produto.produto_id} | ${produto.descricao}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="produto_half">
                            <input type="number" id="qtd" min="1" placeholder="Insira a quantidade" required>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="btn">
                    <input type="button" class="btnAdicionar" value="Adicionar Produto">
                </div>
            </div>

            <div class="half-last">
                <div class="wrapper">
                    <div class="produtos">
                        <table class="table table-dark table-striped" name="tb-produtos" id="tabela">
                            <th>Produto</th>
                            <th>Quantidade</th>
                            <th>Valor Un</th>
                        </table>
                    </div>
                    <label>Valor Total: </label>
                    <input type="text" name="valor_total" id="valor_total" readonly="true">
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
        });
        var prod = 0;

        var map = new Map();

        $('.btnAdicionar').click(function (e) {
            prod++;

            var id_produto = $('#produto option:selected').val();
            var produto = $('#produto option:selected').attr('class');
            var funcionario = $('#funcionario option:selected').val();
            var cliente = $('#cliente option:selected').val();
            var qtd_produto = parseFloat($('#qtd').val());
            var valor_produto = $('#produto option:selected').attr('id');

            var produtos = {id: id_produto, qtd: parseFloat(qtd_produto), descricao: produto, valor: parseFloat(valor_produto)};

            if (map.get(id_produto)) {
                map.get(id_produto).qtd = parseFloat(map.get(id_produto).qtd + qtd_produto);
            } else {
                map.set(id_produto, produtos);
            }
            $('.table-row').empty();

            var tb = '';

            map.forEach((valor, chave, map) => {
                console.log(valor.descricao);

//                tb += `
//                <tr>
//                <td value="${valor.id}">${valor.descricao}</td>
//                <td value="${valor.qtd}">${valor.qtd}</td>
//                <td value="${valor.valor}">${valor.valor}</td>
//                </tr>
//                `;
                tb += '<tr class="table-row"><td value="' + valor.id + '">' + valor.descricao + '</td><td value="' + valor.qtd + '">' + valor.qtd + '</td><td value="' + valor.valor + '">' + valor.valor + '</td></tr>';

            });

            console.log(tb);

            $('#tabela').append(tb);

            $('.half').append('<input type="hidden" id="produto_id' + prod + '" name="produto_id" value="' + id_produto + '">');
            $('.half').append('<input type="hidden" id="descricao' + prod + '" name="descricao" value="' + produto + '">');
            $('.half').append('<input type="hidden" id="qtd' + prod + '" name="qtd" value="' + qtd_produto + '">');
            $('.half').append('<input type="hidden" id="valor_un' + prod + '" name="valor_un" value="' + valor_produto + '">');

            valorTotal += parseFloat(valor_produto * qtd_produto);

            $('#valor_total').attr('value', valorTotal);

        });
    </script>
</html>