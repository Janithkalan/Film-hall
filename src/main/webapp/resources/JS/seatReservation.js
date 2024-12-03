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
let price_change = 0;


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

document.querySelectorAll(".seat").forEach(function (seat) {
    seat.addEventListener("click", function () {

        if (document.getElementById("hall_name").innerHTML == "IMAX") {
            if (seat.classList.contains("selected")) {
                price_change += 4000.00;
                document.getElementById("total_price").innerHTML = price_change;
            } else {
                price_change -= 4000.00;
                document.getElementById("total_price").innerHTML = price_change;

            }

        } else if (document.getElementById("hall_name").innerHTML == "DIGITAL 3D") {

            if (seat.classList.contains("selected")) {
                price_change += 2000.00;
                document.getElementById("total_price").innerHTML = price_change;
            } else {
                price_change -= 2000.00;
                document.getElementById("total_price").innerHTML = price_change;

            }

        } else if (document.getElementById("hall_name").innerHTML == "GOLD CLASS 3D") {

            if (seat.classList.contains("selected")) {
                price_change += 3000.00;
                document.getElementById("total_price").innerHTML = price_change;
            } else {
                price_change -= 3000.00;
                document.getElementById("total_price").innerHTML = price_change;

            }
        }


    });
});

async function loadSeats(current_movie, current_date, current_time, current_hall) {

    const response = await fetch("seatReservation?current_date=" + current_date + "&current_time=" + current_time + "&current_movie=" + current_movie + "&current_hall=" + current_hall);

    if (response.ok) {
        const json = await response.json();

        if (json.success) {

            document.getElementById("movie_name").innerHTML = json.movie_name;
            document.getElementById("hall_name").innerHTML = json.hall_name;
            document.getElementById("time_name").innerHTML = current_time;


            json.seatReservationDetails.forEach(reservation => {

                if (reservation.seat_status === 4) {
                    let temp_btn = document.getElementById("" + reservation.seat_id + "");
                    temp_btn.classList.add("pendingSeat");
                    temp_btn.disabled = true;

                } else if (reservation.seat_status === 2) {

                    let temp_btn = document.getElementById("" + reservation.seat_id + "");
                    temp_btn.classList.add("unavailableSeat");
                    temp_btn.disabled = true;


                } else if (reservation.seat_status === 3) {

                    let temp_btn = document.getElementById("" + reservation.seat_id + "");
                    temp_btn.classList.add("reservedSeat");
                    temp_btn.disabled = true;

                }

            });

        } else {
            
        }


    }

}


async function seatReservationProcess(current_movie, current_date, current_time, current_hall) {


    
            const reservation_dto = {
                hall_id: current_hall,
                screen_time: current_time,
                date_id: current_date,
                movie_id: current_movie,
                seat_id: selectedSeats,
                seat_status: 3
            };
            
            const response = await fetch(
                "seatReservationInsert",
                {
                    method: "POST",
                    body: JSON.stringify(reservation_dto),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }
            );
    
            if (response.ok) {

        const json = await response.json();

        if (json.success) {

            swal({
                title: "",
                text: "nononoonono",
                icon: "success"
            });

        } else {
            swal({
                title: "",
                text: "error",
                icon: "error"
            });
        }
    }
        
}

function navigateCheckout(){
    
    let moive_name = document.getElementById("movie_name").innerHTML;
    let hall_name = document.getElementById("hall_name").innerHTML;
    let time_name = document.getElementById("time_name").innerHTML;
    let seat_count = document.getElementById("seat-count").innerHTML;
    let total_price = document.getElementById("total_price").innerHTML;
    
    
    window.location.href = "checkout.jsp?param1=" + encodeURIComponent(moive_name) + 
            "&param2=" + encodeURIComponent(hall_name)+ 
            "&param3=" + encodeURIComponent(time_name)+
            "&param4=" + encodeURIComponent(seat_count)+
            "&param5=" + encodeURIComponent(total_price);
    
    
}