<div class="menu">
    <div class="message">
        <h3>Olá ${sessionScope.usuario.nome} - ${sessionScope.usuario.departamento}</h3>
    </div>
    <div class="logo">
        <img src=".../img/Tades.png" alt="alt"/>
    </div>
    <hr>
    <div class="options">
        <ul>
            <li>Venda
                <ul><a href="/TadesSkate/VendaTesteServlet"> Vender</a></ul>
            </li>
            <li>Clientes
                <ul><a href="/TadesSkate/Clientes/CadastrarClientes.jsp"> Cadastrar Cliente </a></ul>
                <ul><a href="/TadesSkate/Clientes/ClienteServlet"> Consultar e Alterar Clientes </a> </ul>
            <li>Produtos
                <ul><a href="/TadesSkate/Produtos/CadastrarProduto.jsp">Cadastrar Produto</a></ul>
                <ul><a href="/TadesSkate/ProdutosServlet"> Consultar e Alterar Produtos</a></ul>
            <li>Funcionarios
                <ul><a href="/TadesSkate/Funcionarios/cadastrarFuncionario.jsp">Cadastrar Funcionario</a></ul>
                <ul><a href="/TadesSkate/FuncionariosServlet">Consultar e Alterar Funcionario </a></ul>
            <li>Filiais
                <ul><a href = "/TadesSkate/Filiais/CadastrarFilial.jsp">Cadastrar Filial</a> </ul>
                <ul><a href= "/TadesSkate/FilialServlet"> Consultar Filiais</a> </ul>
        </ul>
    </div>
</div>


