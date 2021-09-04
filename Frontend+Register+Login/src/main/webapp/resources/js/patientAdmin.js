const patientContainer = document.querySelector('#patient-container');
const patientDetail = document.querySelector('#patient-details');
const bookingContainer = document.querySelector('#bookings-container');
const patientURL = `https://dabsbackend.herokuapp.com/patients`;
const bookingURL = `https://dabsbackend.herokuapp.com/bookings`;
const doctorURL = `https://dabsbackend.herokuapp.com/doctors`;
let allPatients = [];
let allDoctors = [];

document.addEventListener('DOMContentLoaded', function () {
    fetchPatients();
    fetchDoctors();
    patientContainer.addEventListener('click', (e) => {
        //if click view
        if (e.target.dataset.action === 'view') {
            console.log('press view')
            // get info from the chosen patient
            const patientData = allPatients.find((patient) => {
                return patient.id == e.target.dataset.id
            })
            console.log(patientData.username);
            // set info to the modal
            patientDetail.innerHTML = ''
            patientDetail.innerHTML +=
                `
                <table class="table">
                    <h4>${patientData.username}</h4>
                    <tr><td>Name: </td><td>${patientData.fname} ${patientData.lname}</td></tr>
                    <tr><td>Gender: </td><td>${patientData.gender}</td></tr>
                    <tr><td>Date of Birth: </td><td>${patientData.dob}</td></tr>
                    <tr><td>Address: </td><td>${patientData.address}</td></tr>
                    <tr><td>Email: </td><td>${patientData.email}</td></tr>
                    <tr><td>Phone: </td><td>${patientData.phone}</td></tr>
                    <tr><td>Allergies: </td><td>${patientData.allergies}</td></tr>
                    <tr><td>Blood Type: </td><td>${patientData.bloodType}</td></tr>
                    <tr><td>Health Status: </td><td>${patientData.healthStatus}</td></tr>
                    <tr><td>Medical History: </td><td>${patientData.medicalHistory}</td></tr>
                </table>
                `
        } else if (e.target.dataset.action === 'booking') {
            console.log('press booking')
            // get info from the chosen patient
            const patientData = allPatients.find((patient) => {
                return patient.id == e.target.dataset.id
            })
            console.log(patientData.username)
            // get bookings by username
            fetchBookings(patientData.username)

        }

    })
})

//fetch Patients
function fetchPatients() {
    patientContainer.innerHTML = '';
    fetch(`${patientURL}`)
        .then(response => response.json())
        .then(function (doc) {
            //sort by doctor id small to large
            let patient = doc.filter(d => !(d.id == null)).sort((a, b) => parseFloat(a.id) - parseFloat(b.id));
            for (var i = 0; i < patient.length; i++) {
                allPatients = patient;
                var listItem = document.createElement('tr');
                var view = `<button  class="btn btn-outline-primary" data-id="${patient[i].id}" id="view-${patient[i].id}" data-action="view" data-toggle="modal" data-target="#patientModal" title="Click to see details">Details</button>`;
                var booking = `<button  class="btn btn-outline-info" data-id="${patient[i].id}" id="booking-${patient[i].id}" data-action="booking" data-action="view" data-toggle="modal" data-target="#bookingModal" title="Click to view bookings">View Bookings</button>`;
                listItem.innerHTML +=
                    `
                    <td>${patient[i].id}</td>
                    <td>${patient[i].username}</td>
                    <td>${patient[i].fname} ${patient[i].lname}</td>
                    <td>${patient[i].email}</td>
                    <td>${booking}</td>
                    <td>${view}</td>
                    `
                patientContainer.appendChild(listItem);
            }
        })
}

// Get bookings by username
function fetchBookings(username) {
    bookingContainer.innerHTML = '';
    // fetch all bookings
    fetch(`${bookingURL}/${username}`)
        .then(response => response.json())
        .then(function (booking) {
            // if no booking yet
            if (booking.length === 0) {
                bookingContainer.innerHTML += `<h6>No booking to show.</h6>`
            } else {
                // sort bookings in descending
                booking.sort((a, b) => {
                    if (new Date(parseInt(a.date.split("-")[0]),
                        parseInt(a.date.split("-")[1]) - 1,
                        parseInt(a.date.split("-")[2]),
                        parseInt(a.time.split(":")[0]),
                        parseInt(a.time.split(":")[1])) >
                        new Date(parseInt(b.date.split("-")[0]),
                            parseInt(b.date.split("-")[1]) - 1,
                            parseInt(b.date.split("-")[2]),
                            parseInt(b.time.split(":")[0]),
                            parseInt(b.time.split(":")[1])))
                        return -1
                    else return 1
                })
                // set bookings to modal
                for (var i = 0; i < booking.length; i++) {
                    // get doctor name based on doctor_id
                    const doctorData = allDoctors.find((doctor) => {
                        return doctor.id == booking[i].doctor_id
                    });
                    // create row of booking info
                    var listBook = document.createElement('tr');
                    listBook.innerHTML +=
                        `
                        <td>${booking[i].id}</td>
                        <td>${doctorData.name}</td>
                        <td>${booking[i].time}</td>
                        <td>${booking[i].date}</td>
                        `
                    bookingContainer.appendChild(listBook)
                }
            }
        })
}

//fetch Doctors to get doctor name
function fetchDoctors() {
    fetch(`${doctorURL}`)
        .then(response => response.json())
        .then(function (json) {
                allDoctors = json;
        })
}

