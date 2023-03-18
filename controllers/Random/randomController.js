const db = require("../../config/db.config");
const Flash = require("../../utils/Flash");

exports.renderRandom = (req, res, next) => {
  try {
    db.query("select id,class_name from classes", (e, data) => {
      if (e) {
        next(e)
      } else {
        res.render("random", {
          title: "Combined",
          flashMessage: Flash.getMessage(req),
          classes: data
        });
      }
    })
  } catch (error) {
    next(error)
  }

};
exports.randomView = (req, res, next) => {
  try {
    db.query("select school_name from schools where id=1", (e, data) => {
      if (e) {
        next(e)
      } else {
        console.log(data);
      }
    })
    res.render("random/view-questions", {
      title: "View",
      flashMessage: Flash.getMessage(req),
    });
  } catch (error) {
    next(error)
  }

};
exports.randomGenerator= (req, res, next) => {
  try {
    const classId = req.query.class_id;
    const subject = req.query.subject;
    const numQuestions = req.query.total_qus;
    let q_formate = req.query.q_formate;

    if (q_formate == 'mcq') {
      q_formate = 'questions'
    } else {
      q_formate = 'creative'
    }
    if (subject !== '0') {
      db.query(`SELECT question_text,question_option from ${q_formate} where class_id=${classId} and subject_id = ${subject}  order by rand() limit  ${numQuestions}`, (error, data, fields) => {
        if (error) {
          next(error)
          return
        } else {
          res.render('random/view-questions', { flashMessage: Flash.getMessage(req), title: 'View Questions',data })
        }
      });
    } else {
      db.query(`SELECT id FROM subject_list WHERE class_id = ${classId}`, (error, data, fields) => {
        if (error) {
          next(error)
          return
        }
        const numSubjects = data.length;
        const ids = data.map(row => row.id);
        const questionsPerSubject = Math.floor(numQuestions / numSubjects);
        const remainder = numQuestions % numSubjects;
        console.log(questionsPerSubject, remainder, ids.join(', '));

        const query = `SELECT question_text, question_option FROM ( SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_id ORDER BY RAND ()) AS row_num FROM ${q_formate} AS subquery WHERE subject_id IN (${ids.join(', ')})) AS subquery2 WHERE row_num <= (CASE WHEN subject_id = ${data[data.length - 1].id} THEN ${questionsPerSubject + remainder} ELSE ${questionsPerSubject} END)`;
        db.query(query, (e, qus) => {
          if (e) {
            next(e)
          } else {
            console.log(qus.length);
            res.render('random/view-questions', { flashMessage: Flash.getMessage(req), title: 'View Questions',data:qus })
          }
        })
      });
    }

  } catch (error) {
    next(error)
  }

};