let doctors = [];
let URL = 'https://dabsbackend.herokuapp.com/';
// function to run onload
document.addEventListener('DOMContentLoaded', function () {
    //sessionStorage.setItem("state", "admin") //IMPORTANT: Set state to develop code
    fetchDoctor();
    getBookings();
});

// This is function to delete a booking
function cancelBooking(id) {
    if (confirm("Delete this appointment?")) {
        fetch(URL+`bookings/${id}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => {
            alert("Delete success.")
        }).then(res => {
            fetchDoctor();
            location.reload()})
    }
}

//This is function to accept a booking
function acceptBooking(str) {
    let id = str.split(',')[0]
    let date = str.split(',')[1]
    let doctor_id = str.split(',')[2]
    let patient_id = str.split(',')[3]
    let time = str.split(',')[4]
    let userName = str.split(',')[5]
    fetch(URL+`bookings/${id}`, {
        method: 'PUT',
        body: JSON.stringify({
            date: date,
            doctor_id: doctor_id,
            patient_id: patient_id,
            time: time,
            userName: userName,
            status: "accepted"
        }),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(res =>{
            fetchDoctor();
            location.reload()
    })

}

//This is function to reject a booking
function rejectBooking(str) {
    let id = str.split(',')[0]
    let date = str.split(',')[1]
    let doctor_id = str.split(',')[2]
    let patient_id = str.split(',')[3]
    let time = str.split(',')[4]
    let userName = str.split(',')[5]
    fetch(URL+`bookings/${id}`, {
        method: 'PUT',
        body: JSON.stringify({
            date: date,
            doctor_id: doctor_id,
            patient_id: patient_id,
            time: time,
            userName: userName,
            status: "rejected"
        }),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(res => {
        fetchDoctor();
        location.reload()
    })
}

// This is get booking function
function getBookings() {
    fetchDoctor();
    // let state = sessionStorage.getItem("state")
    let allBookings = document.getElementById("allBookings")
    fetch(URL+`bookings`).then(res => res.json())
        .then(json => {
            // This sort the JSON by date, from most recently
            json.sort((a, b) => {
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
            });
            for (let i = 0; i < json.length; i++) {
                //console.log(json[i])
                let id = json[i].id
                let cancel = `<button class="btn" id="delete" onclick='cancelBooking(${id})' title="Click to delete">Delete <i class="fas fa-trash"></i> </button>`
                let str = id + ',' + json[i].date + ',' + json[i].doctor_id + ',' + json[i].patient_id + ',' + json[i].time + ',' + json[i].userName;
                let accept = `<button class="btn" id="accept" onclick="acceptBooking('${str}')" title="Click to accept">Accept <i class="fas fa-check"></i></button>`
                let reject = `<button class="btn" id="reject" onclick="rejectBooking('${str}')" title="Click to reject">Reject <i class="fas fa-times"></i></button>`
                let doctorName = "";
                doctors.forEach(doc => {
                    if (doc.id === json[i].doctor_id) {doctorName = doc.name}
                });
                // const doctorData = doctors.find((doctor) => {
                //     return doctor.id == json[i].doctor_id
                // });
                let status = `<p style="color: #ffdd83">Pending</p>`
                if (json[i].status === "accepted") {
                    status = `<p style="color: limegreen">Accepted</p>`
                }
                if (json[i].status === "rejected") {
                    status = `<p style="color: red">Rejected</p>`
                }
                allBookings.innerHTML += '<tr id="bookings">' +
                    '<td>' + json[i].id + '</td>' +
                    '<td>' + json[i].userName + '</td>' +
                    '<td>' + json[i].doctor_id + " " +doctorName + '</td>' +
                    '<td>' + json[i].time + '</td>' +
                    '<td>' + json[i].date + '</td>' +
                    '<td>' + status + '</td>' +
                    '<td>' + accept + reject + cancel + '</td>' +
                    '</tr>'
            }
        })
}

function fetchDoctor() {
    fetch(URL+`doctors`)
        .then(response => response.json())
        .then(function (json) {
            // for (var i = 0; i < json.length; i++) {
            //     doctors = json;
            // }
            for (let i = 0; i < json.length; i++) {
                let obj = {id: json[i].id, name: json[i].name}
                doctors.push(obj)
            }
        })
}
