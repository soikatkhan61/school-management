const db = require("../../../config/db.config");
const fs = require("fs");
const Flash = require("../../../utils/Flash");
const slugify = require("slugify");
const path = require("path");
const download = require("image-downloader");
const webp = require("webp-converter");
const fetch = (...args) =>
  import("node-fetch").then(({ default: fetch }) => fetch(...args));

const API_KEY = "1bb5a2ddc6796b51ec4bfb1e54c809f5";
const BASE_URL = "https://api.themoviedb.org/3";

exports.renderAddTVPage = (req, res, next) => {
  res.render("admin/tv/ad-tv", { title: "TV Panel", flashMessage: "" });
};

exports.addTvPostController = async (req, res, next) => {
  let {
    ttcode,
    tv_id,
    title,
    release_date,
    posters,
    youtube_trailer,
    tv_language,
    tv_runtime,
    rating,
    tv_genre,
    tv_category,
  } = req.body;
  let tv_year = release_date.substr(0, 4);

  if (tv_category) {
    tv_category = tv_category.toString();
  }

  const options = {
    url: `https://image.tmdb.org/t/p/original${posters}`,
    dest: path.join(__dirname), // will be saved to /path/to/dest/image.jpg
  };

  let file_name, poster;
  file_name = posters.toString();
  let removeExt = file_name.substring(0, file_name.length - 4);
  let final_name = removeExt.slice(1);
  poster = `/uploads/${removeExt.slice(1)}.webp`;

  async function processImage() {
    download
      .image(options)
      .then(async ({ filename }) => {
        const result = webp.cwebp(
          filename,
          `public/uploads/${final_name}.webp`,
          "-q 80",
          (logging = "-v")
        );

        result.then((response) => {
          fs.unlink(path.join(__dirname, file_name.slice(1)), function (err) {
            if (err) throw err;
            console.log("file deleted.");
          });
        });
      })
      .catch((err) => console.error(err));
  }

  await processImage();

  db.query(
    "insert into tv values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
    [
      null,
      ttcode,
      tv_id,
      poster,
      title,
      release_date,
      tv_year,
      youtube_trailer,
      tv_language,
      rating,
      tv_genre,
      tv_category,
      null,
      null,
    ],
    (e, data) => {
      if (e) {
        next(e);
      } else {
        req.flash("success", "Movie Added Successfull");
        res.redirect('/admin/all-tv')
      }
    }
  );
};

exports.renderAllTV = (req, res, next) => {
  let currentPage = parseInt(req.query.page) || 1;
  let itemPerPage = 10;

  db.query(
    "select count(*) as count from tv;select id,tv_id,poster,title,tv_year,rating,createdAt from tv order by id desc",
    (e, data) => {
      if (e) {
        next(e);
      } else {
        let totalMovies = data[0];
        let totalPage = totalMovies[0].count / itemPerPage;
        console.log(data[1]);
        res.render("admin/tv/all-tv", {
          title: "Update TV",
          flashMessage: Flash.getMessage(req),
          data: data[1],
          currentPage,
          itemPerPage,
          totalPage,
          totalMovies,
        });
      }
    }
  );
};

exports.renderEditTV = (req, res, next) => {
  let id = req.query.id;

  db.query("select * from tv where id = ?", [id], (e, data) => {
    if (e) {
      next(e);
    } else {
      res.render("admin/tv/edit-tv", {
        title: "Edit TV",
        flashMessage: Flash.getMessage(req),
        data: data[0],
      });
    }
  });
};

exports.updateTVPost = (req, res, next) => {
  let { tv_category, id } = req.body;

  if (tv_category) {
    tv_category = tv_category.toString();
  }

  try {
    db.query(
      "update tv set tv_category=? where id=?",
      [tv_category, id],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          console.log(data);
          req.flash("success", "Successfully changed information");
          res.redirect(`/admin/edit-tv?id=${id}`);
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.renderAddEpisodes = async (req, res, next) => {
  const TV_URL =
    BASE_URL + `/tv/${req.query.tv_id}?api_key=${API_KEY}&language=en-US`;

  try {
    let tvData;
    let tv_db_id = req.query.tv_db_id;

    await fetch(TV_URL)
      .then((res) => res.json())
      .then((data) => {
        console.log(data);
        tvData = data;
      });

    res.render(`admin/tv/add-episodes`, {
      flashMessage: Flash.getMessage(req),
      tvData,
      tv_db_id,
    });
  } catch (error) {
    next(error);
  }
};

exports.fetchEpisodesNumber = async (req, res, next) => {
  try {
    const TV_URL =
      BASE_URL + `/tv/${req.query.tv_id}?api_key=${API_KEY}&language=en-US`;
    let season = req.query.season;

    console.log(season);

    let episodes_count;

    await fetch(TV_URL)
      .then((res) => res.json())
      .then((data) => {
        console.log(data.seasons[season]);
        episodes_count = data.seasons[season].episode_count;
      });
    res.send({ episodes_count });
  } catch (error) {
    next(error);
  }
};

exports.addEpisodePost = (req, res, next) => {
  try {
    let { tv_db_id, season, episodes, link, quality } = req.body;
    db.query(
      "insert into episodes values(?,?,?,?,?,?,?,?)",
      [null, tv_db_id, season, episodes, link, quality, null, null],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          req.flash("success", "Episod added");
          res.redirect("/admin/all-tv");
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.renderSeeEpisodes = (req, res, next) => {
  try {
    let tv_db_id = req.query.tv_db_id;
    let season = new Set();
    db.query(
      "select * from episodes where tv_series_id=? order by episodes asc",
      [tv_db_id],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          data.map((d) => {
            season.add(d.season);
          });
          res.render("admin/tv/see-episodes", {
            flashMessage: Flash.getMessage(req),
            data,
            season,
          });
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.editEpisode = async (req, res, next) => {
  try {
    let id = req.query.id;
    db.query(
      "select episodes.*,tv.tv_id,tv.id as tv_db_id from episodes join tv on episodes.tv_series_id = tv.id where episodes.id=?",
      [id],
      async (e, data) => {
        if (e) {
          next(e);
        } else {
          const TV_URL =
            BASE_URL + `/tv/${data[0].tv_id}?api_key=${API_KEY}&language=en-US`;
          let tvData;
          await fetch(TV_URL)
            .then((res) => res.json())
            .then((data) => {
              console.log(data);
              tvData = data;
            });

          res.render("admin/tv/edit-episodes", {
            flashMessage: Flash.getMessage(req),
            data,
            tvData,
            tv_db_id: data[0].tv_db_id,
          });
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.editEpisodePost = (req, res, next) => {
  console.log(req.body);
  let { id,tv_db_id, season, episodes, link, quality } = req.body;
  db.query("update episodes set tv_series_id=?,season=?,episodes=?,link=?,quality=? where id=?",[tv_db_id,season,episodes,link,quality,id],(e,data)=>{
    if(e){
      next(e)
    }else{
      req.flash("success",'Update Successfull')
      res.redirect(`/admin/edit-episodes?id=${id}`)
    }
  })
  try {
  } catch (error) {
    next(error);
  }
};
