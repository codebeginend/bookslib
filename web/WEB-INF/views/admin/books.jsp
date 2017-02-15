<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Книги</title>
</head>
<body>
<!--Шапка сайта-->
<%@include file="../includes/headeradmin.jsp"%>
<c:url value="/admin/books/excel" var="excelController"/>
<c:url value="/admin/books/pdf" var="pdfController"/>

<div class="row" style="padding: 5px;">
    <div class="col-lg-10">
        <span class="visible-lg"></span>
        <div class="panel panel-info">
            <div class="panel-body">
                <div class="row">
                    <c:forEach var="app" items="${list}">
                        <div class="col-sm-4 col-md-3">
                            <div class="thumbnail">
                                <img src="${app.images}" alt="...">
                                <div class="caption">
                                    <h3>${app.title}</h3>
                                    <h6>Автор:${app.author}</h6>
                                    <h6>${app.year}</h6>
                                    <p>${app.text}</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
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
        <div class="panel panel-info">
            <div class="panel-heading">Фильтр</div>
            <div class="panel-body">
                Тест
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">Статистика</div>
                <div class="panel-body">
                    Общее колличество книг: <c:out value="${stat}"/>
                </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">Выгрузка в виде</div>
            <div class="panel-body">
                <a class="btn btn-default" href="${excelController}">Excel</a>
                <!--<a class="btn btn-default" href="${pdfController}">PDF</a>-->
            </div>
        </div>
    </div>
</div>
</body>
</html>
