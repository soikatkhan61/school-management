const db = require("../../config/db.config")

exports.allMovieGetController = async (req, res, next) => {
  try {
      res.render('pages/client-movie/by_category', { flashMessage: '', title: 'Movies', })
  } catch (error) {
    next(error)
  }

};

exports.filterMovie = async (req, res, next) => {
  let category = req.query.category
  let year = req.query.year
  let genre = req.query.genre
  let offset = req.query.offset
  let letter = req.query.letter
  console.log(req.query);
  //contract the query
  let sql = 'SELECT * FROM movies';
  let sqlParams = [];
  if (category) {
    sql += ' WHERE FIND_IN_SET(?, movie_category)';
    sqlParams.push(category);
  }

  if (year) {
    sql += (sqlParams.length > 0 ? ' AND ' : ' WHERE ') + 'movie_year = ?';
    sqlParams.push(year);
  }

  if (genre) {
    sql += (sqlParams.length > 0 ? ' AND ' : ' WHERE ') + 'movie_genre = ?';
    sqlParams.push(genre);
  }
  if (letter) {
    sql += (sqlParams.length > 0 ? ' AND ' : ' WHERE ') + `title LIKE '${letter}%'`;
    sqlParams.push(letter);
  }
  sql += ' LIMIT 12'
  if (offset) {
    sql += ` OFFSET ${offset}`;
  }
  console.log(sql);

  try {
    db.query(sql, sqlParams,(e, data) => {
      if (e) {
        next(e)
      } else {
        res.send(data)
      }
    })
  } catch (error) {
    next(error)
  }
}

exports.fetchMovieByCategory = async (req, res, next) => {
  try {
    let category = req.query.category
    db.query(
      "SELECT title,poster,rating,ttcode,movie_link,movie_category,movie_year FROM movies WHERE FIND_IN_SET(?, movie_category) order by id desc limit 15 ",
      [category],
      (err, data) => {
        if (err) {
          next(err)
        } else {
          res.send(data)
        }
      }
    );
  } catch (error) {
    next(error)
  }

};

exports.movieByCategory = async (req, res, next) => {
  try {
    let category = req.query.category
    console.log(category + " is ");
    db.query(
      "SELECT title,poster,rating,ttcode,movie_link,movie_category,movie_year FROM movies WHERE FIND_IN_SET(?, movie_category) order by id desc limit 15 ",
      [category],
      (err, data) => {
        if (err) {
          next(err)
        } else {
          res.render('pages/client-movie/by_category', { flashMessage: '', title: 'Movies' })
        }
      }
    );
  } catch (error) {
    next(error)
  }

};

exports.renderSingleMovie = async (req, res, next) => {
  let ttcode = req.query.ttcode
  let render = req.query.render
  console.log("tt code is :" + ttcode);
  try {
    db.query("select * from movies where ttcode=? LIMIT 1", [ttcode], (e, data) => {
      if (e) {
        next(e)
      } else {
        console.log(data);
        if(render == 'false'){
          res.send({data:data[0]})
        }else{
          res.render("pages/client-movie/single-movie", { data, flashMessage: '' })
        }
      }
    })
  } catch (error) {
    next(error)
  }
}
