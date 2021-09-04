<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link rel="icon" href="https://image.flaticon.com/icons/svg/2957/2957872.svg" sizes="16x16">
</head>

<body>

<div class="container">
    <div>
        <!-- Logo and name of system -->
        <div style="text-align: center">
            <img src="https://image.flaticon.com/icons/svg/2957/2957872.svg" alt="logo" style="width:60px;">
            <h1>Doctor Appointment Booking System</h1>
        </div>
        <br>
        <!-- Login form -->
        <form method="POST" action="${contextPath}/login" class="form-signin"
              style="background-color:white; border-radius: 5px">
            <h2 class="form-heading">Login</h2>
            <div style="font-size: 18px">Welcome! Please login to continue.</div>

            <div class="form-group ${error != null ? 'has-error' : ''}">
                <span style="color: #2e6da4">${message}</span>
                <!-- username -->
                <input name="username" type="text" class="form-control" placeholder="Username"
                       autofocus="true"/>
                <!-- password -->
                <input name="password" type="password" class="form-control" placeholder="Password"/>
                <span>${error}</span>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <!-- submit button -->
                <button class="btn btn-lg btn-primary btn-block" type="submit" title="Click to login">Log In</button>
                <!-- Register button -->
                <h5 class="text-center">New user? <a href="${contextPath}/registration">Register here.</a></h5>
            </div>
        </form>
    </div>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
<script>
    // Hover simple hint
    $(document).ready(function () {
        $('body').tooltip({selector: ".btn", trigger: "hover"});
    });
</script>
</html>
