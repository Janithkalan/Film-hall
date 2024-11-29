const today = new Date();
const today_date = today.getDate();
const month_array = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
const month = month_array[today.getMonth()];

async function timeReservationDetails() {
    const response = await fetch("timeReservation");

    if (response.ok) {
        const json = await response.json();

        if (json.success) {
            let movie_dropdown = document.getElementById("movie_dropdown");
            let movie_title = document.getElementById("movie_title");
            let movie_description = document.getElementById("movie_description");
            let movie_rating = document.getElementById("movie_rating");
            let movie_poster = document.getElementById("movie_poster");
            let movie_trailer = document.getElementById("movie_trailer");
            let date_dropdown = document.getElementById("date_dropdown");




            movie_dropdown.innerHTML = "";
            date_dropdown.innerHTML = "";


            json.timeReservationDetails.forEach(movie => {
                let option = document.createElement("option");
                option.value = movie.id;
                option.text = movie.name;
                movie_dropdown.appendChild(option);
            });

            movie_dropdown.addEventListener("change", () => {
                let selectedId = parseInt(movie_dropdown.value);
                let selectedMovie = json.timeReservationDetails.find(movie => movie.id === selectedId);

                if (selectedMovie) {

                    movie_title.innerHTML = selectedMovie.name;
                    movie_description.innerHTML = selectedMovie.movie_description;
                    movie_rating.innerHTML = selectedMovie.ratings;
                    movie_poster.src = "resources/IMG/reservationPosters/" + selectedMovie.id + ".png";
                    movie_trailer.href = selectedMovie.trailer_link;

                }
                date_dropdown.innerHTML = "";
                let addedDates = new Set();
                json.timeTableDetails.forEach(schedule => {
                    if (schedule.movie_id === selectedId && !addedDates.has(schedule.date)) {  // && schedule.date >= today_date
                        addedDates.add(schedule.date);                                         // add this code later inside the if condition
                        let option = document.createElement("option");
                        option.value = schedule.date;
                        option.text = `${schedule.day} ${schedule.date} ${month}`;
                        date_dropdown.appendChild(option);
                    }
                });

            });


        } else {

        }
    } else {

    }
}

let imax_btn = document.getElementById("imax_btn");
let gold_btn = document.getElementById("gold_btn");
let digital_btn = document.getElementById("digital_btn");

async function loadBtn() {

    let imax = document.getElementById("imax");
    let gold = document.getElementById("gold");
    let digital = document.getElementById("digital");


    let movie_id = document.getElementById("movie_dropdown").value;
    let day_id = document.getElementById("date_dropdown").value;


    const response = await fetch("button_load?movie_id=" + movie_id + "&day_id=" + day_id);

    if (response.ok) {

        const json = await response.json();
        if (json.success) {

            digital.innerHTML = "";
            gold.innerHTML = "";
            imax.innerHTML = "";


            let imax_added = false;
            let gold_added = false;
            let digital_added = false;


            json.timeTableDetails.forEach(item => {
                if (item.hall_id === 3) { // if digital 3d
                    let digital_btn_clone = digital_btn.cloneNode(true);
                    digital_btn_clone.innerHTML = item.show_time.substring(0, 7);
                    digital.appendChild(digital_btn_clone);
                    digital_added = true;
                } else if (item.hall_id === 2) { // if gold class
                    let gold_btn_clone = gold_btn.cloneNode(true);
                    gold_btn_clone.innerHTML = item.show_time.substring(0, 7);
                    gold.appendChild(gold_btn_clone);
                    gold_added = true;
                } else if (item.hall_id === 1) { // if imax
                    let imax_btn_clone = imax_btn.cloneNode(true);
                    imax_btn_clone.innerHTML = item.show_time.substring(0, 7);
                    imax.appendChild(imax_btn_clone);
                    imax_added = true;
                }

            });

            if (!imax_added) {
                let no_imax_message = document.createElement("p");
                no_imax_message.textContent = "No IMAX shows available";
                imax.appendChild(no_imax_message);
            }

            if (!gold_added) {
                let no_gold_message = document.createElement("p");
                no_gold_message.textContent = "No GOLD shows available";
                gold.appendChild(no_gold_message);
            }

            if (!digital_added) {
                let no_digital_message = document.createElement("p");
                no_digital_message.textContent = "No DIGITAL shows available";
                digital.appendChild(no_digital_message);
            }
        }


    }

}

document.getElementById("date_dropdown").addEventListener("change", () => {
    loadBtn();
});

document.getElementById("movie_dropdown").addEventListener("change", () => {
    loadBtn();
});


function navigate_hall(current_hall) {

    var current_movie = document.getElementById("movie_dropdown").value;
    var current_date = document.getElementById("date_dropdown").value;
    
    if (current_hall === 1){
        var current_time = document.getElementById("imax_btn").innerHTML;
    } else if (current_hall === 2){
        var current_time = document.getElementById("gold_btn").innerHTML;
    } else if (current_hall === 3){
        var current_time = document.getElementById("digital_btn").innerHTML;
    }
    
    
    window.location.href = "seatReservation.jsp?param1=" + encodeURIComponent(current_movie) + 
            "&param2=" + encodeURIComponent(current_date)+ 
            "&param3=" + encodeURIComponent(current_time)+ 
            "&param4=" + encodeURIComponent(current_hall);
    
}
