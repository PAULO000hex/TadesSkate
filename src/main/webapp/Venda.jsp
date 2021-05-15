<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </style>
    </head>

    <body>
        <div class="menu">
            <div class="message">
                <h3>Olá Vitor - Tecnologia</h3>
            </div>
            <div class="logo">
                <img src="img/Tades.png" alt="alt" />
            </div>
            <hr>
            <div class="options">
                <ul>
                    <li>Venda
                        <ul><a href="Venda.jsp">Vender</ul></a>
                        <ul>Consultar Vendas</ul>
                    </li>
                    <li>Clientes
                        <ul><a href="Clientes/CadastrarClientes.jsp">Cadastrar Cliente</a></ul>
                        <ul><a href=".../listaClientes.jsp">Consultar Clientes</a></ul>
                    </li>
                    <li>Produtos
                        <ul><a href="Produtos/CadastrarProduto.jsp">Cadastrar Produto</a></ul>
                        <ul><a href="ProdutosServlet.jsp">Consultar Produtos</a></ul>
                    </li>
                    <li>Funcionários
                        <ul><a href="cadastrarFuncionario.jsp">Cadastrar Funcionário</a></ul>
                        <ul><a href="listaFuncionarios.jsp">Consultar Funcionários</ul></a>
                    </li>
                    <li>Filiais
                        <ul><a href="Filiais/CadastrarFilial.jsp">Cadastrar Filial</a></ul>
                        <ul><a href="listaFiliais.jsp">Consultar Filiais</a></ul>

                    </li>
                </ul>
            </div>
        </div>     
        <form action="VendaServlet" method="POST">
            <div class="half">
                <div class="wrapper">
                    <div class="cliente">
                        <h3>CPF</h3>
                        <select class="js-example-basic-single" id="cliente" name="cliente">
                            <option></option>
                            <option value="1">Nome Sobrenome | CPF </option>
                            <option value="2">Nome Sobrenome | CPF </option>
                            <option value="cliente_id">Nome Sobrenome | CPF </option>
                            <option value="cliente_id">Nome Sobrenome | CPF </option>
                        </select>
                    </div>
                    <div class="produto">
                        <h3>Descrição</h3>
                        <select class="js-example-basic-single" id="produto" name="produto">
                            <option></option>
                            <option value="1">Código do produto | Descrição</option>
                            <option value="2">Código do produto | Descrição</option>
                            <option value="produto_id">Código do produto | Descrição</option>
                            <option value="produto_id">Código do produto | Descrição</option>
                        </select>
                        <input type="number" id="qtd" placeholder="Insira a quantidade">
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
                        <table class="table table-dark table-striped" id="tabela">                
                            <th>Produto</th>
                            <th>Quantidade</th>
                            <th>Valor Un</th>
                        </table>
                    </div>
                    <input type="text" value="10.0" name="valor_total">
                    <input type="text" value="1" name="fk_funcionario_id">
                    <input type="text" value="2" name="fk_cliente_id">

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
            var dados = {'id': cliente};

            $.ajax({
                url: 'ClienteVendaServlet?cpf=' + cliente,
                method: 'GET',
                data: dados,
                dataType: 'json'
            }).done(function (resposta) {
                alert('entrou no 1')

                console.log(resposta);
            });

            $.ajax('ClienteVendaServlet?cpf=' + cliente).done(function () {
//Sucesso
                alert('entrou no 2')
                // location.reload();
            })
                    .fail(function () {
                        alert("error");
                    });

            console.log(dados);
        });
        $('#produto').change(function () {
            var produto = $('#produto').val();
            var dados = {'id': produto};
        });

        $('.btnAdicionar').click(function () {
            var qtd = $('#qtd').val();
            var html = '<tr><td value="P1">P1</td><td name="qtd1" value="' + qtd + '">' + qtd + '</td><td name="valor_un1" value="2">2</td></tr>';
            $('#tabela').append(html);
            $('.half').append('<input type="hidden" name="produto_id" value="1">');
            $('.half').append('<input type="hidden" name="descricao" value="P1">');
            $('.half').append('<input type="hidden" name="qtd" value="' + qtd + '">');
            $('.half').append('<input type="hidden" name="valor_un" value="2">');
        });
    </script>
</html>