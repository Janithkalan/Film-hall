/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let sendEmail;

function loadEmail(email) {
    document.getElementById("email").value = email;
    sendEmail = email;

}

async function reset() {
    let verification = document.getElementById("verification").value;
    let password = document.getElementById("password").value;
    let repassword = document.getElementById("repassword").value;

    if (verification == "") {
        swal({
            title: "",
            text: "Enter verification code",
            icon: "error",
        });
    } else {

        const response = await fetch("password_reset?verification=" + verification + "&password=" + password + "&repassword=" + repassword + "&email=" + sendEmail);

        if (response.ok) {

            const json = await response.json();

            if (json.success) {

                swal("", json.message, "success").then(() => {
                    window.location.href = "login.jsp";
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