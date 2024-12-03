/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function calculatePrice(total_price,hall_name){
    
    let vat;
    let conv;
    
    
    if (hall_name == "IMAX"){
        document.getElementById("vat").innerHTML = 200;
        document.getElementById("conv").innerHTML = 500;
        conv = 500;
        vat = 200;
        
    } else if (hall_name == "GOLD CLASS 3D"){
        document.getElementById("vat").innerHTML = 100;
        document.getElementById("conv").innerHTML = 350;
        conv = 350;
        vat = 100
    } else if (hall_name == "DIGITAL 3D"){
        document.getElementById("vat").innerHTML = 50;
        document.getElementById("conv").innerHTML = 200;
        conv = 200;
        vat = 50;
    }
    document.getElementById("final_price").innerHTML = conv+vat+total_price;
    
}