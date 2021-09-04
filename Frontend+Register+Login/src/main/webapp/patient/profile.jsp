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

        #tooltip {
            position: relative;
            display: inline-block;
            /*border-bottom: 1px dotted black;*/
        }

        #tooltip #tooltiptext {
            visibility: hidden;
            width: 200px;
            background-color: black;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px 0;
            position: absolute;
            z-index: 1;
            top: 150%;
            left: 50%;
            margin-left: -60px;
            /* Fade in tooltip - takes 1 second to go from 0% to 100% opac: */
            opacity: 0;
            transition: opacity 1s;

        }

        #tooltip #tooltiptext::after {
            content: "";
            position: absolute;
            bottom: 100%;
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: transparent transparent black transparent;
            /* Fade in tooltip - takes 1 second to go from 0% to 100% opac: */
            opacity: 0;
            transition: opacity 1s;

        }

        #tooltip:hover #tooltiptext {
            visibility: visible;
            opacity: 1;
        }

    </style>
    <title>Profile</title>
</head>
<body>
<!-- Navigation -->
<jsp:include page="../_navigation.jsp"></jsp:include>
<%--Patient Profile Table--%>
<div class="container">
    <h3>Profile</h3>
    <div id="id_profile"></div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 toppad">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title" id="patientUserName"></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6 col-lg-6">
                            <table class="table table-user-information">
                                <tbody>
                                <tr>
                                    <td>First Name:</td>
                                    <td>
                                        <div id="FirstName"></div>
                                    <td/>
                                </tr>
                                <tr>
                                    <td>Last Name:</td>
                                    <td>
                                        <div id="LastName"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Date of Birth:</td>
                                    <td id="DOB"></td>
                                </tr>

                                <tr>
                                <tr>
                                    <td>Gender:</td>
                                    <td id="Gender"></td>
                                </tr>
                                <tr>
                                    <td>Home Address:</td>
                                    <td id="Address"></td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td id="Email"><a href="mailto:info@support.com"></a></td>
                                </tr>
                                <td>Phone Number:</td>
                                <td id="Phone"></td>

                                </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-5 col-lg-5">
                            <table class="table table-user-information">
                                <tbody>
                                <tr>
                                    <td>Blood Type:</td>
                                    <td id="bloodType"></td>
                                </tr>
                                <tr>
                                    <td>Allergies:</td>
                                    <td id="allergies"></td>
                                </tr>
                                <tr>
                                    <td>Medical History:</td>
                                    <td id="medicalHistory"></td>
                                </tr>

                                <tr>
                                <tr>
                                    <td>Health Status:</td>
                                    <td id="healthStatus"></td>
                                </tr>
                                </tbody>
                            </table>
                            <div id="save"></div>
                        </div>

                        <span class="pull-right col-md-1 col-lg-1">
                            <div id="tooltip"><a id="editButton" type="button" class="btn btn-sm btn-warning "
                                                 onclick="patientEdit();changeVisibility()"><i
                                    class="glyphicon glyphicon-edit"></i>Edit <span id="tooltiptext">Click here to edit your profile</span></a></div>
                            <a id="back"></a>
                    </span>
                    </div>


                </div>

            </div>
        </div>
    </div>
</div>
</div>
<br><br><br><br><br>
</body>
<script>
    let URL = 'https://dabsbackend.herokuapp.com/';
    document.addEventListener('DOMContentLoaded', function () {
        let state = sessionStorage.getItem("state");
        getPatient(state);
    })

    // Show Patient Profile
    function getPatient(username) {
        let id = document.getElementById('id_profile')
        let FirstName = document.getElementById('FirstName')
        let LastName = document.getElementById('LastName')
        let DOB = document.getElementById('DOB')
        let Gender = document.getElementById('Gender')
        let Address = document.getElementById('Address')
        let Email = document.getElementById('Email')
        let Phone = document.getElementById('Phone')
        let allergies = document.getElementById('allergies')
        let bloodType = document.getElementById('bloodType')
        let healthStatus = document.getElementById('healthStatus')
        let medicalHistory = document.getElementById('medicalHistory')
        id.innerHTML = '';
        fetch(URL + `patients/` + username)
            .then(response => response.json())
            .then(function (doc) {
                id.value = doc.id;
                if (doc.fname == null) {
                    FirstName.innerHTML += '';
                    LastName.innerHTML += '';
                    DOB.innerHTML = '';
                    Gender.innerHTML += '';
                    Address.innerHTML += '';
                    Email.innerHTML += '';
                    Phone.innerHTML += '';
                    allergies.innerHTML += '';
                    bloodType.innerHTML += '';
                    healthStatus.innerHTML += '';
                    medicalHistory.innerHTML += '';
                } else {
                    FirstName.innerHTML += '<div>' + doc.fname + '</div>';
                    LastName.innerHTML += '<div>' + doc.lname + '</div>';
                    DOB.innerHTML = '<div>' + doc.dob + '</div>';
                    Gender.innerHTML += '<div>' + doc.gender + '</div>';
                    Address.innerHTML += '<div>' + doc.address + '</div>';
                    Email.innerHTML += '<div>' + doc.email + '</div>';
                    Phone.innerHTML += '<div>' + "(+84)" + doc.phone + '</div>';
                    allergies.innerHTML += '<div>' + doc.allergies + '</div>';
                    bloodType.innerHTML += '<div>' + doc.bloodType + '</div>';
                    healthStatus.innerHTML += '<div>' + doc.healthStatus + '</div>';
                    medicalHistory.innerHTML += '<div>' + doc.medicalHistory + '</div>';
                }
            })
    }

    // Edit Patient Profile
    function patientEdit() {
        let state1 = sessionStorage.getItem("state");
        document.getElementById("FirstName").innerHTML = `<input class="form-control" type="text" id="edit_fname"><div id="wFirstName" style="color: red"></div>`
        document.getElementById("LastName").innerHTML = `<input class="form-control" type="text" id="edit_lname"><div id="wLastName" style="color: red"></div>`
        document.getElementById("DOB").innerHTML = `<input class="form-control" type="date" name="datemax" max = "2020-08-24" id="edit_dob">`
        document.getElementById("Gender").innerHTML =
            `<select class="form-control" id="edit_gender">
                  <option value="Male">Male</option>
                  <option value="Female">Female</option>
                  <option value="Other">Other</option>
              </select>`
        document.getElementById("Address").innerHTML = `<input class="form-control" type="text" id="edit_address"><div id="wAddress" style="color: red"></div>`
        document.getElementById("Email").innerHTML = `<div id="tooltip"><input class="form-control" type="email" name="email" id="edit_email"><span id="tooltiptext">Input your email follow the form exam@gmail.com </span></div><div id="wEmail" style="color: red"></div>`
        document.getElementById("Phone").innerHTML = `<div id="tooltip"><div class="input-group"><div class="input-group-prepend"><span class="input-group-text">+84</span></div><input class="form-control" type="text" maxlength="11" name="phone"  id="phone"></div><span id="tooltiptext"> Please input your mobile phone number. </span></div><div id="wPhone" style="color: red"></div>`
        document.getElementById("bloodType").innerHTML = `
              <select class="form-control" id="edit_bloodType">
                  <option value="A">A</option>
                  <option value="B">B</option>
                  <option value="O">O</option>
                  <option value="AB">AB</option>
                  <option value="Don't know">Don't know</option>
              </select>`
        document.getElementById("allergies").innerHTML = `<div id="tooltip"><input class="form-control" type="text" id="edit_allergies"><span id="tooltiptext"> Have you ever had an allergic or adverse reaction to any medication? </span></div>`
        document.getElementById("healthStatus").innerHTML = `<div id="tooltip"><input class="form-control"  type="text" id="edit_healthStatus"><span id="tooltiptext">Do you have any current medical problems?</span></div>`
        document.getElementById("medicalHistory").innerHTML = `<div id="tooltip"><input class="form-control" type="text" id="edit_medicalHistory"><span id="tooltiptext">Have you ever received medical care and if so, what for?</span></div>`
        document.getElementById("save").innerHTML += `<button type="submit" class="btn btn-success" onclick="validateFormFName();validateFormLName();validateFormAddress();validateFormEmail();validateFormPhone();saveValidation()">Save</button>`
        document.getElementById("back").innerHTML += `<a id="tooltip" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger" href="profile.jsp"><i class="glyphicon glyphicon-remove"></i>Back<span id="tooltiptext">Click here to come back your profile </span></a>`

        fetch(URL + `patients/` + state1)
            .then(response => response.json())
            .then(function (doc) {
                document.getElementById("id_profile").value = doc.id;
                document.getElementById("edit_fname").value = doc.fname;
                document.getElementById("edit_lname").value = doc.lname;
                document.getElementById("edit_dob").value = doc.dob;
                document.getElementById("edit_email").value = doc.email;
                document.getElementById("edit_gender").value = doc.gender;
                document.getElementById("edit_address").value = doc.address;
                document.getElementById("phone").value = doc.phone;
                document.getElementById("edit_bloodType").value = doc.bloodType;
                document.getElementById("edit_allergies").value = doc.allergies;
                document.getElementById("edit_healthStatus").value = doc.healthStatus;
                document.getElementById("edit_medicalHistory").value = doc.medicalHistory;

            })

    }

    // Save Patient Profile
    function editProfile() {
        let state2 = sessionStorage.getItem("state");
        let editFirstName = document.getElementById('edit_fname').value
        let editLastName = document.getElementById('edit_lname').value
        let editDOB = document.getElementById('edit_dob').value
        let editGender = document.getElementById('edit_gender').value
        let editAddress = document.getElementById('edit_address').value
        let editEmail = document.getElementById('edit_email').value
        let editPhone = document.getElementById('phone').value
        let editBloodType = document.getElementById('edit_bloodType').value
        let editAllergies = document.getElementById('edit_allergies').value
        let editHealthStatus = document.getElementById('edit_healthStatus').value
        let editMedicalHistory = document.getElementById('edit_medicalHistory').value
        let id = document.getElementById('id_profile').value;
        if (confirm("Are you sure want to change your information")) {
            fetch(URL + `patients/` + state2, {
                method: 'PUT',
                body: JSON.stringify({
                    id: parseInt(id),
                    name: null,
                    username: state2,
                    password: null,
                    fname: editFirstName,
                    lname: editLastName,
                    address: editAddress,
                    dob: editDOB,
                    gender: editGender,
                    bloodType: editBloodType,
                    phone: editPhone,
                    email: editEmail,
                    allergies: editAllergies,
                    healthStatus: editHealthStatus,
                    medicalHistory: editMedicalHistory
                }),
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                }
            }).then(res => location.reload())
        }
    }

    function changeVisibility() {
        document.getElementById("editButton").style.display = "none";
    }

    // Validation input

    // Validation for first name
    function validateFormFName() {
        var letters = /^[A-Za-z]+$/; // This value for checking the letter
        var fn = document.getElementById("edit_fname").value;
        // Checking null value
        if (fn == "") {
            document.getElementById("wFirstName").innerHTML = "Please enter your First Name";
            document.getElementById("edit_fname").style.borderColor = "red";// focus on wrong value
            return false;

        }
        if (fn.match(letters)) {
        } else {
            document.getElementById("wFirstName").innerHTML = "Please input alphabet characters only";
            document.getElementById("edit_fname").style.borderColor = "red";// focus on wrong value
            return false;
        }

        document.getElementById("wFirstName").innerHTML = "";
        document.getElementById("edit_fname").style.borderColor = "";
        return true;


    }

    // Validation for Last Name
    function validateFormLName() {
        var letters = /^[A-Za-z]+$/; // This value for checking the letter
        var ln = document.getElementById("edit_lname").value;
        // Checking null value
        if (ln == "") {
            document.getElementById("wLastName").innerHTML = "Please enter your Last Name";
            document.getElementById("edit_lname").style.borderColor = "red";// focus on wrong value
            return false;
        }
        if (ln.match(letters)) {
        } else {
            document.getElementById("wLastName").innerHTML = "Please input alphabet characters only";
            document.getElementById("edit_lname").style.borderColor = "red";// focus on wrong value
            return false;
        }

        document.getElementById("wLastName").innerHTML = "";
        document.getElementById("edit_lname").style.borderColor = "";
        return true;

    }

    // Validation for Address
    function validateFormAddress() {
        var ad = document.getElementById("edit_address").value;
        // Checking null value
        if (ad == "") {
            document.getElementById("wAddress").innerHTML = "Please enter your Address";
            document.getElementById("edit_address").style.borderColor = "red";// focus on wrong value
            return false
        }
        document.getElementById("wAddress").innerHTML = "";
        document.getElementById("edit_address").style.borderColor = "";
        return true;

    }

    // Validation for Email
    function validateFormEmail() {
        var el = document.getElementById('edit_email').value;
        var character = el.indexOf("@");
        var dot = el.lastIndexOf(".");
        // Checking null value
        if (el == "") {
            document.getElementById("wEmail").innerHTML = "Please enter your Email";
            document.getElementById("edit_email").style.borderColor = "red";// focus on wrong value
            return false;
        }
        if ((character < 1) || (dot < character + 2) || (dot + 2 > el.length)) {
            document.getElementById("wEmail").innerHTML = "Please input valid email";
            document.getElementById("edit_email").style.borderColor = "red";// focus on wrong value
            return false;
        }
        document.getElementById("wEmail").innerHTML = "";
        document.getElementById("edit_email").style.borderColor = "";
        return true;

    }

    // validation for Phone number
    function validateFormPhone() {
        var pe = document.getElementById('phone').value;
        var testphone = isNaN(pe); // This is checking the number
        // Checking null value
        if (pe == "") {
            document.getElementById("wPhone").innerHTML = "Please enter your phone number";
            document.getElementById("phone").style.borderColor = "red";// focus on wrong value
            return false;
        }
        if (testphone == true) {
            document.getElementById("wPhone").innerHTML = "Please input number only!";
            document.getElementById("phone").style.borderColor = "red";// focus on wrong value
            return false;
        }
        if (pe.length < 9) {
            document.getElementById("wPhone").innerHTML = "Please input valid phone number.";
            document.getElementById("phone").style.borderColor = "red";// focus on wrong value
            return false;
        }

        document.getElementById("wPhone").innerHTML = "";
        document.getElementById("phone").style.borderColor = "";

        return true;
    }


    function saveValidation() {
        if (validateFormFName() == true && validateFormLName() == true && validateFormAddress() == true && validateFormEmail() == true && validateFormPhone() == true) {
            editProfile();
        }


    }
</script>
<script>
    // Hover simple hint
    $(document).ready(function () {
        $('body').tooltip({selector: ".btn", trigger: "hover"});
    });
</script>
</html>
