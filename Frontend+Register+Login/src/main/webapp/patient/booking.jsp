<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
        body {
            padding-top: 3.5rem;
        }

        strong:hover {
            text-underline: blue;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!--Navigation-->
<jsp:include page="../_navigation.jsp"></jsp:include>
<!-- Body -->
<div class="container">
    <div id="bookingBody" class="container-fluid">
        <!-- Booking form -->
        <h1 style="text-align: center">Booking Form</h1>
        <br>
        <div class="container">
            <!-- Doctors -->
            <label for="doctors">
                <h3 title="Available doctors">Available doctors:</h3>
            </label>
            <select class="form-control" id="doctors" name="doctors" required>
                <!-- Date -->
            </select>
            <br>
            <label for="appointmentDate">
                <h3 title="Valid date are between today and one week in advance">Select date:</h3>
            </label>
            <br>
            <input class="form-control" type="date" value="2020-08-01" id="appointmentDate" name="appointmentDate"
                   required>
            <small id="appointmentDateError" style="display: none;color: red">Invalid date selection. Date selected is
                already in the past.
                <strong onclick="appointmentDateErrorOk()" style="color: blue">x</strong></small>
            <small id="appointmentDateErrorFuture" style="display: none;color: red">Invalid date selection. Date
                selected is over one week in the future.
                <strong onclick="appointmentDateErrorOk()" style="color: blue">x</strong></small>

            <br>
            <!-- Time -->
            <label for="times">
                <h3 title="Select time">Select time:</h3>
            </label>

            <select class="form-control" id="times" name="times" required>
                <option value="09:00:00">9:00 - 9:30</option>
                <option value="09:30:00">9:30 - 10:00</option>
                <option value="10:00:00">10:00 - 10:30</option>
                <option value="10:30:00">10:30 - 11:00</option>
                <option value="11:00:00">11:00 - 11:30</option>
                <option value="11:30:00">11:30 - 12:00</option>
                <option value="12;00:00">12:00 - 12:30</option>
                <option value="12:30:00">12:30 - 13:00</option>
                <option value="13:00:00">13:00 - 13:30</option>
                <option value="13:30:00">13:30 - 14:00</option>
                <option value="14:00:00">14:00 - 14:30</option>
                <option value="14:30:00">14:30 - 15:00</option>
                <option value="15:00:00">15:00 - 15:30</option>
                <option value="15:30:00">15:30 - 16:00</option>
                <option value="16:00:00">16:00 - 16:30</option>
                <option value="16:30:00">16:30 - 17:00</option>
                <option value="17:00:00">17:00 - 17:30</option>
                <option value="17:30:00">17:30 - 18:00</option>
                <option value="18:00:00">18:00 - 18:30</option>
                <option value="18:30:00">18:30 - 19:00</option>
                <option value="19:00:00">19:00 - 19:30</option>
                <option value="19:30:00">19:30 - 20:00</option>
            </select>

            <br>

            <div class="container-fluid" style="text-align: center">
                <button class="btn btn-primary" type="submit" onclick="checkAvailable()" value="Book Appointment"
                        title="Click here to book appointment">Book Appointment
                </button>
            </div>

            <br><br><br><br><br><br><br>

        </div>
    </div>
</div>
</body>

</html>

<script src="${contextPath}/resources/js/booking.js">

</script>
<script>
    // Hover simple hint
    $(document).ready(function () {
        $('body').tooltip({selector: ".btn", trigger: "hover"});
    });
</script>