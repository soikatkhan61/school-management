const db = require("../config/db.config");

exports.renderHome = (req, res, next) => {
  try {
    const start = Date.now();
    res.render('index',{flashMessage:''})
    const end = Date.now();
    const timeTaken = end - start;
    console.log(`Time taken to render page: ${timeTaken}ms`);
  } catch (error) {
    next(error);
  }
};
