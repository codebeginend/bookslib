<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 27.12.16
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/authpage.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/authmodal.css" />" rel="stylesheet">
    <link rel="stylesheet" href="http://bootstraptema.ru/plugins/font-awesome/4-4-0/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">

    <script src="<c:url value="/resources/js/authmodal.js"/>" type="text/javascript"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.3.min.js"/> "></script>
    <script type="text/javascript" src="http://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>
    <style>
        .form form {
            width: 300px;
            padding-top: 20px;
        }
        .center{
            margin:auto;
            margin-top: 20%;
            width: 310px;
            background-color: lavender;
            padding: 5px;
        }
    </style>
</head>
<body>
<div class="center" id="loginModal">
    <div class="box">
        <div class="content">
            <div class="error"></div>
            <div class="form loginBox">
                <form class="form" role="form" method="post" action="/bookslib/j_spring_security_check" id="login-nav" name="form_login">
                    <input id="login" class="form-control" type="text" placeholder="Email" name="user_login">
                    <input id="password" class="form-control" type="password" placeholder="Password" name="password_login">
                    <input class="btn btn-default btn-login" type="submit" name="submit" value="Вход">
                </form>
            </div>
        </div>
    </div>
    <div class="box">
        <div class="content registerBox" style="display:none;">
            <div class="form">
                <form method="" html="{:multipart=>true}" data-remote="true" action="" accept-charset="UTF-8">
                    <input id="login" class="form-control" type="text" placeholder="Логин" name="login">
                    <input id="password" class="form-control" type="password" placeholder="Пароль" name="password">
                    <input id="password_confirmation" class="form-control" type="password" placeholder="Повторите пароль" name="password_confirmation">
                    <input class="btn btn-default btn-login" type="submit" name="submit" value="Создать аккаунт">
                </form>
            </div>
        </div>
    </div>
    <div class="forgot login-footer">
    <span>У вас нет аккаунта?
        <a href="javascript: showRegisterForm();">Зарегистрируйтесь</a>
    </span>
    </div>
    <div class="forgot register-footer" style="display:none">
        <span>У Вас есть аккаунт?</span>
        <a href="javascript: showLoginForm();">Войдите</a>
    </div>
</div>
</body>
</html>
