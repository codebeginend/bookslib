<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 17.01.17
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../includes/headeradmin.jsp"%>
</body>
<c:url var="addAction" value="/admin/administration/user/add" ></c:url>
                <table class="table">
                    <thead class="table table-bordered">
                    <tr>
                        <th>#</th>
                        <th>Фамилия</th>
                        <th>Имя</th>
                        <th>Отчество</th>
                        <th>Организация</th>
                        <th>Роль</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${usersList}" var="users">
                        <tr>
                            <td scope="row">${users.id}</td>
                            <td>${users.lastname}</td>
                            <td>${users.firstname}</td>
                            <td>${users.patronimyc}</td>
                            <td>${users.name_organization}</td>
                            <td>${users.role}</td>
                            <td><a href="<c:url value='/admin/edit/${book.id}' />" class="glyphicon glyphicon-pencil"></a></td>
                            <td><a href="<c:url value='/admin/remove/${book.id}'/>"  class="glyphicon glyphicon-trash"></a></td>
                        </tr>
                    </c:forEach>

                    <!-- Кнопка для появления модального окна для отправки услуг -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        Добавить пользователя
                    </button>
                    <!--Модальное окно для создания новой услуги-->
                    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content" style="background-color: rgba(221, 221, 221, 0.91);">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Новая заявка</h4>
                                </div>
                                <div class="modal-body">

                                    <form:form action="/scgupcit/admin/administration/user/add" commandName="setUser">
                                       <input type="text" name="username" placeholder="введите логин"/>
                                        <input type="text" name="password" placeholder="введите логин"/>
                                        <input type="text" name="lastname" placeholder="введите логин"/>
                                        <input type="text" name="firstname" placeholder="введите логин"/>
                                        <input type="text" name="patronimyc" placeholder="введите логин"/>
                                        <input type="text" name="id_organization" placeholder="введите org"/>
                                        <input type="text" name="phone" placeholder="введите логин"/>
                                        <input type="text" name="enable" placeholder="введите enable"/>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                                            <button type="submit" class="btn btn-primary">Отправить</button>
                                        </div>
                                    </form:form>
                                </div>

                            </div>
                        </div>
                    </div>
                    </tbody>
                </table>
</html>
