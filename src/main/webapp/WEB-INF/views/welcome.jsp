<%-- 
    Document   : home
    Created on : 19 de mar de 2021, 19:26:24
    Author     : wender
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Exemplo Java com Spring MVC Web!</h1></br>
        <h2>${teste}</h2>
        <div>
            <spring:url value="ExSpringMvcWeb/usuario/listarTodos" var="usuarioCons"/>
            <a class="btn btn-default" href="${usuarioCons}">Consultar</a>
        </div>
    </center>
    </body>
</html>
