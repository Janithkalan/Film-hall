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

const hasSpace = / /;
async function paymentProcess(reservation_dto_json) {


    if (document.getElementById("terms").checked) {
        const response = await fetch("checkout?final_price=" + final_price);

        if (response.ok) {
            const json = await response.json();


            // Payment completed. It can be a successful failure.
            payhere.onCompleted = async function onCompleted(orderId) {
                const reservation_dto_json_encoded = encodeURIComponent(JSON.stringify(reservation_dto_json));
                const response = await fetch("seatReservationInsert?reservation_dto_json=" + reservation_dto_json_encoded + "&invoice=" + orderId);
                const response2 = await fetch("price_insert?final_price=" + final_price + "&invoice=" + orderId);

                if (response.ok) {

                    const json = await response.json();
                    if (json.success) {
                        swal("", "Thank You for reservation", "success").then(() => {
                            window.location = "index.jsp";
                        });
                    }

                }
            };

            // Payment window closed
            payhere.onDismissed = function onDismissed() {
                swal({
                    title: "",
                    text: "Payment dismissed",
                    icon: "warning",
                });
            };

            // Error occurred
            payhere.onError = function onError(error) {
                swal({
                    title: "",
                    text: "Error" + error,
                    icon: "error",
                });
            };

            // Put the payment variables here
            var payment = {
                "sandbox": true,
                "merchant_id": "1228948",
                "return_url": "http://localhost:8080/CinemaHall/checkout.jsp",
                "cancel_url": "http://localhost:8080/CinemaHall/checkout.jsp",
                "notify_url": "http://sample.com/notify",
                "order_id": json.orderId,
                "items": "",
                "amount": final_price,
                "currency": json.currency,
                "hash": json.hash,
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
    } else {
        swal({
            title: "",
            text: "You must agree to terms and conditions",
            icon: "error",
        });
    }


}

