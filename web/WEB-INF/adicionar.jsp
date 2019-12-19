<%-- 
    Document   : adicionar
    Created on : 06/12/2019, 22:07:54
    Author     : Aluno07
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar tarefas</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="icon" href="img/lista.png"/>
    </head>
    <body>
        <div class="container">
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
                            <li class="active"><a href="RemoverServlet">Remover tarefa</a></li>
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


            <h2 class="text-center">Adicionar tarefas</h2>
            <form action="AdicionarServlet" method="POST" enctype="multipart/form-data">
                <div class="row">
                    <div class="form-group">
                        <label>Titulo</label>
                        <input type="text" name="assunto" class="form-control" placeholder="Titulo da tarefa aqui">
                    </div>
                    <div class="form-group">
                        <label>Imagem (opcional)</label>
                        <input type="file" name="imagem">
                    </div>
                </div>

                <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Imagem</th>
                            <th scope="col">Título</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${tarefas}" var="t">
                            <tr>
                                <th scope="row">${t.id}</th>
                                <td><img src="MostrarImagemTarefaServlet?imagem=${t.caminhoImagem}" width="64" height="64"></td>
                                <td>${t.assunto}</td>
                                <td><c:if test="${t.finalizada}">Finalizada</c:if> <c:if test="${!t.finalizada}">Em aberto</c:if></td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="row">
                    <div class="form-group">
                        <button class="btn btn-warning" type="submit">Adicionar</button>
                    </div>
                </div>
                <c:if test="${erro.length() > 0}"> 
                    <p class="alert alert-danger"><span class="glyphicon glyphicon-exclamation-sign"></span> ${erro} </p>
                </c:if>
            </form>
            <hr>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </body>
</html>
