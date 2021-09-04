let doctors = [];
let URL = 'https://dabsbackend.herokuapp.com/';
// function to run onload
document.addEventListener('DOMContentLoaded', function () {
    //sessionStorage.setItem("state","danh1215") //Comment this line when build
    let state = sessionStorage.getItem("state")
    // fetchDoctor();
    getBookings();
})

// This is function to delete a booking
function cancelBooking(id) {
    if (confirm("Are you sure you want to cancel this appointment?\n *Note: You can rebook a new one")) {
        fetch(URL+`bookings/${id}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => {
            alert("Booking successfully canceled.")
        }).then(res => location.reload())
    }
}

// This is get booking function
function getBookings() {
    fetchDoctor();
    let state = sessionStorage.getItem("state")
    let pastBookings = document.getElementById("pastBookings")
    let upcomingBookings = document.getElementById("upcomingBookings")
    let today = new Date()
    fetch(URL+'bookings/' + state).then(res => res.json())
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
            })

            for (let i = 0; i < json.length; i++) {
                // if the bookings made later than the current time, move them to past bookings table
                if (today > new Date(parseInt(json[i].date.split("-")[0]),
                    parseInt(json[i].date.split("-")[1]) - 1,
                    parseInt(json[i].date.split("-")[2]),
                    parseInt(json[i].time.split(":")[0]),
                    parseInt(json[i].time.split(":")[1]))) {
                    let doctorName = "";
                    doctors.forEach(doc => {
                        if (doc.id === json[i].doctor_id) {doctorName = doc.name}
                    });
                    // const doctorData = doctors.find((doctor) => {
                    //     return doctor.id == json[i].doctor_id
                    // });
                    pastBookings.innerHTML += '<tr id="pb">' +
                        '<td>' + json[i].id + '</td>' +
                        '<td>' + json[i].doctor_id + " "+ doctorName + '</td>' +
                        '<td>' + json[i].time + '</td>' +
                        '<td>' + json[i].date + '</td>' + '</tr>'
                } else {
                    // if not, the bookings will be put in upcoming table
                    let id = json[i].id
                    let cancel = `<button class="btn btn-outline-primary" id="delete" title="Click to cancel appointment" onclick='cancelBooking(${id})'>Cancel</button>`
                    let doctorName = ""
                    doctors.forEach(doc => {
                        if (doc.id === json[i].doctor_id) {doctorName = doc.name}
                    })
                    // status: null => Pending, "accepted" => Accepted, "rejected" => Rejected
                    let status = `<p style="color: #ffdd83">Pending</p>`
                    if (json[i].status === "accepted") {
                        status = `<p style="color: limegreen">Accepted</p>`
                    }
                    if (json[i].status === "rejected") {
                        status = `<p style="color: red">Rejected</p>`
                    }
                    upcomingBookings.innerHTML += '<tr id="bookings">' +
                        '<td>' + json[i].id + '</td>' +
                        '<td>' + json[i].doctor_id + " "+ doctorName + '</td>' +
                        '<td>' + json[i].time + '</td>' +
                        '<td>' + json[i].date + '</td>' +
                        '<td>' + status + '</td>' +
                        '<td>' + cancel + '</td>' +
                        '</tr>'
                }
            }
        })

}

function fetchDoctor() {
    fetch(URL + `doctors`)
        .then(res => res.json()) // This is fetching doctors
        .then(json => {
            for (let i = 0; i < json.length; i++) {
                let obj = {id: json[i].id, name: json[i].name}
                doctors.push(obj)
            }
        })
}