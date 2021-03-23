<%-- 
    Document   : usuarioCons
    Created on : 20 de mar de 2021, 15:22:50
    Author     : wender
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Ususarios</title>
        <spring:url var="css" value="/static/css/bootstrap.css"/>
        <link type="text/css" rel="stylesheet" href="${css }"/>
    </head>
    <body>
        <div class="container">
            <h1>Lista de Usuários</h1>
            <hr>
            <div>
                <spring:url value="/usuario/novo" var="novo"/>
                <a class="btn btn-default" href="${novo }">Novo Usuário</a>               
            </div>
            <hr>

            <div class="${message == null ? 'panel-default' : 'panel-success'}">

                <div class="panel-heading">
                    <span>${message == null ? '&nbsp;' : message}</span>
                </div>

                <table class="table table-striped table-condensed">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOME</th>
                            <th>SEXO</th>
                            <td>DATA NASCIMENTO</td>
                            <th>E-MAIL</th>               
                            <th>AÇÃO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usuario" items="${usuarios }">
                            <tr>
                                <td>${usuario.id }</td>
                                <td>${usuario.nome }</td>
                                <td>${usuario.sexo.desc }</td>
                                <td>
                                    <f:parseDate var="date" value="${usuario.dataNascimento }" pattern="yyyy-MM-dd" type="date"/>
                                    <f:formatDate value="${date }" pattern="dd/MM/yyyy" type="date"/>
                                </td>
                                <td>${usuario.email }</td>
                                <td>
                                    <spring:url value="/usuario/alterar/${usuario.id }" var="alterar"/>
                                    <a class="btn btn-info" href="${alterar }" >Editar</a>
                                    <spring:url value="/usuario/excluir/${usuario.id }" var="excluir"/>
                                    <a class="btn btn-danger" href="${excluir }" >Excluir</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <hr>
            <footer class="footer">
                <p>Java com Spring MVC Web!....</p>
            </footer>
        </div>
    </body>
</html>