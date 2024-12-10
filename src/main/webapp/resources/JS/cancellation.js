const today = new Date();
const month_array = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
const month = month_array[today.getMonth()];
const seatsDiv = document.querySelector(".seats");
var price;
var email;
var invoice;
var user_name;

async function load_data() {
    if (event.key !== "Control") {
        
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
                document.getElementById("title").innerHTML = data.movie_name;
                document.getElementById("total_price").innerHTML = data.total_price;
                price = data.total_price;
                email = data.email;
                invoice = data.invoice;
                user_name = data.name;

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
            // Handle network or server errors
        }
    }
}

async function coupon() {
    if (price > 0) {
        try {
            // Send the coupon code and total price to the servlet
            const response = await fetch(`create_coupon?total_price=${encodeURIComponent(price)}&email=${encodeURIComponent(email)}&invoice=${encodeURIComponent(invoice)}&user_name=${encodeURIComponent(user_name)}`);

            if (!response.ok) {
                throw new Error("Failed to fetch coupon: " + response.status);
            } else {
                seatsDiv.innerHTML = "";
                price = 0;
                document.getElementById("total_price").innerHTML = price;
                // Read the response from the servlet
                const message = await response.text();
                alert(message); // Display the response (e.g., coupon code or error message)
            }
        } catch (error) {
            console.error("Error:", error);
            alert("An error occurred: " + error.message);
        }
    } else {
        alert("Price must be greater than zero.");
    }
}
