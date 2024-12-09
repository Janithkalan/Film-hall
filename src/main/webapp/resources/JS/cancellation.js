const today = new Date();
const month_array = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
const month = month_array[today.getMonth()];
async function load_data() {
    
    let textResult = document.getElementById("invoice-id").value;

    const response = await fetch("cancellation?textResult=" + textResult);

    if (response.ok) {
        const json = await response.json();
        if (json.success) {
            console.log(json.cancellation_data);
            let data = json.cancellation_data[0]; // Access the first object in the array
            
            document.getElementById("name").value = data.name;
            document.getElementById("email").value = data.email;
            document.getElementById("phone").value = data.mobile;
            document.getElementById("date").innerHTML = `&nbsp;&nbsp;${data.weekday} ${data.date} ${month}  `;
            document.getElementById("hall").innerHTML = `&nbsp;&nbsp;&nbsp;${data.hall}&nbsp;&nbsp;&nbsp;`;
            document.getElementById("time").innerHTML = ` ${data.show_time} `;
            // Assuming `data.seat_id` contains the seat IDs array
            const seatsDiv = document.querySelector(".seats"); // Select the div with class 'seats'
            seatsDiv.innerHTML = ""; // Clear any existing content

            data.seat_id.forEach(seat => {
                // Create a new span element for each seat
                const seatSpan = document.createElement("span");
                seatSpan.classList.add("seat"); // Add the 'seat' class
                seatSpan.textContent = seat; // Set the text content to the seat ID
                seatsDiv.appendChild(seatSpan); // Append the span to the seats div
            });

        } else {
            // Handle the case when success is false
        }

    } else {

    }
}

