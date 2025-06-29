<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to OOAD</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">

</head>
<body>
<h1>Welcome</h1>
<button onclick="location.href='${pageContext.request.contextPath}/signup'">Signup Here</button>
<button onclick="location.href='${pageContext.request.contextPath}/login'">Login Here</button>
</body>
</html>
