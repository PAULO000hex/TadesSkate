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
                <img src=".../img/Tades.png" alt="alt" />
            </div>
            <hr>
            <div class="options">
                <ul>
                    <li>Venda
                        <ul>Vender</ul>
                        <ul>Consultar Vendas</ul>
                    </li>
                    <li>Clientes
                        <ul><a href=".../Clientes/CadastrarClientes.jsp">Cadastrar Cliente</a></ul>
                        <ul><a href=".../listaClientes.jsp">Consultar Clientes</a></ul>
                        <ul>Alterar Cliente</ul>
                        <ul>Excluir Cliente</ul>
                    </li>
                    <li>Produtos
                        <ul><a href=".../Produtos/CadastrarProduto.jsp">Cadastrar Produto</a></ul>
                        <ul><a href="ProdutosServlet.jsp">Consultar Produtos</a></ul>
                        <ul>Alterar Produto</ul>
                        <ul>Excluir Produto</ul>
                    </li>
                    <li>Funcionários
                        <ul><a href="cadastrarFuncionario.jsp">Cadastrar Funcionário</a></ul>
                        <ul><a href="listaFuncionarios.jsp">Consultar Funcionários</ul></a>
                        <ul>Alterar Funcionário</ul>
                        <ul>Excluir Funcionário</ul>
                    </li>
                    <li>Filiais
                        <ul><a href=".../Filiais/CadastrarFilial.jsp">Cadastrar Filial</a></ul>
                        <ul><a href="listaFiliais.jsp">Consultar Filiais</a></ul>
                        <ul>Alterar Filial</ul>
                        <ul>Excluir Filial</ul>
                    </li>
                </ul>
            </div>
        </div>            
        <div class="half">
            <div class="wrapper">
                <div class="cliente">
                    <h3>CPF</h3>
                    <select class="js-example-basic-single" id="cliente" name="cliente">
                        <option></option>
                        <option value="cliente_id">Nome Sobrenome | CPF </option>
                        <option value="cliente_id">Nome Sobrenome | CPF </option>
                        <option value="cliente_id">Nome Sobrenome | CPF </option>
                        <option value="cliente_id">Nome Sobrenome | CPF </option>
                    </select>
                </div>
                <div class="produto">
                    <h3>Descrição</h3>
                    <select class="js-example-basic-single" name="produto">
                        <option></option>
                        <option value="produto_id">Código do produto | Descrição</option>
                        <option value="produto_id">Código do produto | Descrição</option>
                        <option value="produto_id">Código do produto | Descrição</option>
                        <option value="produto_id">Código do produto | Descrição</option>
                    </select>
                    <input type="number" placeholder="Insira a quantidade">
                </div>
            </div>
            <div class="btn">
                <input type="button" class="btnAdicionar" value="Adicionar Produto">
            </div>
        </div>   
        <div class="half-last">
            <div class="wrapper">
                <div class="produtos">
                    <table class="table table-dark table-striped">                
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th>Valor Un</th>
                    </table>
                </div>
            </div>
            <div class="btn">
                <input type="button" class="btnFinalizar" value="Finalizar Venda">
            </div>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            $('.js-example-basic-single').select2();
        });
        $('#cliente').change(function () {
            var cliente = $('#cliente').val();
            var dados = {'id': cliente};
            console.log(dados);
        });
        $('#produto').change(function () {
            var produto = $('#produto').val();
            var dados = {'id': produto};
            console.log(dados);
        });
        
        $('.btnAdicionar').click(function(){
            
        });
    </script>
</html>