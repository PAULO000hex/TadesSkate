<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href=".../css/style.css" rel="stylesheet">
        <link href="../../css/style.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <title>Cadastrar Funcionário</title>
    </head>
    <body>
        <c:import url="/menu.jsp"/>
        <c:if test="${empty funcionario}">   
            <form action="CadastrarFuncionarioServlet" method="POST" >
                <div class="half">
                    <div class="space"><h1>Cadastrar</h1></div>
                    <div class="field">
                        <h2>ID da Filial</h2>
                        <input class="txt" type="text" name="filial_id" class="filial_id" required="true" value="${sessionScope.usuario.fk_filial_id}">
                    </div>
                    <div class="field">
                        <h2>Nome</h2>
                        <input class="txt" type="text" name="nome" id="nome">
                    </div>
                    <div class="field">
                        <h2>Sobrenome</h2>
                        <input class="txt" type="text" name="sobrenome"></div>
                    <div class="field">
                        <h2>CPF</h2>
                        <input class="txt" type="text" name="CPF" id="cpf"></div>
                    <div class="field">
                        <h2>E-mail</h2>
                        <input class="txt" type="text" name="email"></div>
                    <div class="field">
                        <h2>Telefone</h2>
                        <input class="txt" type="text" name="telefone" id="telefone">
                    </div>
                    <div class="field">
                        <h2>Data de nascimento</h2>
                        <input class="txt" type="date" name="nascimento">                
                    </div>
                </div>
                <div class="half-last">
                    <div class="space">
                        <h1>&nbsp;</h1>
                    </div>
                    <div class="field">
                        <h2>Departamento</h2>
                        <select class="txt" name="departamento" required="true">
                            <option value="">Selecione</option>
                            <option value="RH">RH</option>
                            <option value="Tecnologia">Tecnologia</option>
                            <option value="BackOffice">BackOffice</option>
                            <option value="Gerência">Gerência</option>
                            <option value="Financeiro">Financeiro</option>
                            <option value="Comercial">Comercial</option>
                        </select>
                    </div>
                    <div class="field">
                        <h2>Salário</h2>
                        <input class="txt" type="text" name="salario">              
                    </div>
                    <div class="field">
                        <h2>Endereço</h2>
                        <input class="txt" type="text" name="endereco">                
                    </div>
                    <div class="field">
                        <h2>Bairro</h2>
                        <input class="txt" type="text" name="bairro">                
                    </div>
                    <div class="field">
                        <h2>Cidade</h2>
                        <input class="txt" type="text" name="cidade">               
                    </div>
                    <div class="field">
                        <h2>Estado</h2>
                        <input class="txt" type="text" id="estado" name="estado">                
                    </div>
                    <div class="field">
                        <h2>Senha</h2>
                        <input class="txt" type="text" id="estado" name="senha">                
                    </div>
                    <div class="btn"><input type="submit"></div>
                </div>
            </form>
        </c:if>
        <c:if test="${not empty funcionario}">
            <form action="AlterarFuncionarioServlet" method="POST" >
                <input type="hidden" name="filial_id" class="filial_id" value="${sessionScope.usuario.fk_filial_id}">
                <div class="half">
                    <div class="space"><h1>Editar</h1></div>
                    <div class="field">
                        <input class="txt" type="text" name="id" hidden="true" value="${funcionario.funcionario_id}">
                    </div>
                    <div class="field">
                        <h2>Nome</h2>
                        <input class="txt" type="text" name="nome" value="${funcionario.nome}">
                    </div>
                    <div class="field">
                        <h2>Sobrenome</h2>
                        <input class="txt" type="text" name="sobrenome" value="${funcionario.sobrenome}"></div>
                    <div class="field">
                        <h2>CPF</h2>
                        <input class="txt" type="text" name="CPF" id="cpf" value="${funcionario.CPF}"></div>
                    <div class="field">
                        <h2>E-mail</h2>
                        <input class="txt" type="text" name="email" value="${funcionario.email}"></div>
                    <div class="field">
                        <h2>Telefone</h2>
                        <input class="txt" type="text" name="telefone" id="telefone" value="${funcionario.telefone}">
                    </div>
                    <div class="field">
                        <h2>Data de nascimento</h2>
                        <input class="txt" type="date" name="nascimento" value="${funcionario.nascimento}">                
                    </div>
                </div>
                <div class="half-last">
                    <div class="space">
                        <h1>&nbsp;</h1>
                    </div>
                    <div class="field">
                        <h2>Departamento</h2>
                        <input class="txt" type="text" name="departamento" value="${funcionario.departamento}">               
                    </div>
                    <div class="field">
                        <h2>Salário</h2>
                        <input class="txt" type="text" name="salario" value="${funcionario.salario}">              
                    </div>
                    <div class="field">
                        <h2>Endereço</h2>
                        <input class="txt" type="text" name="endereco" value="${funcionario.endereco}">                
                    </div>
                    <div class="field">
                        <h2>Bairro</h2>
                        <input class="txt" type="text" name="bairro" value="${funcionario.bairro}">                
                    </div>
                    <div class="field">
                        <h2>Cidade</h2>
                        <input class="txt" type="text" name="cidade" value="${funcionario.cidade}">               
                    </div>
                    <div class="field">
                        <h2>Estado</h2>
                        <input class="txt" type="text" name="estado"  value="${funcionario.estado}">                
                    </div>
                    <div class="field">
                        <h2>Senha</h2>
                        <input class="txt" type="text" id="estado" name="senha" value="${funcionario.senha}">                
                    </div>
                    <div class="btn"><input type="submit"></div>
                </div>
            </form>
        </c:if>

    </body>
    <script>
            $(document).ready(function () {
            $('#telefone').mask("(00) 00000-0000");
            $('#cpf').mask("000.000.000-00");
        });
        </script>
</html>

<!--     




/Produtos

-->