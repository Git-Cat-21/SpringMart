<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Sign Up </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css">

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
<h1>Hello World! This is the signup page</h1>
<form action="registered" method="post" >
    Enter Your Name: <input type="text" name="name" required><br>
    Enter Your Email-ID: <input type="email" name="email" required><br>
    Enter Your Password: <input type="password" id="password" name="password" required><br>
    Confirm Password: <input type="password" id="checkpassw" name="checkpassw" required><br>
    Enter Your Address: <textarea name="address" required></textarea><br>
    Enter Your Phone Number: <input type="text" name="phno" required><br>
    Enter Country: <select name="country" id="country" required>
    <option value="">Select a country</option>
    <option value="USA">United States</option>
    <option value="China">China</option>
    <option value="India">India</option>
    <option value="Germany">Germany</option>
    <option value="UK">United Kingdom</option>
    <option value="France">France</option>
    <option value="Japan">Japan</option>
    <option value="Canada">Canada</option>
    <option value="Australia">Australia</option>
    <option value="Brazil">Brazil</option>
</select><br>
    <input type="submit" value="Submit">
</form>
<p>Already have an account?</p>
<button onclick="location.href='${pageContext.request.contextPath}/login'">Login here</button>


</body>
</html>
