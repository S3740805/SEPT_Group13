<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>About</title>
    <%--<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--boostrap--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
        body {
            padding-top: 3.5rem;
        }
    </style>
    <link rel="icon" href="https://image.flaticon.com/icons/svg/2957/2957872.svg" sizes="16x16">

</head>

<body>
<!-- Navigation -->
<jsp:include page="../_navigation.jsp"></jsp:include>
<!-- Content -->
<div class="container">
    <h1>About us</h1>
    <div style="text-align: center">
        <img src="https://image.flaticon.com/icons/svg/2957/2957872.svg" alt="logo" style="width:60px;">
        <h3>Doctor Appointment Booking System</h3>
    </div>
    <hr>
    <br>

    <h6 style="text-align: justify; font-size: 20px">This Doctor Appointment Booking system is a web-based application
        that offers
        effective functions that patients
        can make appointments with doctors online. The purpose of the system is to automate and simplify the process
        of
        the existing manual booking system. This application allows patients to check the available schedules of
        their
        doctors and to manage their bookings. There are appropriate functions that allow users to cancel their
        bookings
        anytime.</h6>
    <br><br><br><br><br><br><br>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
