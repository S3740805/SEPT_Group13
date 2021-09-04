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
        body {
            padding-top: 3.5rem;
        }
    </style>
    <title>Patient List</title>
</head>
<body>
<!--Navigation-->
<jsp:include page="../_navigationAdmin.jsp"></jsp:include>
<div class="container">
    <!--Doctor list table-->
    <h1 style="text-align: center">Patient List</h1>
    <br>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Name</th>
            <th>Email</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody id="patient-container">
        </tbody>
    </table>
    <!-- Patient Detail Modal -->
    <div class="modal" id="patientModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Patient Details</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body" id="patient-details">
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
    <!-- Bookings Modal -->
    <div class="modal" id="bookingModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Patient Details</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <table class="table" id="bookings-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Doctor</th>
                            <th>Time</th>
                            <th>Date</th>
                        </tr>
                        </thead>
                        <tbody id="bookings-container">
                        </tbody>
                    </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>

</div>
<br><br><br><br><br><br><br>
</body>
<script>
    // Hover simple hint
    $(document).ready(function () {
        $('body').tooltip({selector: ".btn", trigger: "hover"});
    });
</script>
<script src="${contextPath}/resources/js/patientAdmin.js"></script>


</html>
