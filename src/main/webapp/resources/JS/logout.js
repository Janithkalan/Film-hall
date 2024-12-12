/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

async function logout_process() {
    //logout process
    const response = await fetch("logout");

    if (response.ok) {
        window.location = "index.jsp";
    }


}

function login_process() {

    window.location = "login.jsp";
}