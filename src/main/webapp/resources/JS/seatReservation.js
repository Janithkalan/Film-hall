/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const dateElement = document.querySelector(".date");

function formatDate(date) {
    const DAYS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    const MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "De"];
    return `${DAYS[date.getDay()]}, ${date.getDate()} ${MONTHS[date.getMonth()]} `;
}

setInterval(() => {
    const now = new Date();
    dateElement.textContent = formatDate(now);
}, 200);



let selectedSeatsCount = 0;
let selectedSeats = [];

function updateSeatCount() {
    document.getElementById("seat-count").textContent = selectedSeatsCount;
}

function updateSeatInfoButtons() {
    const seatInfoButtons = document.querySelectorAll(".seat_info_btn");
    for (let i = 0; i < seatInfoButtons.length; i++) {
        if (selectedSeats[i]) {
            seatInfoButtons[i].textContent = selectedSeats[i];
            seatInfoButtons[i].style.display = 'block';
        } else {
            seatInfoButtons[i].textContent = "";
            seatInfoButtons[i].style.display = 'none';
        }
    }
}

document.querySelectorAll(".seat").forEach(function (seat) {
    seat.addEventListener("click", function () {
        if (selectedSeatsCount >= 4 && !seat.classList.contains("selected")) {
            swal({
                title: "",
                text: "You can select only 4 seat at one time",
                icon: "error",
            });
            return;
        }

        if (seat.classList.contains("selected")) {
            seat.classList.remove("selected");
            seat.style.backgroundColor = "#0000";
            selectedSeatsCount--;
            const seatIndex = selectedSeats.indexOf(seat.textContent);
            if (seatIndex > -1) {
                selectedSeats.splice(seatIndex, 1);
            }
        } else {
            seat.classList.add("selected");
            seat.style.backgroundColor = "#261CBA";
            selectedSeatsCount++;
            selectedSeats.push(seat.textContent);
        }

        updateSeatCount();
        updateSeatInfoButtons();
    });
});

//--------------------------------------------------------------------------------------------

let temp_date = 1;
let temp_hall = 1;
let temp_time = 1;

async function loadSeats(current_movie, current_date, current_time, current_hall) {

    const response = await fetch("seatReservation?current_date="+current_date+"&current_time="+current_time+"&current_movie="+current_movie+"&current_hall="+current_hall);

    if (response.ok) {
        const json = await response.json();

        if (json.success) {
            
           document.getElementById("movie_name").innerHTML = json.movie_name;
           document.getElementById("hall_name").innerHTML = json.hall_name;
           document.getElementById("time_name").innerHTML = json.show_time;

            
           console.log(current_movie);
           console.log(current_date);
           console.log(current_time);
           console.log(current_hall);
           console.log(json);
           console.log("is ok");
           
            json.seatReservationDetails.forEach(reservation => {
                
//                if (reservation.seat_status === 4) {
//                    let x = document.getElementById("" + seat_id + "");
//                    x.classList.add("pendingSeat");
//
//                } else if (reservation.seat_status === 2) {
//
//                    let x = document.getElementById("" + seat_id + "");
//                    x.classList.add("unavailableSeat");
//
//
//                } else if (reservation.seat_status === 3) {
//
//                    let x = document.getElementById("" + seat_id + "");
//                    x.classList.add("reservedSeat");
//
//                }




            });

        } else {
            console.log("not ok");
        }


    }

}