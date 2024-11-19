/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

async function submit(){
    
    const contact_dto = {
        name:document.getElementById("name").value,
        email:document.getElementById("email").value,
        mobile:document.getElementById("mobile").value,
        message:document.getElementById("message").value
    };
    
    const response = await fetch(
            "contact",
            {
                method: "POST",
                body: JSON.stringify(contact_dto),
                headers: {
                    "Content-Type": "application/json"
                }
            }

    );
    if (response.ok) {

        const json = await response.json();

        if (json.success) {

            swal("", "Email sent", "success").then(() => {
                location.reload();
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
