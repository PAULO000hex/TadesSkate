<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href=".../css/style.css" rel="stylesheet">

        <title>Cadastro de Cliente</title>
    </head>
    <body>
        <c:import url="/menu.jsp"/>
        <c:if test="${empty cliente}">
            <form action = CadastrarClienteServlet method="POST" >
                <input type="hidden" name="filial_id" class="filial_id" value="${sessionScope.usuario.fk_filial_id}">
                <div class="half">
                    <div class="space"><h1>Cadastro De Clientes</h1></div>
                    <div class="field">
                        <h2>Nome</h2>
                        <input class="txt" type="text" name="nome">
                    </div>
                    <div class="field">
                        <h2>Sobrenome</h2>
                        <input class="txt" type="text" name="sobrenome"></div>
                    <div class="field">
                        <h2>CPF</h2>
                        <input class="txt" type="text" name="cpf"></div>
                    <div class="field">
                        <h2>E-mail</h2>
                        <input class="txt" type="text" name="email"></div>
                    <div class="field">
                        <h2>Telefone</h2>
                        <input class="txt" type="text" name="telefone">
                    </div>
                </div>
                <div class="half-last">
                    <div class="space">
                        <h1>&nbsp;</h1>
                    </div>
                    <div class="field">
                        <h2>Endereço</h2>
                        <input class="txt" type="text" name="endereco">
                    </div>
                    <div class="field">
                        <h2>Cidade</h2>
                        <input class="txt" type="text" name="cidade">
                    </div>
                    <div class="field">
                        <h2>Estado</h2>
                        <input class="txt" type="text" name="estado">
                    </div>
                    <div class="field">
                        <h2>Bairro</h2>
                        <input class="txt" type="text" name="bairro">
                    </div>
                    <div class="field">
                        <h2>Data de nascimento</h2>
                        <input class="txt" type="date" name="nascimento">                
                    </div>
                    <div class="btn"><input type="submit"></div>  
                </div>
            </form>  
        </c:if>

        <title>Cadastro de Cliente</title>
    </head>
    <c:if test="${not empty cliente}">
        <form action = AlterarClienteServlet method="POST" >
            <input type="hidden" name="filial_id" class="filial_id" value="${sessionScope.usuario.fk_filial_id}">
            <div class="half">
                <div class="space"><h1>Cadastro De Clientes</h1></div>
                <div class="field">
                    <input type="text" name="id" hidden="true" value="${cliente.cliente_id}"/> 
                    <h2>Nome</h2>
                    <input class="txt" type="text" name="nome" value="${cliente.nome}">
                </div>
                <div class="field">
                    <h2>Sobrenome</h2>
                    <input class="txt" type="text" name="sobrenome" value="${cliente.sobrenome}">
                    <div class="field">
                        <h2>CPF</h2>
                        <input class="txt" type="text" name="cpf" value="${cliente.cpf}">
                        <div class="field">
                            <h2>E-mail</h2>
                            <input class="txt" type="text" name="email" value="${cliente.email}">
                            <div class="field">
                                <h2>Telefone</h2>
                                <input class="txt" type="text" name="telefone" value="${cliente.telefone}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="half-last">
                <div class="space">
                    <h1>&nbsp;</h1>
                </div>
                <div class="field">
                    <h2>Endereço</h2>
                    <input class="txt" type="text" name="endereco" value="${cliente.endereco}">
                </div>
                <div class="field">
                    <h2>Cidade</h2>
                    <input class="txt" type="text" name="cidade" value="${cliente.cidade}">
                </div>
                <div class="field">
                    <h2>Estado</h2>
                    <input class="txt" type="text" name="estado" value="${cliente.estado}">
                </div>
                <div class="field">
                    <h2>Bairro</h2>
                    <input class="txt" type="text" name="bairro" value="${cliente.bairro}">
                </div>
                <div class="field">
                    <h2>Data de nascimento</h2>
                    <input class="txt" type="date" name="nascimento" value="${cliente.nascimento}">            
                </div>
                <div class="btn"><input type="submit"></div>  
            </div>
        </form>
    </c:if> 
</body>
</html>
