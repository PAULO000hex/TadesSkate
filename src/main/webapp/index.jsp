<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <style>
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

            .bg-color{
                background-color: #F7F8F9;
                border-radius: 30px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:if test="${param.loginInvalido}">
                <div class="alert alert-danger mt-3 mb-3" role="alert">
                    Login Inválido!
                </div>
            </c:if>
            
            <div class="row">
                <div class="col text-center">
                    <div class="img-fluid" style="height: 470px; margin-top: -50px;">
                        <img src="img/Tades.png" alt="alt"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="bg-color">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col align-self-center">
                                    <div class="row justify-content-center mb-3">
                                        <img src="src/img/logo.png" alt="">
                                    </div>
                                    <span class="small d-block text-center mb-3" style="font-size: 24px; font-family: Verdana; color: black;">Login</span>
                                    <form action="LoginServlet" method="POST">
                                        <div class="input-group mt-3">
                                            <input type="text" class="form-control" name="cpf" id="cpf" placeholder="Digite o seu CPF">
                                        </div>
                                        <div class="input-group mt-3">
                                            <input type="password" class="form-control" name="senha" placeholder="******">
                                        </div>

                                        <div class="row mt-2 justify-content-center">
                                            <div class="col-md-6 mb-3">
                                                <button type="submit" class="btn btn-block mt-2" style="background-color: #232323; font-family: Verdana; font-size: 22px; color: white;">Entrar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
     <script>
            $(document).ready(function () {
            $('#cpf').mask("000.000.000-00");
        });
        </script>
    
    
</html>
