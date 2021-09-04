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
    <title>Doctor List</title>
</head>
<body>
<!--Navigation-->
<jsp:include page="../_navigationAdmin.jsp"></jsp:include>
<div class="container">
    <!--Add doctor form-->
    <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#add-doctor"
            title="Click to add new doctor">Add new doctor <i class="fas fa-user-plus"></i></button>
    <div id='add-doctor' class="collapse">
        <form class="form-horizontal" id="doctor-form">
            <br>
            <div class="form-group row">
                <label class="col-sm-2" for="name">Name:</label>
                <div class="col-sm-10">
                    <input required type="text" name="name" id="name" class="form-control" pattern="^[A-Za-z ]+$"
                           title="Please input alphabet characters only"
                           placeholder="Enter name">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2" for="email">Email:</label>
                <div class="col-sm-10">
                    <input required type="email" name="email" id="email" class="form-control" placeholder="Enter email">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2" for="description">Description:</label>
                <div class="col-sm-10">
                    <select class="form-control" id="description" name="description" required>
                        <option value="Bone">Bone</option>
                        <option value="General Physician">General Physician</option>
                        <option value="Heart">Heart</option>
                        <option value="Lung">Lung</option>
                        <option value="Neurology">Neurology</option>
                    </select>
                </div>
            </div>
            <div class="form-group row justify-content-center">
                <div class="input-group-prepend">
                    <input class="btn btn-outline-primary" type="submit" value="Add Doctor" title="Submit">
                </div>
            </div>
        </form>

    </div>
    <br>
    <div>
        <div class="modal" id="editForm">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit doctor</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div id="edit-form"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <!--Doctor list table-->
    <h1 style="text-align: center">Doctor List</h1>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Description</th>
            <th>Bookings</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody id="doctor-container">
        </tbody>
    </table>

    <!-- Show Bookings Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Bookings</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <table class="table" id="bookings-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Patient</th>
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

<script src="${contextPath}/resources/js/doctor.js"></script>

</html>
