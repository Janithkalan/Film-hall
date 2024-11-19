/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

async function createAccount() {
    const user_dto = {
        first_name: document.getElementById("firstname").value,
        last_name: document.getElementById("lastname").value,
        email: document.getElementById("email").value,
        dob: document.getElementById("dob").value,
        nic: document.getElementById("nic").value,
        mobile: document.getElementById("mobile").value,
        password: document.getElementById("password").value,
        conf_password: document.getElementById("conf_password").value
    };

    const response = await fetch(
            "signup",
            {
                method: "POST",
                body: JSON.stringify(user_dto),
                headers: {
                    "Content-Type": "application/json"
                }
            }

    );
    if (response.ok) {

        const json = await response.json();

        if (json.success) {

            swal("", "Success!", "success").then(() => {
                window.location = "login.jsp";
            });

        } else {
            swal({
                title: "",
                text: json.message,
                icon: "error"
            });
        }
    }
}


