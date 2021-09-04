<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!--Navigation for Patient-->
<div id="navigation">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-info">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <img src="https://image.flaticon.com/icons/svg/2957/2957872.svg" alt="logo" style="width:40px;">
            </a>

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/doctor">Doctors</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/patient">Patients</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/booking">Bookings</a>
                    </li>
                </ul>
            </div>

            <div class="pull-right">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <form id="logoutForm" method="POST" action="${contextPath}/logout">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <span class="mr-sm-2" style="color: #37444C"><i
                            class="fas fa-user-alt"> </i> ${pageContext.request.userPrincipal.name}</span>
                    <button class="btn btn-outline-dark my-2 my-sm-0"
                            onclick="if (confirm('Do you want to logout?')) {document.forms['logoutForm'].submit()}"
                            title="Click to logout">Logout
                    </button>
                </c:if>
            </div>

        </div>
    </nav>
    <!--header image-->
    <div class="jumbotron"
         style="background-image: url(https://i.ibb.co/S3BnnGT/Thie-t-ke-kho-ng-te-n-4.png); background-size: cover; height: 300px">
        <div class="container">
            <%--<h1>Doctor Appointment Booking System</h1>--%>
        </div>
    </div>
</div>
<!--end of Navigation-->