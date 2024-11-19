/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

async function searchResults() {
    let textResult = document.getElementById("search-input").value;
    let dropdown = document.getElementById("dropdown");
    let dropdown_item = document.getElementById("dropdown-item");


    if (textResult === "") {
        dropdown.style.display = 'none';
    } else {
        const response = await fetch("search?textResult=" + textResult);

        if (response.ok) {
            const json = await response.json();

            if (json.success) {
                dropdown.innerHTML = "";

                json.movie_list.forEach(movie => {
                    let dropdown_item_clone = dropdown_item.cloneNode(true);
                    dropdown_item_clone.querySelector(".resultImg").src = "resources/IMG/movies_posters/" + movie.id + ".png";
                    dropdown_item_clone.querySelector(".resultName").innerHTML = movie.name;
                    console.log(movie.name);
                    dropdown.appendChild(dropdown_item_clone);

                });
                dropdown.style.display = 'block';

            } else {
                dropdown.style.display = 'none';
                console.log("not found");
            }

        } else {
           
        }
    }


}