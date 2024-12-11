const slides = document.querySelectorAll(".slides img");
const slideDescriptions = [
    "VENOM: THE LAST DANCE",
    "MERRY LITTLE BATMAN",
    "TRANSFORMERS ONE"
];
const slideLinks = [
    "https://www.youtube.com/watch?v=aFsGDcy-6hc",
    "https://youtu.be/9PeJn8vca98",
    "https://www.youtube.com/watch?v=SIAqc-N_bd0"

];

const sliderPages = [
    "timeReservation.jsp?param1=2",
    "timeReservation.jsp?param1=15",
    "timeReservation.jsp?param1=3"
];
    


let slideIndex = 0;
let intervalId = null;

document.addEventListener("DOMContentLoaded", initializeSlider);

function initializeSlider() {
    if (slides.length > 0) {
        slides[slideIndex].classList.add("displaySlide");
        updateText(slideIndex);
        updateLink(slideIndex);
        updateBook(slideIndex);
        intervalId = setInterval(nextSlide, 5000);
    }
}

function showSlide(index) {
    if (index >= slides.length) {
        slideIndex = 0;
    } else if (index < 0) {
        slideIndex = slides.length - 1;
    }
    slides.forEach(slide => slide.classList.remove("displaySlide"));
    slides[slideIndex].classList.add("displaySlide");
    updateText(slideIndex);
    updateLink(slideIndex);
    updateBook(slideIndex);
}

function prevSlide() {
    slideIndex--;
    showSlide(slideIndex);
    resetInterval();
}

function nextSlide() {
    slideIndex++;
    showSlide(slideIndex);
    resetInterval();
}

function updateText(index) {
    const textElement = document.getElementById("text");
    if (textElement) {
        textElement.innerHTML = slideDescriptions[index] || "";
    }
}

function updateLink(index) {
    const sliderLink = document.getElementById("sliderLink");
    if (sliderLink) {
        sliderLink.href = slideLinks[index];
    }
}

function updateBook(index) {
    const sliderPage = document.getElementById("sliderPage");
    if (sliderPage) {
        sliderPage.href = sliderPages[index];
    }
}

function resetInterval() {
    clearInterval(intervalId);
    intervalId = setInterval(nextSlide, 5000);
}


// -------------------------------------------------------------


// Declare a global variable to store the movie data
let movieData = null;

async function load_movies(status) {
    const response = await fetch("load_movies");

    if (response.ok) {
        const json = await response.json();

        if (json.success) {
            // Store the JSON object in the global variable
            movieData = json;

            let div1 = document.getElementById("div1");
            let div2 = document.getElementById("div2");
            let updiv1 = document.getElementById("updiv1");
            let updiv2 = document.getElementById("updiv2");

            div1.innerHTML = "";

            json.movie_list.forEach(movie => {
                let div2_clone = div2.cloneNode(true);
                div2_clone.querySelector(".thumbnail").src = "resources/IMG/movies_posters/" + movie.id + ".png";
                div2_clone.querySelector(".span1").innerHTML = movie.name;
                div2_clone.onclick = () => direct_timeReservation(status,movie.id);
                
                div1.appendChild(div2_clone);
            });

            updiv1.innerHTML = "";

            json.upcomming_movies_list.forEach(movie => {
                let updiv2_clone = updiv2.cloneNode(true);
                updiv2_clone.querySelector(".thumbnail").src = "resources/IMG/movies_posters/" + movie.id + ".png";
                updiv2_clone.querySelector(".upspan1").innerHTML = movie.name;
                updiv2_clone.onclick = () => direct_comingSoon(movie.id);
                updiv1.appendChild(updiv2_clone);
            });
        } else {
            
        }
    }
}

function direct_timeReservation(status,movieId) {
    if (status){
        window.location.href = "timeReservation.jsp?param1=" + encodeURIComponent(movieId);
    }else{
        swal("", "You need to login first", "error");
    }
    
}

function direct_comingSoon(movieId) {
    window.location.href = "comming_soon.jsp?param1=" + encodeURIComponent(movieId);
}
