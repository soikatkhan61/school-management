const API_KEY = "api_key=1bb5a2ddc6796b51ec4bfb1e54c809f5";
const BASE_URL = "https://api.themoviedb.org/3";

const dc = document.getElementById("movie_data");
const movie_r_date_2 = document.getElementById("movie_r_date_2");
const movie_title = document.getElementById("movie_title");
const youtube_trailer = document.getElementById("youtube_trailer");
const release_year = document.getElementById("release_year");
const movie_language = document.getElementById("movie_language");
const rating = document.getElementById("rating");
const movie_runtime = document.getElementById("movie_runtime");
const movie_genre = document.getElementById("movie_genre");
const posterImg = document.getElementById("poster");
const hompage = document.getElementById("hompage");
const overviewStroy = document.getElementById("overview");
const posters = document.getElementById("posterss");

const imgID = document.getElementById("img");

const get_movie = document.getElementById("get_movie");
const input_val = document.getElementById("tt_code");

function get_data(url) {
  fetch(url)
    .then((res) => res.json())
    .then((data) => {
      console.log(data);
      let id = data.id;
      let title = data.title;
      let poster = data.poster_path;
      let overview = data.overview;
      let release_date = data.release_date;
      let vote_average = data.vote_average;
      let runtime = data.runtime;
      let genres = data.genres;
      let youtube = data.youtube;
      let castname = data.castname;
      let castprofile = data.castprofile;
      let finalCastcharacter = data.finalCastcharacter;
      let crewname = data.crewname;
      let crewprofile = data.crewprofile;
      let finalCrewdepartment = data.finalCrewdepartment;
      let homepage = data.homepage;
      let keywords = data.keywords;
      let spokenLanguages = data.spoken_languages;
      let images = data.images;

      movie_title.value = title;
      movie_r_date_2.value = release_date;
      release_year.value = release_date;
      youtube_trailer.value = youtube ? youtube : "";
      movie_language.value = spokenLanguages
        .map((x) => x.english_name)
        .toString();
      rating.value = vote_average;
      movie_runtime.value = runtime;
      movie_genre.value = genres.map((x) => x.name).toString();
      hompage.value = homepage;
      overviewStroy.value = overview;

      posterImg.src = `https://image.tmdb.org/t/p/original/${poster}`;
      posters.value = poster;
    });
}

function get_screenshot(url) {
  fetch(url)
    .then((res) => res.json())
    .then((data) => {
      console.log("ss");
    });
}

function get_cast(url) {
  fetch(url)
    .then((res) => res.json())
    .then((castdata) => {

      let cast = castdata.cast
      let crew = castdata.crew
     let i = 0
     crew.map(c =>{
        i++
        createElementByCrew(c.original_name,c.department,c.profile_path)

      })
      
      cast.map(c =>{

        createElementByCast(c.character,c.original_name,c.profile_path)

      })
    });
}



function createElementByCast(character,name,profilepic){
    let div1, div2, div3;
    let img, p1, p2;
    div1 = document.createElement("div");
    div2 = document.createElement("div");
    div3 = document.createElement("div");
    
    img = document.createElement("img");
    p1 = document.createElement("p");
    p2 = document.createElement("p");
    
    p1.innerText = character;
    p2.innerText = name;
    
    div3.appendChild(p1);
    div3.appendChild(p2);
    
    div2.appendChild(img);
    div2.appendChild(div3);
    
    div1.appendChild(div2);
    
    div1.classList.add("col-sm-6", "col-md-3", "col-lg-2");
    div2.classList.add("card");
    img.classList.add("card-img-top");
    img.src = `https://image.tmdb.org/t/p/original/${profilepic}`
    div3.classList.add("card-body");
    p1.classList.add("card-text");
    p2.classList.add("card-text");
    
    let cast_row = document.getElementById("cast_row");
    cast_row.appendChild(div1);
    
}

function createElementByCrew(character,name,profilepic){
    let div1, div2, div3;
    let img, p1, p2;
    div1 = document.createElement("div");
    div2 = document.createElement("div");
    div3 = document.createElement("div");
    
    img = document.createElement("img");
    p1 = document.createElement("p");
    p2 = document.createElement("p");
    
    p1.innerText = character;
    p2.innerText = name;
    
    div3.appendChild(p1);
    div3.appendChild(p2);
    
    div2.appendChild(img);
    div2.appendChild(div3);
    
    div1.appendChild(div2);
    
    div1.classList.add("col-sm-6", "col-md-3", "col-lg-2");
    div2.classList.add("card");
    img.classList.add("card-img-top");
    img.src = `https://image.tmdb.org/t/p/original/${profilepic}`
    div3.classList.add("card-body");
    p1.classList.add("card-text");
    p2.classList.add("card-text");
    
    let cast_row = document.getElementById("crew_row");
    cast_row.appendChild(div1);
    
}


get_movie.addEventListener("click", (e) => {
    e.preventDefault();
    let tt_code = input_val.value;
  
    const API_URL =
      BASE_URL +
      `/movie/${tt_code}?api_key=1bb5a2ddc6796b51ec4bfb1e54c809f5&language=en-US&external_source=imdb_id`;
  
    const CAST_URL =
      BASE_URL +
      `/movie/${tt_code}/credits?api_key=1bb5a2ddc6796b51ec4bfb1e54c809f5&language=en-US`;
  
    const SCREENSHOT_URL =
      BASE_URL +
      `/movie/${tt_code}/images?api_key=1bb5a2ddc6796b51ec4bfb1e54c809f5&language=en-US`;
  
    get_data(API_URL);
    get_cast(CAST_URL);
    get_screenshot(SCREENSHOT_URL);
  });


