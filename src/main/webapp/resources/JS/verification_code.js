/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



async function sendCode() {
    let email = document.getElementById("email").value;
    console.log(email);
    
    if(email == ""){
        swal({
                title: "",
                text: "Enter E-mail",
                icon: "error",
            });
        
    }else{
        const response = await fetch("verification_code?email=" + email);
    if (response.ok) {
        const  json = await response.json();

        if (json.validStatus) {
            if (json.success) {

                swal("", "Code sent", "success").then(() => {
                    window.location.href = "password_reset.jsp?param1=" + encodeURIComponent(email);
                });

            }else {
                swal({
                title: "",
                text: json.message,
                icon: "error",
            });
                
            }
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
