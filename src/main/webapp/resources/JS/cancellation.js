const today = new Date();
const month_array = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
const month = month_array[today.getMonth()];
const seatsDiv = document.querySelector(".seats");
var price;
var email;
var invoice;
var user_name;

async function load_data() {
    
    if (event.key !== "Control" && event.key !== " ") {//ignore Control key and spacebar

        let textResult = document.getElementById("invoice-id").value;

        const response = await fetch("cancellation?textResult=" + textResult);

        if (response.ok) {
            const json = await response.json();
            if (json.success) {
                let data = json.cancellation_data[0]; 

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
                
                // Clear any existing content
                const seatsDiv = document.querySelector(".seats");
                seatsDiv.innerHTML = ""; 
                // Create a new span element for each seat
                data.seat_id.forEach(seat => {
                    const seatSpan = document.createElement("span");
                    seatSpan.classList.add("seat"); 
                    seatSpan.textContent = seat; 
                    seatsDiv.appendChild(seatSpan);
                });

            } else {
                //if results not found
                document.getElementById("name").value = "";
                document.getElementById("email").value = "";
                document.getElementById("phone").value = "";
                document.getElementById("date").innerHTML = `&nbsp;&nbsp;  `;
                document.getElementById("hall").innerHTML = `&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;`;
                document.getElementById("time").innerHTML = "";
                document.getElementById("title").innerHTML = "";
                document.getElementById("total_price").innerHTML = "0";
                const seatsDiv = document.querySelector(".seats"); 
                seatsDiv.innerHTML = ""; 
                price = 0;
            }

        } else {
            //if server error
            document.getElementById("name").value = "";
            document.getElementById("email").value = "";
            document.getElementById("phone").value = "";
            document.getElementById("date").innerHTML = `&nbsp;&nbsp;  `;
            document.getElementById("hall").innerHTML = `&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;`;
            document.getElementById("time").innerHTML = "";
            document.getElementById("title").innerHTML = "";
            document.getElementById("total_price").innerHTML = "0";
            const seatsDiv = document.querySelector(".seats"); // Select the div with class 'seats'
                seatsDiv.innerHTML = ""; // Clear any existing content
            price = 0;
        }

    }


}

async function coupon() {
    //invoice field validation
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
                    
                    const response = await fetch(`create_coupon?total_price=${encodeURIComponent(price)}&email=${encodeURIComponent(email)}&invoice=${encodeURIComponent(invoice)}&user_name=${encodeURIComponent(user_name)}`);

                    if (!response.ok) {
                        throw new Error("Failed to fetch coupon: " + response.status);
                    } else {
                        seatsDiv.innerHTML = "";
                        price = 0;
                        document.getElementById("total_price").innerHTML = price;
                        
                        const json = await response.json();
                        swal("", "Coupon code sent to your email", "success").then(() => {
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



