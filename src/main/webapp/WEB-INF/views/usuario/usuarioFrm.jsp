<%-- 
    Document   : usuarioFrm
    Created on : 19 de mar de 2021, 20:05:03
    Author     : wender
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Usuário</title>
        <spring:url var="css" value="/static/css/bootstrap.css"/>
        <link type="text/css" rel="stylesheet" href="${css }"/>
    </head>
    <body>
        <div class="container">
            <h1>Cadastro de Usuários</h1>
            <hr>
            <div>

                <spring:url value="/usuario/listarTodos" var="usuarioCons"/>
                <a class="btn btn-default" href="${usuarioCons }">Consultar</a>
            </div>
            <hr>
            <div>
                <spring:url value="/usuario/salvar" var="salvar"/>
                <form:form modelAttribute="usuario" action="${salvar }" method="post">
                    <form:hidden path="id"/>
                    <div class="form-group">
                        <label for="nome">Nome: </label>
                        <form:input path="nome" class="form-control"/>  
                        <form:errors path="nome" cssClass="label label-danger"/>
                    </div>
                    <div class="form-group">
                        <label for="sexo">Sexo: </label>
                        <form:select path="sexo" class="form-control">
                            <form:options items="${sexos }" itemLabel="desc"/>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="dataNascimento">Data Nascimento: </label>
                        <form:input path="dataNascimento"  class="form-control" type="date"/>  
                        <form:errors path="dataNascimento" cssClass="label label-danger"/>
                    </div>
                    <div class="form-group">
                        <label for="email">E-mail: </label>
                        <form:input path="email"  class="form-control"/>     
                        <form:errors path="email" cssClass="label label-danger"/>
                    </div>
                    <div class="form-group">
                        <label for="senha">Senha: </label>
                        <form:password path="senha"  class="form-control"/>   
                        <form:errors path="senha" cssClass="label label-danger"/>
                    </div>            
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Confirmar</button>
                    </div>
                </form:form>
            </div>
            <hr>
            <footer class="footer">
                <p>Java com Spring MVC Web!....</p>
            </footer>
        </div>
    </body>
</html>
