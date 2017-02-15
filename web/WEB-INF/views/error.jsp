<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Доступ закрыт!</h2>
<h4>${errorMsg}</h4>
<li><a href="<c:url value="/j_spring_security_logout"/>">Выход</a></li>
</body>
</html>
