<%-- 
    Document   : timeReservation
    Created on : Nov 19, 2024, 4:42:42 PM
    Author     : Dilum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Venom: The Last Dance</title>
    <link rel="stylesheet" type="text/css" href="resources/CSS/timeReservation.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></link>
</head>
<body>
    <div class="im">
        <div class="details">
            <span class="big">VENOM: THE LAST DANCE</span>
            <div class="small">(U) . 1h 49M . Friday, October 25, 2024 . ENGLISH . ACTION<br>
                Tom Hardy, Juno Temple</div>
        </div>
        <span class="imdb">
            <img src="resources/IMG/imdb.png" alt="imdb">
            IMDb - 6.2/10
        </span>
        <a href="https://www.youtube.com/watch?v=__2bjWbetsA" target="_blank" id="trail">
        <span class="trailer">
            <img src="resources/IMG/show.png" alt="trailer">
            WACTH TRAILER </span></a>
        </span>
        <img src="resources/IMG/venom.png" alt="Venom: The Last Dance">
    </div>
    <div >
        <h1>BUY TICKETS</h1>
        <div class="drop">
            <div class="date_movie">
            <table>
                <tr>
                    <td class="dropdown-cell">
                        <div class="cell">
                            <span><img src="resources/IMG/Calendar.png" alt=""></span>
                            <span>
                                <select name="date" id="date">
                                    <option value="today" selected hidden>Today</option>
                                    <option value="13" id="option-0">Wed, 13 Nov</option>
                                    <option value="14" id="option-1">Thu, 14 Nov</option>
                                    <option value="15" id="option-2">Fri, 15 Nov</option>
                                    <option value="16" id="option-3">Sat, 16 Nov</option>
                                    <option value="17" id="option-4">Sun, 17 Nov</option>
                                </select>
                            </span>
                        </div>
                    </td>
                    <td class="dropdown-cell" style="width:60%;">
                        <select name="movie" id="movie">
                            <option value="Venom: The Last Dance" id="Venom-The-Last-Dance">Venom: The Last Dance</option>
                            <option value="Deadpool & Wolverine" id="Deadpool-Wolverine">Deadpool & Wolverine</option>
                            <option value="Transformers One" id="Transformers-One">Transformers One</option>
                        </select>
                    </td>
                </tr>
            </table>
            <div class="word">
                <div id="available">AVAILABLE</div>
                <div id="sold">SOLD OUT</div>
                <div id="lapsed">UNAVAILABLE</div>
            </div>
            </div>
        </div>
    </div>
    <div class="location">
        <div><img src="resources/IMG/location.png" alt=""></div>
        <div>MOONBEAM CINEMAS MULTIPLEX - Havelock City Mall</div>
    </div>
    <div>
        <div class="category">
            <div>DIGITAL 3D</div>
            <div><img src="resources/IMG/digital.png" alt=""></div>
        </div>
        <div class="time">
            <button id="1045" class="available">10:45 AM</button>
            <button id="0345" class="available">03:45 PM</button>
            <button id="0800" class="available">08:00 PM</button>
        </div>
    </div>
    <div>
        <div class="category">
            <div>GOLD 3D</div>
            <div><img src="resources/IMG/gold.png" alt=""></div>
        </div>
        <div class="time">
            <button id="1145" class="available">11:45 AM</button>
            <button id="0545" class="available">05:45 PM</button>
        </div>
    </div>
    <div>
        <div class="category">
            <div>IMAX 3D</div>
            <div><img src="resources/IMG/imax.png" alt=""></div>
        </div>
        <div class="time">
            <button id="1145" class="available">11:45 AM</button>
            <button id="0220" class="available">02:20 PM</button>
            <button id="0445" class="available">04:45 PM</button>
            <button id="0730" class="available">07:30 PM</button>
            <button id="0945" class="available">09:45 PM</button>
        </div>
    </div>
    <script>
        const selectElement = document.getElementById("date");
    
        selectElement.addEventListener("change", function() {
            if (selectElement.value === "13") {
                selectElement.value = "today";
            } else {
                selectElement.options[0].hidden = true;
            }
        });
    </script>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
