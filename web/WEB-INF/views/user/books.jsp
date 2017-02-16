 <%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Все книги</title>
</head>
<body>
<!--Шапка сайта-->
<%@include file="../includes/header.jsp"%>
<!-- основная сетка-->
<div class="row" style="padding: 5px;">
    <div class="col-lg-10">
        <span class="visible-lg"></span>
        <div class="panel panel-info">
            <div class="panel-body">
                <div class="row">
                    <c:forEach var="app" items="${app}">
                        <div class="col-sm-4 col-md-3">
                            <div class="thumbnail">
                                <img src="${app.images}" alt="...">
                                <div class="caption">
                                    <h3>${app.title}</h3>
                                    <h6>Автор:${app.author}</h6>
                                    <h6>${app.year}</h6>
                                    <p>${app.text}</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Добавить к себе</a></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="panel-footer">

            </div>
        </div>
    </div>
    <div class="col-lg-2">
    </div>
</div>
</body>
</html>
