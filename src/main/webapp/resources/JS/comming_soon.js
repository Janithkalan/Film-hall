const urlParams = new URLSearchParams(window.location.search);
const movieID = urlParams.get('param1');
console.log(movieID);

async function comingSoonDetails() {
    const response = await fetch("comming_soon");

    if (response.ok) {
        const json = await response.json();

        if (json.success) {
            let movie_title = document.getElementById("movie_title");
            let movie_description = document.getElementById("movie_description");
            let movie_rating = document.getElementById("movie_rating");
            let movie_poster = document.getElementById("movie_poster");
            let movie_trailer = document.getElementById("movie_trailer");
            let story_text = document.getElementById("story_text");

            let selectedId = parseInt(movieID);
            let selectedMovie = json.comingSoonDetails.find(movie => movie.id === selectedId);
            if (selectedMovie) {
                movie_title.innerHTML = selectedMovie.name;
                movie_description.innerHTML = selectedMovie.movie_description;
                movie_rating.innerHTML = selectedMovie.ratings;
                movie_poster.src = "resources/IMG/reservationPosters/" + selectedMovie.id + ".png";
                movie_trailer.href = selectedMovie.trailer_link;
                story_text.innerHTML = selectedMovie.movie_story;
            }
        } else {

        }
    } else {

    }
}