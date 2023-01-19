const API_KEY = "1bb5a2ddc6796b51ec4bfb1e54c809f5";
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
const tv_id = document.getElementById("tv_id");

function get_data(url) {
  fetch(url)
    .then((res) => res.json())
    .then((data) => {
      data = data.tv_results[0];
      console.log(data);
      let id = data.id;
      let title = data.name;
      let poster = data.poster_path;
      let overview = data.overview;
      let release_date = data.first_air_date;
      let vote_average = data.vote_average;
      let runtime = data.runtime;
      let genres = data.genres;
      let youtube = data.youtube;
      
      tv_id.value = id
      movie_title.value = title;
      movie_r_date_2.value = release_date;
      release_year.value = release_date;
      youtube_trailer.value = youtube ? youtube : "";
      
      rating.value = vote_average;
      overviewStroy.value = overview;

      posterImg.src = `https://image.tmdb.org/t/p/original/${poster}`;
      posters.value = poster;

      const TV_URL =
      BASE_URL +
      `/tv/${id}?api_key=${API_KEY}&language=en-US`;

      const CAST_URL =
      BASE_URL +
      `/tv/${id}/credits?api_key=${API_KEY}&language=en-US`;
      
      get_tv(TV_URL);
      get_cast(CAST_URL);
    });
}

function get_tv(url){
  fetch(url)
  .then((res) => res.json())
  .then((data) => {
    let homepages = data.homepage
    let spokenLanguages = data.spoken_languages;
    let genres = data.genres
    console.log(spokenLanguages);
    hompage.value = homepages;
    movie_genre.value = genres.map((x) => x.name).toString();
    movie_language.value = spokenLanguages.map((x) => x.english_name).toString();
   console.log(data);
  });
}


function get_cast(url) {
  fetch(url)
    .then((res) => res.json())
    .then((castdata) => {
      

      let cast = castdata.cast
      console.log(cast);

     let i = 0

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



get_movie.addEventListener("click", (e) => {
    e.preventDefault();
    let tt_code = input_val.value;
  
    const API_URL =
      BASE_URL +
      `/find/${tt_code}?api_key=${API_KEY}&language=en-US&external_source=imdb_id`;
  
   
      
  
    get_data(API_URL);
    get_cast(CAST_URL);
    
  });
  