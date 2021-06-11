<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
    <link href=".../css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<div class="menu">
    <div class="message">
        <h3>Olá ${sessionScope.usuario.nome} - ${sessionScope.usuario.departamento}</h3>
    </div>
    <div class="logo">
        <img src="/TadesSkate/img/Tades.png" alt="alt"/>
    </div>
    <hr>
    <ul class="cd-accordion margin-top-lg margin-bottom-lg">
        <c:if test="${sessionScope.usuario.isAdmin()}">
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <a class="cd-accordion__label cd-accordion__label--icon-img" href="\TadesSkate\Protegido\VendaServlet"><i class="fa fa-shopping-basket"></i><span>Vender</span></a>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
            <input class="cd-accordion__input" type="checkbox" name ="group-2" id="group-2">
            <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-2"><i class="fa fa-chevron-down"></i><span>Funcionários</span></label>

            <ul class="cd-accordion__sub cd-accordion__sub--l2">
                <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Funcionarios/cadastrarFuncionario.jsp"><i class="fa fa-plus"></i><span>Cadastrar Funcionário</span></a></li>
                <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/FuncionariosServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
            </ul>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-3" id="group-3">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-3"><i class="fa fa-chevron-down"></i><span>Produtos</span></label>

                <ul class="cd-accordion__sub cd-accordion__sub--l3">
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Produtos/CadastrarProduto.jsp"><i class="fa fa-plus"></i><span>Cadastrar Produto</span></a></li>
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/ProdutosServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
                </ul>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-5" id="group-5">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-5"><i class="fa fa-chevron-down"></i><span>Relatórios</span></label>

                <ul class="cd-accordion__sub cd-accordion__sub--l4">
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Filiais/CadastrarFilial.jsp"><i class="fa fa-align-justify"></i><span>Relatório Filial</span></a></li>
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/FilialServlet"><i class="fa fa-align-justify"></i><span>Relatório Geral</span></a></li>
                </ul>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-1" id="group-1">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-1"><i class="fa fa-chevron-down"></i><span>Clientes</span>  </label>

                <ul class="cd-accordion__sub cd-accordion__sub--l1">
                    <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Clientes/CadastrarClientes.jsp"><i class="fa fa-plus"></i><span>Cadastrar Cliente</span></a></li>
                    <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Clientes/ClienteServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
                </ul>
            </li>
        </c:if>
        
        <c:if test="${sessionScope.usuario.isRH()}">
            <li class="cd-accordion__item cd-accordion__item--has-children">
            <input class="cd-accordion__input" type="checkbox" name ="group-2" id="group-2">
            <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-2"><i class="fa fa-chevron-down"></i><span>Funcionários</span></label>

            <ul class="cd-accordion__sub cd-accordion__sub--l2">
                <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Funcionarios/cadastrarFuncionario.jsp"><i class="fa fa-plus"></i><span>Cadastrar Funcionário</span></a></li>
                <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/FuncionariosServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
            </ul>
            </li>
        </c:if>
        
        <c:if test="${sessionScope.usuario.isGerente()}">
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <a class="cd-accordion__label cd-accordion__label--icon-img" href="\TadesSkate\Protegido\VendaServlet"><i class="fa fa-shopping-basket"></i><span>Vender</span></a>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-1" id="group-1">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-1"><i class="fa fa-chevron-down"></i><span>Clientes</span>  </label>

                <ul class="cd-accordion__sub cd-accordion__sub--l1">
                    <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Clientes/CadastrarClientes.jsp"><i class="fa fa-plus"></i><span>Cadastrar Cliente</span></a></li>
                    <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Clientes/ClienteServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
                </ul>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-4" id="group-4">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-4"><i class="fa fa-chevron-down"></i><span>Filiais</span></label>

                <ul class="cd-accordion__sub cd-accordion__sub--l4">
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Filiais/CadastrarFilial.jsp"><i class="fa fa-plus"></i><span>Cadastrar Filial</span></a></li>
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/FilialServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
                </ul>
            </li>
        </c:if>
            
        <c:if test="${sessionScope.usuario.isTecnologia()}">
            <li class="cd-accordion__item cd-accordion__item--has-children">
            <input class="cd-accordion__input" type="checkbox" name ="group-2" id="group-2">
            <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-2"><i class="fa fa-chevron-down"></i><span>Funcionários</span></label>

            <ul class="cd-accordion__sub cd-accordion__sub--l2">
                <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Funcionarios/cadastrarFuncionario.jsp"><i class="fa fa-plus"></i><span>Cadastrar Funcionário</span></a></li>
                <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/FuncionariosServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
            </ul>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-3" id="group-3">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-3"><i class="fa fa-chevron-down"></i><span>Produtos</span></label>

                <ul class="cd-accordion__sub cd-accordion__sub--l3">
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Produtos/CadastrarProduto.jsp"><i class="fa fa-plus"></i><span>Cadastrar Produto</span></a></li>
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/ProdutosServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
                </ul>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-5" id="group-5">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-5"><i class="fa fa-chevron-down"></i><span>Relatórios</span></label>

                <ul class="cd-accordion__sub cd-accordion__sub--l4">
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Filiais/CadastrarFilial.jsp"><i class="fa fa-align-justify"></i><span>Relatório Filial</span></a></li>
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/FilialServlet"><i class="fa fa-align-justify"></i><span>Relatório Geral</span></a></li>
                </ul>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-1" id="group-1">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-1"><i class="fa fa-chevron-down"></i><span>Clientes</span>  </label>

                <ul class="cd-accordion__sub cd-accordion__sub--l1">
                    <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Clientes/CadastrarClientes.jsp"><i class="fa fa-plus"></i><span>Cadastrar Cliente</span></a></li>
                    <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Clientes/ClienteServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
                </ul>
            </li>
        </c:if>
            
        <c:if test="${sessionScope.usuario.isBackOffice()}">
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-2" id="group-2">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-2"><i class="fa fa-chevron-down"></i><span>Funcionários</span></label>

                <ul class="cd-accordion__sub cd-accordion__sub--l2">
                    <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/FuncionariosServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
                </ul>
            </li>
        </c:if>
            
        <c:if test="${sessionScope.usuario.isFinanceiro()}">
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-1" id="group-1">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-1"><i class="fa fa-chevron-down"></i><span>Clientes</span>  </label>

                <ul class="cd-accordion__sub cd-accordion__sub--l1">
                    <li class="cd-accordion__item submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Clientes/ClienteServlet"><i class="fa fa-wrench"></i><span>Manutenção</span></a></li>
                </ul>
            </li>
            
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name ="group-5" id="group-5">
                <label class="cd-accordion__label cd-accordion__label--icon-folder" for="group-5"><i class="fa fa-chevron-down"></i><span>Relatórios</span></label>

                <ul class="cd-accordion__sub cd-accordion__sub--l4">
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/Protegido/Filiais/CadastrarFilial.jsp"><i class="fa fa-align-justify"></i><span>Relatório Filial</span></a></li>
                    <li class="cd-accordion__item  submenu"><a class="cd-accordion__label cd-accordion__label--icon-img" href="/TadesSkate/FilialServlet"><i class="fa fa-align-justify"></i><span>Relatório Geral</span></a></li>
                </ul>
            </li>
        </c:if>
        
        <c:if test="${sessionScope.usuario.isComercial()}">
            <li class="cd-accordion__item cd-accordion__item--has-children">
                <a class="cd-accordion__label cd-accordion__label--icon-img" href="\TadesSkate\Protegido\VendaServlet"><i class="fa fa-shopping-basket"></i><span>Vender</span></a>
            </li>
        </c:if>
        
        <li class="cd-accordion__item cd-accordion__item--has-children"><a class="cd-accordion__label cd-accordion__label--icon-img" href="<c:url value="/LogoutServlet"/>" class="ms-3">Sair</a></p></li>
        
    </ul> 
</div>



