<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width">
    <%--boostrap--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="icon" href="https://image.flaticon.com/icons/svg/2957/2957872.svg" sizes="16x16">
    <style>
        /* Style sheet */
        body {
            padding-top: 3.5rem;
        }

        #delete {
            color: cornflowerblue;
        }

        #delete:hover {
            color: white;
        }

        #delete:active {
            color: red;
            cursor: pointer;
        }
    </style>
    <title>Booking History</title>
</head>
<body>
<!-- Navigation -->
<jsp:include page="../_navigation.jsp"></jsp:include>
<div class="container">
    <!--        Heading-->
    <h1 style="text-align: center">Booking History</h1>
    <br>
    <!--        Table for upcoming appointments-->
    <h3> Upcoming appointments </h3>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>With doctor</th>
            <th>Time</th>
            <th>Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody id="upcomingBookings">
        </tbody>
    </table>
    <br>
    <!--        Table for upcoming appointments-->
    <h3> Previous appointments </h3>
    <table class="table">
        <thead>
        <tr>
            <th>Appointment Number</th>
            <th>With doctor</th>
            <th>Time</th>
            <th>Date</th>
            <th></th>
        </tr>
        </thead>
        <tbody id="pastBookings">
        </tbody>
    </table>
</div>
<br><br><br><br><br><br><br>
</body>
<script>
    // Hover simple hint
    $(document).ready(function () {
        $('body').tooltip({selector: ".btn", trigger: "hover"});
    });
</script>
<script src="${contextPath}/resources/js/bookingHistory.js"></script>

</html>
