<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <%--<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--boostrap--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="icon" href="https://image.flaticon.com/icons/svg/2957/2957872.svg" sizes="16x16">
    <style>
        body {
            padding-top: 3.5rem;
        }
    </style>

</head>

<body>
<!-- Navigation -->
<jsp:include page="_navigation.jsp"></jsp:include>
<!-- Content -->
<div class="container" style="text-align: center">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <!-- welcome message with logged username -->
        <h1 style="color: #4AA0B5; font-size: 50px">Hi <span id="name"
                                                             value="${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}!</span>
        </h1>
        <h3>Welcome to our Doctor Appointment Booking System.</h3>
    </c:if>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Store username in sessionStorage for later use
        sessionStorage.setItem("state", document.getElementById('name').getAttribute('value'));
        // Create new patient with this.username if username is not existing (except admin)
        let state = sessionStorage.getItem("state");
        getPatient(state);

    });
    // Crete new Profile for user if don't have
    function getPatient(state) {
        let havePatient = false;
        fetch('https://dabsbackend.herokuapp.com/patients')
            .then(res => res.json())
            .then(json => {
                for (let i = 0; i < json.length; i++) {
                    if (state === json[i].username || state === "admin") {
                        havePatient = true;
                        console.log("Have patient");
                        break;
                    }
                }
            }).then(() => {
            if (havePatient === false) {
                fetch('https://dabsbackend.herokuapp.com/patients', {
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    method: "POST",
                    body: JSON.stringify({username: state})
                }).then (()=>console.log("New patient"));
            }
        })
    }
</script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
