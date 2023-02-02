const db = require("../../../config/db.config");
const fs = require("fs");
const Flash = require("../../../utils/Flash");
const slugify = require("slugify");


exports.renderAllQuestions = (req, res, next) => {
  let id = req.query.id;

  db.query("select poster from movies where id = ?", [id], (e, data) => {
    if (e) {
      next(e);
    } else {

    }
  });
};

exports.renderAllClass = (req, res, next) => {
  try {
    db.query("select * from classes limit 30", (e, data) => {
      if (e) {
        next(e)
      } else {
        res.render("user/admin/question/class", { data, title: "Subjects", flashMessage: Flash.getMessage(req) })
      }
    });
  } catch (error) {
    next(error)
  }
};
exports.createClassPost = (req, res, next) => {
  try {
    let { class_name, desc } = req.body;

    db.query("insert into classes values(?,?,?)", [null, class_name, desc], (e, data) => {
      if (e) {
        next(e)
      } else {
        res.redirect("/user/admin/questions/class")
      }
    });
  } catch (error) {
    next(error)
  }
};
exports.renderAllSubject = (req, res, next) => {
  db.query("select * from classes", (e, data) => {
    if (e) {
      next(e)
    } else {
      res.render("user/admin/question/subject", { data, title: "Subjects", flashMessage: Flash.getMessage(req) })
    }
  });
};

exports.getSubjectByClass = (req, res, next) => {
  let class_id = req.query.class_id
  db.query("select classes.class_name,subject_list.* from subject_list join classes on  subject_list.class_id=classes.id where class_id=?", [class_id], (e, data) => {
    if (e) {
      next(e)
    } else {
      res.render("user/admin/question/subject_by_class", { data, class_id, title: "Subjects", flashMessage: Flash.getMessage(req) })
    }
  });
};

exports.createSubjectPost = (req, res, next) => {
  let { class_name, subject_name, subject_code } = req.body;
  db.query("insert into subject_list values(?,?,?,?)", [null, class_name, subject_name, subject_code], (e, data) => {
    if (e) {
      next(e)
    } else {
      res.redirect("/user/admin/questions/subject")
    }
  });
};
exports.getSubject = (req, res, next) => {
  let class_id = req.query.class_id;
  db.query("select * from subject_list where class_id = ?", [class_id], (e, data) => {
    if (e) {
      next(e)
    } else {
      res.send(data)
    }
  });
};
exports.getChapter = (req, res, next) => {
  let class_id = req.query.class_id;
  let subject_id = req.query.subject_id;
  db.query("select * from chapter where class_id = ? and subject_id =?", [class_id,subject_id], (e, data) => {
    if (e) {
      next(e)
    } else {
      res.send(data)
    }
  });
};

exports.renderCreateChapter = (req, res, next) => {
  try {
    db.query("select subject_name,id from subject_list;select * from classes", (e, data) => {
      if (e) {
        next(e)
      } else {
        console.log(data);
        res.render("user/admin/question/chapter", { data, title: "Chapter", flashMessage: Flash.getMessage(req) })
      }
    })

  } catch (error) {
    next(error)
  }
};

exports.createChaptePost = (req, res, next) => {
  try {
    let { class_name, subject_id, chapter } = req.body;
    db.query("insert into chapter values(?,?,?,?)", [null, class_name, subject_id, chapter], (e, data) => {
      if (e) {
        next(e)
      } else {
        res.redirect("/user/admin/questions/create-chapter")
      }
    });

  } catch (error) {
    next(error)
  }
};

exports.getChapterBySubjectAndClass = (req, res, next) => {
  try {
    let class_id = req.query.class_id
    let subject_id = req.query.subject_id
    db.query("select chapter.*, classes.class_name,classes.id as class_id,subject_list.subject_name, subject_list.id as subject_id from chapter join classes on classes.id= chapter.class_id join subject_list on chapter.subject_id = subject_list.id WHERE chapter.subject_id = ? and chapter.class_id = ?",[subject_id,class_id], (e, data) => {
      if (e) {
        next(e)
      } else {
        console.log(data);

        res.render("user/admin/question/chapter-by-subject-and-class", { data, title: "Chapter", flashMessage: Flash.getMessage(req) })
      }
    })

  } catch (error) {
    next(error)
  }
};

exports.renderCreateQuestion = (req, res, next) => {
  try {
    db.query("select * from classes",(e,data)=>{
      if(e){
        next(e)
      }else{
        res.render("user/admin/question/create", { data,title: "Create Question", flashMessage: Flash.getMessage(req) })
      }
    })
  } catch (error) {
    next(error)
  }
};
exports.createQuestionPost = (req, res, next) => {
  let {class_id,subject_id,chapter_id,question_text,question_option,question_answer} = req.body
  let options = [];
  question_option.forEach(e =>{
    options.push(e);
  })

  try {
    db.query("insert into questions values(?,?,?,?,?,?,?,?)",[null,class_id,subject_id,chapter_id,null,question_text,JSON.stringify(options),question_answer],(e,data)=>{
      if(e){
        next(e)
      }else{
        res.redirect('/user/admin/create-question')
      }
    })
  } catch (error) {
    next(error)
  }
};
exports.renderSeeQuestion = (req, res, next) => {
  let {class_id,subject_id,chapter_id} = req.query
  try {
    db.query("SELECT questions.*, classes.class_name, subject_list.subject_name, chapter.chapter_name FROM questions JOIN classes ON questions.class_id = classes.id JOIN subject_list ON questions.subject_id = subject_list.id JOIN chapter ON questions.chapter_id = chapter.id WHERE questions.class_id=? and questions.subject_id=? and questions.chapter_id=?",[class_id,subject_id,chapter_id],(e,data)=>{
      if(e){
        next(e)
      }else{
        console.log(data);
        res.render("user/admin/question/see-questions", { data,title: "See Question", flashMessage: Flash.getMessage(req) })
      }
    })
  } catch (error) {
    next(error)
  }
};



