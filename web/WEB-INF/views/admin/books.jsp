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
            <div class="panel panel-heading">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                    Добавить книгу
                </button>
            </div>
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
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty list}">
                        <div class="alert alert-danger" role="alert">В данной категории нет книг...</div>
                        <div class="alert alert-info" role="alert">Пожалуйста выберите другую категорию...</div>
                    </c:if>
                </div>
            </div>
            <div class="panel-footer">

            </div>
        </div>
    </div>
    <div class="col-lg-2">
        <div class="panel panel-info">
            <div class="panel-heading">Фильтр<a href="<c:url value="/admin/books"/>"><span class="glyphicon glyphicon-remove"/> </a> </div>
            <div class="panel-body">
                <td align="left">
                    <ul>Категорий
                    <c:forEach items="${listCategoryes}" var="category">
                        <li style="list-style-type: none;"><a href="<c:url value='/admin/books/${category.id}' />">${category.name}</a></li>
                    </c:forEach>
                    </ul>
                </td>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">Статистика</div>
                <div class="panel-body">
                    Колличество книг: <c:out value="${stat}"/>
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
<!--Модальное окно для создания новой услуги-->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" style="background-color: rgba(221, 221, 221, 0.91);">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Добавление книги</h4>
            </div>
            <div class="modal-body">

                <form:form action="/bookslib/admin/books/add" commandName="addbook">
                    <div class="form-group">
                        <input name="title" rows="20" class="form-control" id="message-text" placeholder="Введите наименование..."></input>
                    </div>
                    <div class="form-group">
                        <input name="text" rows="20" class="form-control" id="message-text" placeholder="Введите описание..."></input>
                    </div>
                    <div class="form-group">
                        <input name="author" rows="20" class="form-control" id="message-text" placeholder="Введите данные об авторе..."></input>
                    </div>
                    <div class="form-group">
                        <input name="year" rows="20" class="form-control" id="message-text" placeholder="Введите год выпуска..."></input>
                    </div>
                    <div class="form-group">
                        <input name="images" rows="20" class="form-control" id="message-text" placeholder="Введите путь обложки..."></input>
                    </div>
                    <div class="form-group">
                        <form:select cssClass="form-control" title="Выберите категорию книги..." multiple="true" path="id_category" id="listCategoryes">
                            <form:options items="${listCategoryes}" itemValue="id" itemLabel="name" />
                        </form:select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                        <button type="submit" class="btn btn-primary">Отправить</button>
                    </div>
                </form:form>
            </div>

        </div>
    </div>
</div>
</body>
</html>
