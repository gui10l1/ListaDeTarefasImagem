<%-- 
    Document   : perfil
    Created on : 13/12/2019, 16:54:34
    Author     : famil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seu perfil</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="icon" href="img/lista.png"/>
    </head>
    <body>
        <div class="container">
            <div class="conatiner">
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="HomeServlet">Lista de tarefas</a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="AdicionarServlet">Adicionar tarefa <span class="sr-only">(current)</span></a></li>
                                <li><a href="RemoverServlet">Remover tarefa</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Mais opçôes <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="AtualizarServlet">Ir para o perfil</a></li>
                                        <li><a href="#">Configurações</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="LogoutServlet">Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>



                <h1 class="text-center">Seu perfil</h1>
                <h2>Foto de perfil</h2> <br> 
                <form action="AtualizarServlet" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <img src="ImagemServlet" width="250" height="250" border="1">
                        <br> &nbsp;
                        <input type="file" name="imagem">                       
                    </div> <hr>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <h3>Email:</h3>
                            <input type="email" value="${usuario.email}"  disabled class="form-control" name="email"> <br> 
                        </div> 
                    </div> <hr>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <h3>Senha:</h3>
                            <input type="password" value="${usuario.senha}" class="form-control" name="senha">
                        </div> 
                    </div> <hr>
                    <div class="form-group">
                        <button class="btn btn-success">Atualizar</button>
                    </div>
                </form>
                <div>
                    <p>${msg}</p>
                    <p>${erro}</p>
            </div>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </body>
</html>
