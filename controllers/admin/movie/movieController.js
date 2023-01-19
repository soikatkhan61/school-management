const db = require("../../../config/db.config");
const fs = require("fs");
const Flash = require("../../../utils/Flash");
const slugify = require("slugify");
const path = require("path");
const download = require("image-downloader");

const webp = require("webp-converter");

exports.renderAddMoviePage = (req, res, next) => {
  res.render("admin/movie/add-movie", {
    title: "Create a movie",
    flashMessage: "",
  });
};

exports.addMoviePostController = async (req, res, next) => {
  console.log(req.body);
  let {
    ttcode,
    title,
    release_year,
    posters,
    youtube_trailer,
    movie_language,
    rating,
    movie_genre,
    movie_category,
    multiple_upload,
    quality,
    movie_link,
    subtitle_link,
  } = req.body;
  let movie_year = release_year.substr(0, 4);
  console.log(movie_language);

  if (movie_category) {
    movie_category = movie_category.toString();
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
    "insert into movies values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
    [
      null,
      ttcode,
      poster,
      null,
      title,
      release_year,
      movie_year,
      youtube_trailer,
      movie_language,
      rating,
      movie_genre,
      movie_category,
      multiple_upload,
      quality,
      movie_link,
      subtitle_link,
      null,
      null,
    ],
    (e, data) => {
      if (e) {
        next(e);
      } else {
        req.flash("success", "Movie Added Successfull");
        res.redirect("/admin/update-movie");
      }
    }
  );
};

exports.renderUpdatePage = (req, res, next) => {
  let currentPage = parseInt(req.query.page) || 1;
  let itemPerPage = 15;

  db.query(
    "select count(*) as count from movies;select id,poster,title,movie_year,movie_category,quality,createdAt from movies order by id desc limit ?",[itemPerPage],
    (e, data) => {
      if (e) {
        next(e);
      } else {
        let totalMovies = data[0];
        let totalPage = totalMovies[0].count / itemPerPage;

        res.render("admin/movie/update-movie", {
          title: "Update movie",
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

exports.renderEdit = (req, res, next) => {
  let id = req.query.id;

  db.query("select * from movies where id = ?", [id], (e, data) => {
    if (e) {
      next(e);
    } else {
      res.render("admin/movie/edit-movie", {
        title: "Edit movie",
        flashMessage: Flash.getMessage(req),
        data: data[0],
      });
    }
  });
};

exports.editMoviePostController = (req, res, next) => {
  let {
    movie_category,
    multiple_upload,
    quality,
    movie_link,
    subtitle_link,
    id,
  } = req.body;
  if (movie_category) {
    movie_category = movie_category.toString();
  }
  try {
    db.query(
      "update movies set movie_category=?, multiple_upload=?,quality=?,movie_link=?,subtitle_link=? where id=?",
      [movie_category, multiple_upload, quality, movie_link, subtitle_link, id],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          console.log(data);
          req.flash("success", "Successfully changed information");
          res.redirect(`/admin/edit-movie?id=${id}`);
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.deleteMovie = (req, res, next) => {
  let id = req.query.id;

  db.query("select poster from movies where id = ?", [id], (e, data) => {
    if (e) {
      next(e);
    } else {
      fs.unlink(`public${data[0].poster}`, function (err) {
        if (err && err.code == "ENOENT") {
          console.info("File doesn't exist, won't remove it.");
        } else if (err) {
          console.error("Error occurred while trying to remove file");
        } else {
          console.info(`removed`);
        }
      });

      db.query("delete from movies where id = ?", [id], (e, data) => {
        if (e) {
          next(e);
        } else {
          req.flash("success", "Successfully Deleted");
          res.redirect("/admin/update-movie");
        }
      });
    }
  });
};



