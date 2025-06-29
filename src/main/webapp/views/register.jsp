<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
    <div class="container">
        <h1>Hey ${name}, your user id is ${userid}</h1>
        <button onclick="location.href='${pageContext.request.contextPath}/login'">Login</button>
    </div>
</body>
</html>
