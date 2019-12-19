<%-- 
    Document   : home
    Created on : 02/12/2019, 22:00:31
    Author     : Aluno07
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Tarefa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de tarefas</title>
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

            <c:if test="${tarefas.size() > 0}">
                <h2>Lista de Tarefas</h2>
                <p>Selecione as tarefas que deseja finalizar</p>
                <form action="FinalizarServlet" method="POST">
                    <table class="table">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Título</th>
                                <th scope="col">Status</th>
                                <th scope="col">Finalizar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${tarefas}" var="t">
                                <tr>
                                    <th scope="row">${t.id}</th>
                                    <td>${t.assunto}</td>
                                    <td><c:if test="${t.finalizada}">Finalizada</c:if> <c:if test="${!t.finalizada}">Em aberto</c:if></td>
                                    <td><input type="checkbox" value="${t.id}" name="idtarefas"></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="form-group">
                        <button type="submit" class="btn btn-danger">Finalizar tarefa</button>
                    </div>
                </form>
            </c:if>

            <c:if test="${tarefas.size() == 0}"><h2 class="text-center">Sua lista de tarefas está vazia!</h2></c:if>


            <hr>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </body>
</html>
