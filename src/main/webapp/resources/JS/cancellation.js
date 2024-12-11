const today = new Date();
const month_array = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
const month = month_array[today.getMonth()];
const seatsDiv = document.querySelector(".seats");
var price;
var email;
var invoice;
var user_name;

async function load_data() {

    if (event.key !== "Control" && event.key !== " ") {

        let textResult = document.getElementById("invoice-id").value;

        const response = await fetch("cancellation?textResult=" + textResult);

        if (response.ok) {
            const json = await response.json();
            if (json.success) {
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
                document.getElementById("name").value = "";
                document.getElementById("email").value = "";
                document.getElementById("phone").value = "";
                document.getElementById("date").innerHTML = `&nbsp;&nbsp;  `;
                document.getElementById("hall").innerHTML = `&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;`;
                document.getElementById("time").innerHTML = "";
                document.getElementById("title").innerHTML = "";
                document.getElementById("total_price").innerHTML = "";
                const seatsDiv = document.querySelector(".seats"); // Select the div with class 'seats'
                seatsDiv.innerHTML = ""; // Clear any existing content
                price = 0;
            }

        } else {
            document.getElementById("name").value = "";
            document.getElementById("email").value = "";
            document.getElementById("phone").value = "";
            document.getElementById("date").innerHTML = `&nbsp;&nbsp;  `;
            document.getElementById("hall").innerHTML = `&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;`;
            document.getElementById("time").innerHTML = "";
            document.getElementById("title").innerHTML = "";
            document.getElementById("total_price").innerHTML = "";
            const seatsDiv = document.querySelector(".seats"); // Select the div with class 'seats'
            seatsDiv.innerHTML = ""; // Clear any existing content
            price = 0;
        }

    }


}

async function coupon() {

    if (document.getElementById("invoice-id").value === "") {

        swal({
            title: "",
            text: "Enter invoice number",
            icon: "warning",
        });

    } else if (price === 0){
        
        swal({
            title: "",
            text: "Invalid invoice number",
            icon: "error",
        });
        
    }else {

        if (document.getElementById("confirm-cancel").checked) {
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
                        const json = await response.json();
                        swal("", json.message, "success").then(() => {
                            window.location = "index.jsp";
                        });
                    }
                } catch (error) {
                    console.error("Error:", error);
                }
            } else {

            }
        } else {
            swal({
                title: "",
                text: "You need to confirm your cancellation",
                icon: "warning",
            });

        }


    }




}



