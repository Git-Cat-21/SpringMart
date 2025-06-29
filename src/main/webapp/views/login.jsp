<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

    <script>
        window.onload = function () {
            const params = new URLSearchParams(window.location.search);
            const error = params.get("error");
            if (error) {
                alert(error);
                window.history.replaceState({}, document.title, window.location.pathname);
            }
        };
    </script>
</head>
<body>
<h1>Login</h1>
<h5>If administrator login with your credentials</h5>

<form action="loggedin" method="post">
    Enter User ID: <input type="text" name="userid" required><br>
    Enter Password: <input type="password" name="password" required><br>
    <input type="submit" value="Login">
</form>

<p>Don't have an account?</p>
<button onclick="location.href='${pageContext.request.contextPath}/signup'">Sign up here</button>

</body>
</html>
