const API_KEY = "api_key=1bb5a2ddc6796b51ec4bfb1e54c809f5";
const BASE_URL = "https://api.themoviedb.org/3";



const background = document.getElementById("background");
const overviewStroy = document.getElementById("overview");
const castDom = document.getElementById("cast");
const trailer = document.getElementById("trailer");
const youtube_frame = document.getElementById("youtube_frame");
const modal_close_btn = document.getElementById("modal_close_btn");



function get_data(url) {
  fetch(url)
    .then((res) => res.json())
    .then((data) => {
      let backdrop_path = data.backdrop_path;
      let overview = data.overview;
      background.style.backgroundImage = `linear-gradient(90deg,#031b23 10%,transparent 150%),linear-gradient(0deg,#031b23 0,transparent 50%),url('https://image.tmdb.org/t/p/original/${backdrop_path}')`
      overviewStroy.innerText = overview
    });
}


function get_cast(url) {
  fetch(url)
    .then((res) => res.json())
    .then((castdata) => {
      
      let cast = castdata.cast
      //console.log(cast);
      let cast_data = ''
      for (let i = 0; i < 5 && i < cast.length; i++) {
        console.log(i);
        cast_data += `
        <div class="mx-2">
            <img class="object-cover" src="https://image.tmdb.org/t/p/original/${cast[i].profile_path ? cast[i].profile_path :'' }" alt="" height="90" width="90">
                <center>
                <p class="mt-2">${cast[i].name}</p>
            </center>
        </div>
        `
      }
      castDom.innerHTML = cast_data
      cast_data = ''
    });
}

function get_youtube(url) {
  fetch(url)
    .then((res) => res.json())
    .then((data) => {
      if(data.results.length>0){
        trailer.style.display = 'block'
        trailer.addEventListener('click',(e)=>{
          youtube_frame.src = `https://www.youtube.com/embed/${data.results[0].key}`
        })
      }
    });
}

modal_close_btn.addEventListener('click',(e)=>{
  youtube_frame.src = ''
})





const API_URL =BASE_URL +`/movie/${tt_code}?${API_KEY}&language=en-US&external_source=imdb_id`;
const CAST_URL =BASE_URL + `/movie/${tt_code}/credits?${API_KEY}&language=en-US`;
const YOUTUBE_URL = BASE_URL + `/movie/${tt_code}/videos?${API_KEY}`;

get_data(API_URL);
get_cast(CAST_URL);
get_youtube(YOUTUBE_URL);


