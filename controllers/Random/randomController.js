const db = require("../../config/db.config");
const Flash = require("../../utils/Flash");

exports.renderRandom = (req, res, next) => {
  try {
    db.query("select id,class_name from classes;select school_name from schools where id=1",[req.user.school_id], (e, data) => {
      if (e) {
        next(e)
      } else {
        res.render("random", {
          title: "Combined",
          flashMessage: Flash.getMessage(req),
          classes: data[0],
          school:data[1]
        });
      }
    })
  } catch (error) {
    next(error)
  }
};
exports.randomView = (req, res, next) => {
  try {
    db.query("select school_name from schools where id=?",[req.user.school_id], (e, data) => {
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

    let{class_id,subject,total_qus,q_formate,name,total_mark,school_name} = req.query
    console.log(req.query);
    if (q_formate == 'mcq') {
      q_formate = 'questions'
    } else {
      q_formate = 'creative'
    }
    let obj = {name,total_qus,total_mark,school_name,q_formate}
    if (subject !== '0') {
      db.query(`SELECT question_text,question_option from ${q_formate} where class_id=${class_id} and subject_id = ${subject}  order by rand() limit  ${total_qus}`, (error, data, fields) => {
        if (error) {
          next(error)
          return
        } else {
          res.render('random/view-questions', { flashMessage: Flash.getMessage(req), title: 'View Questions',data,obj })
        }
      });
    } else {
      db.query(`SELECT id FROM subject_list WHERE class_id = ${class_id}`, (error, data, fields) => {
        if (error) {
          next(error)
          return
        }
        const numSubjects = data.length;
        const ids = data.map(row => row.id);
        const questionsPerSubject = Math.floor(total_qus / numSubjects);
        const remainder = total_qus % numSubjects;
        console.log(questionsPerSubject, remainder, ids.join(', '));

        const query = `SELECT question_text, question_option FROM ( SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_id ORDER BY RAND ()) AS row_num FROM ${q_formate} AS subquery WHERE subject_id IN (${ids.join(', ')})) AS subquery2 WHERE row_num <= (CASE WHEN subject_id = ${data[data.length - 1].id} THEN ${questionsPerSubject + remainder} ELSE ${questionsPerSubject} END)`;
        db.query(query, (e, qus) => {
          if (e) {
            next(e)
          } else {
            res.render('random/view-questions', { flashMessage: Flash.getMessage(req), title: 'View Questions',data:qus,obj })
          }
        })
      });
    }

  } catch (error) {
    next(error)
  }

};