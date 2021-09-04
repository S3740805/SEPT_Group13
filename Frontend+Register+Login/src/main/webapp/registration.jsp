<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link rel="icon" href="https://image.flaticon.com/icons/svg/2957/2957872.svg" sizes="16x16">
</head>

<body>

<div class="container">
    <!-- Logo and name of system -->
    <div style="text-align: center">
        <img src="https://image.flaticon.com/icons/svg/2957/2957872.svg" alt="logo" style="width:60px;">
        <h1>Doctor Appointment Booking System</h1>
    </div>
    <br>
    <!-- Registration form -->
    <form:form method="POST" modelAttribute="userForm" class="form-signin"
               style="background-color:white; border-radius: 5px">
        <h2 class="form-signin-heading">Create new account</h2>
        <!-- username -->
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="username" class="form-control" placeholder="Username"
                            autofocus="true" title="Please only use letter and number"></form:input>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>
        <!-- password -->
        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"
                            title="Please use password with at least 8 characters."></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>
        <!-- repeat password-->
        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="passwordConfirm" class="form-control"
                            placeholder="Confirm your password" title="Please repeat your password"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>
        <!-- Submit button -->
        <button class="btn btn-lg btn-primary btn-block" type="submit" title="Click to register a new account">Submit
        </button>
        <!-- login button -->
        <h5 class="text-center">Already have an account? <a href="${contextPath}/login">Login here.</a></h5>
    </form:form>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
<script>
    // Hover simple hint
    $(document).ready(function () {
        $('body').tooltip({selector: ".form-control", trigger: "hover"});
    });
</script>
</html>
