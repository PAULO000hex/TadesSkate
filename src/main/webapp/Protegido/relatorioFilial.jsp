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
        <link href="/TadesSkate/css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <title>Relatório Geral</title>
    </head>
    <body>
        <c:import url="/menu.jsp"/>      
        <input type="hidden" name="filial_id" class="filial_id" value="${sessionScope.usuario.fk_filial_id}">
        <div class="fullpage">
            <div class="search-wrapper">
            </div>
            <div class="info-wrapper">
                <hr>
                <div class="info-input">
                    <input class="info-btn" type="button" id="filiais" name="filial" value="Filial">
                </div>
                <div class="info-input">
                    <input class="info-btn" type="button" id="produtos" name="produto" value="Produtos mais vendidos">
                </div>

                <table id="tb">
                    <th>ID</th>
                    <th>Vendedor</th>
                    <th>Valor Total</th>
                    <th>Data da venda</th>
                    <th>Cliente</th>

                    <c:forEach items="${listaClientes}" var = "cliente" >
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            $('.js-example-basic-single').select2();
        });

        let tbFiliais = `
                <th>ID</th>
                <th>Data da venda</th>
                <th>Cliente</th>                
                <th>Vendedor</th>
                <th>Valor Total</th>`;
        let tbProdutos = `                    
                <th>ID</th>
                <th>Descrição</th>
                <th>Quantidade Vendida</th>
                <th>Valor Total</th>`;

        $('#filiais').click(() => {

            let dataInicio = $('#dataInicio').val();
            let dataFim = $('#dataFim').val();

            const dados = {
                'dataInicio': dataInicio,
                'dataFim': dataFim
            };

            let tb = ``;
            $.get("RelatorioVendaFilialServlet", dados, (response) => {
                console.log(response);
                $('#tb').empty();
                $('#tb').append(tbFiliais);

                $.each(response, function (key, value) {
                    tb += '<tr><td>'+value.venda_id+'</td><td>'+value.nome_vendedor+'</td><td>'+value.data+'</td>    <td>'+value.nome_cliente+'</td><td>'+value.valor_total+' R$</td></tr>';
                });
                $('#tb').append(tb);
            });


        });
        $('#produtos').click(() => {

            let dataInicio = $('#dataInicio').val();
            let dataFim = $('#dataFim').val();

            const dados = {
                'dataInicio': dataInicio,
                'dataFim': dataFim
            };

            let tb = ``;

            $.get("RelatorioProdutoFilialServlet", dados, (response) => {
                console.log(response);
                $('#tb').empty();
                $('#tb').append(tbProdutos); //Ou append();

                $.each(response, function (key, value) {
                    tb += '<tr><td>'+value.produto_id+'</td><td>'+value.descricao+'</td><td>'+value.qtdcompra+'</td>  <td>'+value.total+' R$</td></tr>';
                });
                $('#tb').append(tb);
            });
        });
    </script>
</html>