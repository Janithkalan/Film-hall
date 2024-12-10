/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


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
            
        swal("", "Thank You for Subscribing to Newsletter", "success").then(() => {
                document.getElementById("newsletter_email").value = "";
            });
        }
    }

}
