<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>403 ERROR</title>
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
<div class="container">
    <div class="card" style="text-align: center">
        <!-- If access with unexpected role -->
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h1 style="color: #4AA0B5; font-size: 70px">ERROR</h1>
            <h2 style="font-size: 50px">Sorry, something went wrong.</h2>
            <h6 style="color: #4AA0B5"><i class="fas fa-arrow-circle-right"></i> <a style="color: #4AA0B5" href="/">Go
                to Homepage</a></h6>
        </c:if>
    </div>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
