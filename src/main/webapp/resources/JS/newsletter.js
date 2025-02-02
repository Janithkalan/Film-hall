/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//add newsletter subscribers
async function newsletter() {
    let email = document.getElementById("newsletter_email").value;

    if (email == "") {
        swal({
            title: "",
            text: "Enter your email",
            icon: "error",
        });
    } else {
        const response = await fetch("newsletter?email=" + email);
        if (response.ok) {
            const json = await response.json();
            if (json.success) {
                swal("", "Thank You for Subscribing to Newsletter", "success").then(() => {
                    document.getElementById("newsletter_email").value = "";
                });
            } else {

                swal({
                    title: "",
                    text: json.message,
                    icon: "error",
                });
            }


        }
    }

}
