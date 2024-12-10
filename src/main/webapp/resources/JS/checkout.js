/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

let final_price;

function calculatePrice(total_price, hall_name) {

    let vat;
    let conv;


    if (hall_name == "IMAX") {
        document.getElementById("vat").innerHTML = 200;
        document.getElementById("conv").innerHTML = 500;
        conv = 500;
        vat = 200;

    } else if (hall_name == "GOLD CLASS 3D") {
        document.getElementById("vat").innerHTML = 100;
        document.getElementById("conv").innerHTML = 350;
        conv = 350;
        vat = 100
    } else if (hall_name == "DIGITAL 3D") {
        document.getElementById("vat").innerHTML = 50;
        document.getElementById("conv").innerHTML = 200;
        conv = 200;
        vat = 50;
    }
    final_price = conv + vat + total_price;
    document.getElementById("final_price").innerHTML = final_price;
    
}


async function paymentProcess(reservation_dto_json) {

    
    const response = await fetch("checkout?final_price=" + final_price);

    if (response.ok) {
        const json = await response.json();


        // Payment completed. It can be a successful failure.
        payhere.onCompleted = async function onCompleted(orderId) {
            const reservation_dto_json_encoded = encodeURIComponent(JSON.stringify(reservation_dto_json));
            const response = await fetch("seatReservationInsert?reservation_dto_json="+reservation_dto_json_encoded+"&invoice="+orderId);
            const response2 = await fetch("price_insert?final_price=" + final_price + "&invoice="+orderId);
            if (response.ok){
                const json = await response.json();
                if (json.success){
                    console.log("GGGGGG");
                }
            }

        };

        // Payment window closed
        payhere.onDismissed = function onDismissed() {
            // Note: Prompt user to pay again or show an error page
            console.log("Payment dismissed");
        };

        // Error occurred
        payhere.onError = function onError(error) {
            // Note: show an error page
            console.log("Error:" + error);
        };

        // Put the payment variables here
        var payment = {
            "sandbox": true,
            "merchant_id": "1228948", // Replace your Merchant ID
            "return_url": "http://localhost:8080/CinemaHall/checkout.jsp", // Important
            "cancel_url": "http://localhost:8080/CinemaHall/checkout.jsp", // Important
            "notify_url": "http://sample.com/notify",
            "order_id": json.orderId,
            "items": "",
            "amount": final_price,
            "currency": json.currency,
            "hash": json.hash, // *Replace with generated hash retrieved from backend
            "first_name": json.first_name,
            "last_name": json.last_name,
            "email": "sudheeradilum@gmail.com",
            "phone": "0754801443",
            "address": "No.1, Galle Road",
            "city": "Colombo",
            "country": "Sri Lanka",
            "delivery_address": "No. 46, Galle road, Kalutara South",
            "delivery_city": "Kalutara",
            "delivery_country": "Sri Lanka",
            "custom_1": "",
            "custom_2": ""
        };

        payhere.startPayment(payment);


    }
}



//MjQ1MDQ2MTYzMzg4NDUwOTc0NjkwODExODc5Mjc0MTc3MzQ5Mw==