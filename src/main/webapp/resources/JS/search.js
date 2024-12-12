/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

async function searchResults(status1) {
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
                //movie cloning
                json.movie_list.forEach(movie => {
                    let dropdown_item_clone = dropdown_item.cloneNode(true);
                    dropdown_item_clone.querySelector(".resultImg").src = "resources/IMG/movies_posters/" + movie.id + ".png";
                    dropdown_item_clone.querySelector(".resultName").innerHTML = movie.name;
                    console.log(movie.name);
                    dropdown_item_clone.onclick = () => direct_page(status1, movie.movie_status_id, movie.id);
                    dropdown.appendChild(dropdown_item_clone);

                });
                dropdown.style.display = 'block';

            } else {
                dropdown.style.display = 'none';
            }

        } else {

        }
    }


}

function direct_page(status1, status, movieId) {//movie navigation
    //check user session
    if (status1 && status === 1) {
        window.location.href = "timeReservation.jsp?param1=" + encodeURIComponent(movieId);
    }else if(status === 2){
        window.location.href = "comming_soon.jsp?param1=" + encodeURIComponent(movieId);
    } else {
        swal("", "You need to login first", "error");
    }

}
