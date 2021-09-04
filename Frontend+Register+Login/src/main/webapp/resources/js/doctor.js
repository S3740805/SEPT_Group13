const doctorForm = document.querySelector('#doctor-form');
const doctorContainer = document.querySelector('#doctor-container');
const doctorEditor = document.querySelector('#edit-form');
const bookingContainer = document.querySelector('#bookings-container');
const doctorURL = `https://dabsbackend.herokuapp.com/doctors`;
const bookingURL = `https://dabsbackend.herokuapp.com/bookings`;
let allDoctors = [];
const state = sessionStorage.getItem("state"); // get username

document.addEventListener('DOMContentLoaded', function () {
    //fetchDoctor
    fetchDoctors();
    // getAuth();
    console.log(state);
    //add new Doctors
    doctorForm.addEventListener('submit', (e) => {
        e.preventDefault();
        console.log(e.target);
        const nameInput = doctorForm.querySelector('#name').value;
        const emailInput = doctorForm.querySelector('#email').value;
        const descInput = doctorForm.querySelector('#description').value;
        // check whether the doctor with name and email already existed
        let doctorExist = false;
        fetch(`${doctorURL}`)
            .then(res => res.json())
            .then(json => {
                for (let i = 0; i < json.length; i++) {
                    if (nameInput === json[i].name.toString()
                        && emailInput === json[i].email.toString()) {
                        doctorExist = true;
                        alert("Doctor with the same name and email already existed");
                        break;
                    }
                }
            }).then(() => {
                if (doctorExist === false) {
                    fetch(`${doctorURL}`, {
                        method: 'POST',
                        body: JSON.stringify({
                            name: nameInput,
                            email: emailInput,
                            description: descInput,
                            userName: state
                        }),
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }).then(response => {
                            doctorForm.querySelector('#name').value = '', doctorForm.querySelector('#email').value = '', doctorForm.querySelector('#description').value = '';
                            alert('New doctor have been added successfully.');
                            fetchDoctors()
                        }
                    )

                }
            }
        )
    });

    //addEventlistener to 2 button edit and delete
    doctorContainer.addEventListener('click', (e) => {
        //if click edit
        if (e.target.dataset.action === 'edit') {
            console.log('press edit');
            //get targeted doctor id
            const doctorData = allDoctors.find((doctor) => {
                return doctor.id == e.target.dataset.id
            })
            // this is edit form
            doctorEditor.innerHTML = '';
            doctorEditor.innerHTML += `
            <div id='edit-doctor'>
                <form class="form-horizontal" id="doctor-form">
                    <br>
                    <div class="form-group row">
                        <label class="col-sm-2" for="name">Name:</label>
                        <div class="col-sm-10">
                            <input required id="edit-name" value="${doctorData.name}" class="form-control" disabled>
                        </div>
                </div>
                <div class="form-group row">
                        <label class="col-sm-2" for="email">Email:</label>
                        <div class="col-sm-10">
                            <input required type="email" name="email" id="edit-email" value="${doctorData.email}" class="form-control">
                        </div>
                </div>
                <div class="form-group row">
                        <label class="col-sm-2" for="description">Description:</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="edit-description" name="description" required>
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
                    <input class="btn btn-outline-primary" type="submit" value="Edit Doctor">
                    </div>
                </div>
                </form>
            </div>`
            console.log(doctorData);
            //addEventlistener to submit button
            const editForm = document.querySelector(`#edit-doctor`);
            editForm.addEventListener("submit", (e) => {
                event.preventDefault();
                const nameInput = document.querySelector("#edit-name").value;
                const emailInput = document.querySelector("#edit-email").value;
                const descInput = document.querySelector("#edit-description").value;
                //const editedDoctor = document.querySelector(`#doctor-${doctorData.id}`)
                fetch(`${doctorURL}/${doctorData.id}`, {
                    method: 'PUT',
                    body: JSON.stringify({
                        name: nameInput,
                        email: emailInput,
                        description: descInput,
                        userName: state,
                    }),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }).then(response => {
                    //refresh the form
                    document.querySelector("#edit-name").value = '', document.querySelector("#edit-email").value = '', document.querySelector("#edit-description").value = '';
                    //success alert
                    alert('Doctor information have been updated successfully.');
                    location.reload()
                })
            })
            //if click delete button
        } else if (e.target.dataset.action === 'delete') {
            if (confirm('Do you want to delete this doctor?')) {
                console.log('press delete');
                fetch(`${doctorURL}/${e.target.dataset.id}`, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }).then(response => fetchDoctors())
            }
            // if click view booking button
        } else if (e.target.dataset.action === 'booking') {
            console.log('press booking');
            //get targeted doctor id
            const doctorData = allDoctors.find((doctor) => {
                return doctor.id == e.target.dataset.id
            });
            console.log(doctorData.id);
            // get bookings by doctor id
            fetchBookings(doctorData.id);
        }

    })
});


//fetch Doctors
function fetchDoctors() {
    doctorContainer.innerHTML = '';
    fetch(`${doctorURL}`)
        .then(response => response.json())
        .then(function (doc) {
            //sort by doctor id small to large
            let doctor = doc.filter(d => !(d.id == null)).sort((a, b) => parseFloat(a.id) - parseFloat(b.id));
            for (var i = 0; i < doctor.length; i++) {
                allDoctors = doctor;
                var listItem = document.createElement('tr');
                var editLink = `<button class="btn btn-outline-success" data-id="${doctor[i].id}" id="edit-${doctor[i].id}" data-action="edit" data-action="view" data-toggle="modal" data-target="#editForm" title="Click to edit">Edit</button>`;
                var deleteLink = `<button  class="btn btn-outline-danger" data-id="${doctor[i].id}" id="delete-${doctor[i].id}" data-action="delete" title="Click to delete">Delete</button>`;
                var booking = `<button  class="btn btn-outline-info" data-id="${doctor[i].id}" id="booking-${doctor[i].id}" data-action="booking" data-action="view" data-toggle="modal" data-target="#myModal" title="Click to view bookings">View Bookings</button>`;
                listItem.innerHTML += '<td>' + doctor[i].id + '</td>';
                listItem.innerHTML += '<td>' + doctor[i].name + '</td>';
                listItem.innerHTML += '<td>' + doctor[i].email + '</td>';
                listItem.innerHTML += '<td>' + doctor[i].description + '</td>';
                listItem.innerHTML += '<td>' + booking + '</td>';
                listItem.innerHTML += '<td>' + editLink + deleteLink + '</td>';
                doctorContainer.appendChild(listItem);
            }
        })
}

function fetchBookings(doctorId) {
    bookingContainer.innerHTML = '';
    // fetch all bookings
    fetch(`${bookingURL}`)
        .then(response => response.json())
        .then(function (doc) {
            // filter booking with targeted doctor id
            let booking = doc.filter(d => (d.doctor_id == doctorId));
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
                    var listBook = document.createElement('tr');
                    listBook.innerHTML +=
                        `
                        <td>${booking[i].id}</td>
                        <td>${booking[i].userName}</td>
                        <td>${booking[i].time}</td>
                        <td>${booking[i].date}</td>
                        `
                    bookingContainer.appendChild(listBook)
                }
            }
        })
}
