const db = require("../../../config/db.config");
const Flash = require("../../../utils/Flash");

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
    db.query("select * from classes", (e, data) => {
      if (e) {
        next(e);
      } else {
        res.render("user/admin/question/class", {
          data,
          title: "Subjects",
          flashMessage: Flash.getMessage(req),
        });
      }
    });
  } catch (error) {
    next(error);
  }
};
exports.createClassPost = (req, res, next) => {
  try {
    let { class_name, desc, editId } = req.body;
    if (editId) {
      db.query(
        "update classes set class_name=? , class_description = ? where id =?",
        [class_name, desc, editId],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows > 0) {
              req.flash("success", "Update success");
            } else {
              req.flash("fail", "Update failed");
            }
            res.redirect("/user/admin/questions/class");
          }
        }
      );
    } else {
      db.query(
        "insert into classes values(?,?,?)",
        [null, class_name, desc],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows > 0) {
              req.flash("success", "create success");
            } else {
              req.flash("fail", "create failed");
            }
            res.redirect("/user/admin/questions/class");
          }
        }
      );
    }
  } catch (error) {
    next(error);
  }
};
exports.renderAllSubject = (req, res, next) => {
  db.query(
    `SELECT c.id AS class_id, c.class_name, COUNT(q.id) AS total_questions
  FROM classes AS c
  LEFT JOIN (
    SELECT class_id, id
    FROM questions
    UNION ALL
    SELECT class_id, id
    FROM creative
    UNION ALL
    SELECT class_id, id
    FROM q_others
  ) AS q ON c.id = q.class_id
  GROUP BY c.id, c.class_name;
  `,
    (e, data) => {
      if (e) {
        next(e);
      } else {
        res.render("user/admin/question/subject", {
          data,
          title: "Subjects",
          flashMessage: Flash.getMessage(req),
        });
      }
    }
  );
};

exports.getSubjectByClass = (req, res, next) => {
  let class_id = req.query.class_id;
  db.query(
    "select classes.class_name,classes.id as class_id,subject_list.* from subject_list join classes on  subject_list.class_id=classes.id where class_id=?",
    [class_id],
    (e, data) => {
      if (e) {
        next(e);
      } else {
        if (data.length == 0) {
          db.query(
            `select id as class_id,class_name from classes where id=${class_id}`,
            (e, data) => {
              if (e) {
                next(e);
              } else {
                res.render("user/admin/question/subject_by_class", {
                  data,
                  subject_listing: false,
                  class_id,
                  title: "Subjects",
                  flashMessage: Flash.getMessage(req),
                });
              }
            }
          );
        } else {
          res.render("user/admin/question/subject_by_class", {
            data,
            class_id,
            subject_listing: true,
            title: "Subjects",
            flashMessage: Flash.getMessage(req),
          });
        }
      }
    }
  );
};
exports.createSubjectPost = (req, res, next) => {
  let { class_id, subject_name, subject_code, subject_id } = req.body;
  if (subject_id) {
    db.query(
      "update subject_list set subject_name=? , subject_code = ? where id =?",
      [subject_name, subject_code, subject_id],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          if (data.affectedRows > 0) {
            req.flash("success", "Update success");
          } else {
            req.flash("fail", "Update failed");
          }
          res.redirect(
            `/user/admin/questions/get-subject-by-class?class_id=${class_id}`
          );
        }
      }
    );
  } else {
    db.query(
      "insert into subject_list values(?,?,?,?)",
      [null, class_id, subject_name, subject_code],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          if (data.affectedRows > 0) {
            req.flash("success", "Create success");
          } else {
            req.flash("fail", "Create failed");
          }
          res.redirect(
            `/user/admin/questions/get-subject-by-class?class_id=${class_id}`
          );
        }
      }
    );
  }
};

exports.getSubject = (req, res, next) => {
  let class_id = req.query.class_id;
  db.query(
    "select * from subject_list where class_id = ?",
    [class_id],
    (e, data) => {
      if (e) {
        next(e);
      } else {
        res.send(data);
      }
    }
  );
};
exports.getChapter = (req, res, next) => {
  let class_id = req.query.class_id;
  let subject_id = req.query.subject_id;
  db.query(
    "select * from chapter where class_id = ? and subject_id =?",
    [class_id, subject_id],
    (e, data) => {
      if (e) {
        next(e);
      } else {
        res.send(data);
      }
    }
  );
};
exports.getTopic = (req, res, next) => {
  let class_id = req.query.class_id;
  let subject_id = req.query.subject_id;
  let chapter_id = req.query.chapter_id;
  console.log(req.query);
  db.query(
    "select * from topic where class_id = ? and subject_id =? and chapter_id=?",
    [class_id, subject_id, chapter_id],
    (e, data) => {
      if (e) {
        next(e);
      } else {
        console.log(data);
        res.send(data);
      }
    }
  );
};

exports.createChaptePost = (req, res, next) => {
  let { class_id, subject_id, chapter_name, chapter_id } = req.body;
  try {
    if (chapter_id) {
      db.query(
        "update chapter set chapter_name=? where id =?",
        [chapter_name, chapter_id],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows > 0) {
              req.flash("success", "Update success");
            } else {
              req.flash("fail", "Update failed");
            }
            res.redirect(
              `/user/admin/questions/get-chapter-by-subject-and-class?subject_id=${subject_id}&class_id=${class_id}`
            );
          }
        }
      );
    } else {
      db.query(
        "insert into chapter values(?,?,?,?)",
        [null, class_id, subject_id, chapter_name],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows > 0) {
              req.flash("success", "create success");
            } else {
              req.flash("fail", "create failed");
            }
            res.redirect(
              `/user/admin/questions/get-chapter-by-subject-and-class?subject_id=${subject_id}&class_id=${class_id}`
            );
          }
        }
      );
    }
  } catch (error) {
    next(error);
  }
};
exports.getChapterBySubjectAndClass = (req, res, next) => {
  try {
    let { class_id, subject_id } = req.query;
    db.query(
      "select chapter.*, classes.class_name,classes.id as class_id,subject_list.subject_name, subject_list.id as subject_id from chapter join classes on classes.id= chapter.class_id join subject_list on chapter.subject_id = subject_list.id WHERE chapter.subject_id = ? and chapter.class_id = ?",
      [subject_id, class_id],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          if (data.length == 0) {
            db.query(
              "select classes.id as class_id,classes.class_name,subject_list.id as subject_id,subject_list.subject_name from classes,subject_list where classes.id=? and subject_list.id = ?",
              [class_id, subject_id],
              (e, data) => {
                if (e) {
                  next(e);
                } else {
                  res.render(
                    "user/admin/question/chapter-by-subject-and-class",
                    {
                      data,
                      chapter_listing: false,
                      title: "Chapter",
                      flashMessage: Flash.getMessage(req),
                    }
                  );
                }
              }
            );
          } else {
            res.render("user/admin/question/chapter-by-subject-and-class", {
              data,
              title: "Chapter",
              chapter_listing: true,
              flashMessage: Flash.getMessage(req),
            });
          }
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.createTopicPost = (req, res, next) => {
  let { class_id, subject_id, chapter_id, topic_name, topic_id } = req.body;
  try {
    if (topic_id) {
      db.query(
        "update topic set topic_name=? where id =?",
        [topic_name, topic_id],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows > 0) {
              req.flash("success", "Update success");
            } else {
              req.flash("fail", "Update failed");
            }
            res.redirect(
              `/user/admin/questions/subject/topics?subject_id=${subject_id}&class_id=${class_id}&chapter_id=${chapter_id}`
            );
          }
        }
      );
    } else {
      db.query(
        "insert into topic values(?,?,?,?,?)",
        [null, class_id, subject_id, chapter_id, topic_name],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows > 0) {
              req.flash("success", "create success");
            } else {
              req.flash("fail", "create failed");
            }
            res.redirect(
              `/user/admin/questions/subject/topics?subject_id=${subject_id}&class_id=${class_id}&chapter_id=${chapter_id}`
            );
          }
        }
      );
    }
  } catch (error) {
    next(error);
  }
};

exports.renderTopics = (req, res, next) => {
  try {
    let { class_id, subject_id, chapter_id } = req.query;
    db.query(
      "select topic.*, classes.class_name,classes.id as class_id,subject_list.subject_name, subject_list.id as subject_id,chapter.id as chapter_id ,chapter.chapter_name from topic join classes on classes.id= topic.class_id join subject_list on topic.subject_id = subject_list.id  join chapter on chapter.id = topic.chapter_id WHERE  topic.class_id = ?  and topic.subject_id = ?   and topic.chapter_id = ?",
      [class_id, subject_id, chapter_id],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          if (data.length == 0) {
            db.query(
              "select classes.id as class_id,classes.class_name,subject_list.id as subject_id,subject_list.subject_name,chapter.chapter_name,chapter.id as chapter_id from classes,subject_list,chapter where classes.id=? and subject_list.id =? and chapter.id=?",
              [class_id, subject_id, chapter_id],
              (e, data) => {
                if (e) {
                  next(e);
                } else {
                  res.render("user/admin/question/topics", {
                    data,
                    topic_listing: false,
                    title: "Topics",
                    flashMessage: Flash.getMessage(req),
                  });
                }
              }
            );
          } else {
            res.render("user/admin/question/topics", {
              data,
              title: "Topics",
              topic_listing: true,
              flashMessage: Flash.getMessage(req),
            });
          }
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.renderSeeQuestion = (req, res, next) => {
  let { class_id, subject_id, chapter_id, q_type } = req.query;
  let currentPage = parseInt(req.query.page) || 1;
  let itemPerPage = 25;
  console.log(currentPage);
  try {
    db.query(
      `SELECT COUNT(*) as count FROM ${q_type} WHERE class_id=? AND subject_id=? AND chapter_id=?;SELECT ${q_type}.*, classes.class_name, subject_list.subject_name, chapter.chapter_name FROM ${q_type} JOIN classes ON ${q_type}.class_id = classes.id JOIN subject_list ON ${q_type}.subject_id = subject_list.id JOIN chapter ON ${q_type}.chapter_id = chapter.id WHERE ${q_type}.class_id=? and ${q_type}.subject_id=? and ${q_type}.chapter_id=? order by id desc limit ?,?`,
      [
        class_id,
        subject_id,
        chapter_id,
        class_id,
        subject_id,
        chapter_id,
        itemPerPage * currentPage - itemPerPage,
        itemPerPage,
      ],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          let totalQus = data[0];
          let totalPage = Math.ceil(totalQus[0].count / itemPerPage);
          res.render("user/admin/question/see-questions", {
            data: data[1],
            title: "See Question",
            flashMessage: Flash.getMessage(req),
            currentPage,
            itemPerPage,
            totalPage,
            q_type,
            totalQus,
          });
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.renderSingleQuestionView = (req, res, next) => {
  let { question_id, q_type } = req.query;
  try {
    db.query(
      `SELECT * FROM ${q_type} WHERE id = ?`,
      [question_id],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          res.render("user/admin/question/viewsingle", {
            data: data[0],
            q_type,
            title: "See Question",
            flashMessage: Flash.getMessage(req),
          });
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

//questions realated

exports.renderCreateQuestion = (req, res, next) => {
  let {
    class_id,
    subject_id,
    chapter_id,
    topic_id,
    class_name,
    subject_name,
    chapter_name,
    topic_name,
    question_id,
    q_type,
    setContent,
  } = req.query;
  let qus;
  try {
    let obj;
    let savedInfo;
    if (class_id && subject_id && chapter_id) {
      obj = {
        class_id,
        subject_id,
        chapter_id,
        topic_id
      };
      savedInfo = {
        class_name: class_name,
        subject_name: subject_name,
        chapter_name: chapter_name,
        topic_name: topic_name
      };
      db.query(
        `select * from ${q_type} where class_id=${class_id} and subject_id=${subject_id} and chapter_id=${chapter_id} and id=${question_id} limit 1`,
        (e, data) => {
          if (e) {
            return next(e);
          } else {
            if (data.length > 0) {
              qus = data;
            }
          }
        }
      );
    } else {
      obj = {
        class_id: "",
        subject_id: "",
        chapter_id: "",
        topic_id: "",
      };
      savedInfo = {
        class_name: "",
        subject_name: "",
        chapter_name: "",
        topic_id: "",
      };
    }
    db.query("select * from classes;select * from filter", (e, data) => {
      if (e) {
        return next(e);
      } else {
        res.render("user/admin/question/create", {
          data: data[0],
          filter: data[1],
          title: "Create Question",
          flashMessage: Flash.getMessage(req),
          obj,
          qus,
          savedInfo,
          setContent,
        });
      }
    });
  } catch (error) {
    next(error);
  }
};
exports.createQuestionPost = (req, res, next) => {
  let {
    class_id,
    subject_id,
    chapter_id,
    topic_id,
    class_name,
    subject_name,
    chapter_name,
    topic_name,
    question_text,
    question_option,
    question_answer,
    filter,
    year,
  } = req.body;
  let { edit, q_id } = req.query;
  let options = [];
  question_option.forEach((e) => {
    options.push(e);
  });
  let savedInfo = {
    class_name: class_name,
    subject_name: subject_name,
    chapter_name: chapter_name,
    topic_name: topic_name,
  };
  if (typeof filter === "object" && filter !== undefined) {
    filter = filter.join(",");
  }

  //filter = filter != undefined ? filter.length <= 2 ? filter : filter.join(',') : ''

  try {
    if (edit) {
      db.query(
        "update questions set question_text=?,question_option=?,question_answer=?,filter=?,year=? where id = ?",
        [
          question_text,
          JSON.stringify(options),
          question_answer,
          filter,
          year,
          q_id,
        ],
        (e, data) => {
          if (e) {
            return next(e);
          } else {
            if (data.affectedRows >= 1) {
              req.flash("success", "Update success!");
            } else {
              req.flash("fail", "Error!");
            }
            return res.redirect(
              `/user/admin/create-question?class_id=${class_id}&subject_id=${subject_id}&chapter_id=${chapter_id}&topic_id=${topic_id}&question_id=${q_id}&class_name=${savedInfo.class_name}&subject_name=${savedInfo.subject_name}&chapter_name=${savedInfo.chapter_name}&topic_name=${savedInfo.topic_name}&setContent=true&q_type=questions`
            );
          }
        }
      );
    } else {
      db.query(
        "insert into questions values(?,?,?,?,?,?,?,?,?,?,?)",
        [
          null,
          class_id,
          subject_id,
          chapter_id,
          question_text,
          JSON.stringify(options),
          question_answer,
          filter,
          year,
          topic_id,
          req.user.id,
        ],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows >= 1) {
              req.flash("success", "Question Create Successful!");
            } else {
              req.flash("fail", "Error!");
            }
            res.redirect(
              `/user/admin/create-question?class_id=${class_id}&subject_id=${subject_id}&chapter_id=${chapter_id}&topic_id=${topic_id}&question_id=${data.insertId}&class_name=${savedInfo.class_name}&subject_name=${savedInfo.subject_name}&chapter_name=${savedInfo.chapter_name}&topic_name=${savedInfo.topic_name}&setContent=false&q_type=questions`
            );
          }
        }
      );
    }
  } catch (error) {
    next(error);
  }
};
exports.renderCreative = (req, res, next) => {
  let {
    class_id,
    subject_id,
    chapter_id,
    topic_id,
    class_name,
    subject_name,
    chapter_name,
    topic_name,
    question_id,
    q_type,
    setContent,
  } = req.query;
  console.log(req.query);
  let qus;
  try {
    let obj;
    let savedInfo;
    if (class_id && subject_id && chapter_id) {
      obj = {
        class_id,
        subject_id,
        chapter_id,
        topic_id
      };
      savedInfo = {
        class_name: class_name,
        subject_name: subject_name,
        chapter_name: chapter_name,
        topic_name: topic_name
      };
      let sql = `select * from ${q_type} where class_id=${class_id} and subject_id=${subject_id} and chapter_id=${chapter_id} and id=${question_id} limit 1`

      if (topic_id) {
        sql = `select * from ${q_type} where class_id=${class_id} and subject_id=${subject_id} and chapter_id=${chapter_id} and topic_id=${topic_id} and id=${question_id} limit 1`
      }
      db.query(sql,
        (e, data) => {
          if (e) {
            return next(e);
          } else {
            if (data.length > 0) {
              qus = data;
            }
          }
        }
      );
    } else {
      obj = {
        class_id: "",
        subject_id: "",
        chapter_id: "",
        topic_id: "",
      };
      savedInfo = {
        class_name: "",
        subject_name: "",
        chapter_name: "",
        topic_name: "",
      };
    }
    db.query("select * from classes;select * from filter", (e, data) => {
      if (e) {
        return next(e);
      } else {
        res.render("user/admin/question/creative", {
          data: data[0],
          filter: data[1],
          title: "Creative",
          flashMessage: Flash.getMessage(req),
          obj,
          qus,
          savedInfo,
          setContent,
        });
      }
    });
  } catch (error) {
    next(error);
  }
};
exports.creativePost = (req, res, next) => {
  let {
    class_id,
    subject_id,
    chapter_id,
    topic_id,
    class_name,
    subject_name,
    chapter_name,
    topic_name,
    question_text,
    question_option,
    question_answer,
    filter,
    year,
  } = req.body;
  console.log(req.body);
  let { edit, q_id } = req.query;
  let options = [];
  question_option.forEach((e) => {
    options.push(e);
  });
  let savedInfo = {
    class_name: class_name,
    subject_name: subject_name,
    chapter_name: chapter_name,
    topic_name: topic_name,
  };
  if (typeof filter === "object" && filter !== undefined) {
    filter = filter.join(",");
  }
  //filter = filter != undefined ? filter.length <= 1 ? filter : filter.join(',') : ''

  try {
    if (edit) {
      db.query(
        "update creative set question_text=?,question_option=?,question_answer=?,filter=?,year=? where id = ?",
        [
          question_text,
          JSON.stringify(options),
          question_answer,
          filter,
          year,
          q_id,
        ],
        (e, data) => {
          if (e) {
            return next(e);
          } else {
            if (data.affectedRows >= 1) {
              req.flash("success", "Update success!");
            } else {
              req.flash("fail", "Error!");
            }
            return res.redirect(
              `/user/admin/questions/creative?class_id=${class_id}&subject_id=${subject_id}&chapter_id=${chapter_id}&topic_id=${topic_id}&question_id=${q_id}&class_name=${savedInfo.class_name}&subject_name=${savedInfo.subject_name}&chapter_name=${savedInfo.chapter_name}&topic_name=${savedInfo.topic_name}&setContent=true&q_type=creative`
            );
          }
        }
      );
    } else {
      db.query(
        "insert into creative values(?,?,?,?,?,?,?,?,?,?,?)",
        [
          null,
          class_id,
          subject_id,
          chapter_id,
          question_text,
          JSON.stringify(options),
          question_answer,
          filter,
          year,
          topic_id,
          req.user.id,
        ],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows >= 1) {
              req.flash("success", "Insert Success!");
            } else {
              req.flash("fail", "Error!");
            }
            res.redirect(
              `/user/admin/questions/creative?class_id=${class_id}&subject_id=${subject_id}&chapter_id=${chapter_id}&topic_id=${topic_id}&question_id=${data.insertId}&class_name=${savedInfo.class_name}&subject_name=${savedInfo.subject_name}&chapter_name=${savedInfo.chapter_name}&topic_name=${savedInfo.topic_name}&setContent=false&q_type=creative`
            );
          }
        }
      );
    }
  } catch (error) {
    next(error);
  }
};
exports.renderCreateOthersQuestion = (req, res, next) => {
  let {
    class_id,
    subject_id,
    chapter_id,
    topic_id,
    class_name,
    subject_name,
    chapter_name,
    topic_name,
    question_id,
    q_type,
    setContent,
  } = req.query;
  let qus;
  try {
    let obj;
    let savedInfo;
    if (class_id && subject_id && chapter_id) {
      obj = {
        class_id,
        subject_id,
        chapter_id,
        topic_id,
      };
      savedInfo = {
        class_name: class_name,
        subject_name: subject_name,
        chapter_name: chapter_name,
        topic_name: topic_name,
      };
      db.query(
        `select * from ${q_type} where class_id=${class_id} and subject_id=${subject_id} and chapter_id=${chapter_id} and id=${question_id} limit 1`,
        (e, data) => {
          if (e) {
            return next(e);
          } else {
            if (data.length > 0) {
              qus = data;
              console.log(qus);
            }
          }
        }
      );
    } else {
      obj = {
        class_id: "",
        subject_id: "",
        chapter_id: "",
        topic_id: "",
      };
      savedInfo = {
        class_name: "",
        subject_name: "",
        chapter_name: "",
        topic_name: "",
      };
    }
    db.query("select * from classes;select * from filter", (e, data) => {
      if (e) {
        return next(e);
      } else {
        res.render("user/admin/question/others-questions", {
          data: data[0],
          filter: data[1],
          title: "Others",
          flashMessage: Flash.getMessage(req),
          obj,
          qus,
          savedInfo,
          setContent,
        });
      }
    });
  } catch (error) {
    next(error);
  }
};
exports.othersQuestionsPost = (req, res, next) => {
  let {
    class_id,
    subject_id,
    chapter_id,
    topic_id,
    class_name,
    subject_name,
    chapter_name,
    topic_name,
    question_text,
    question_answer,
    filter,
    year,
  } = req.body;
  let { edit, q_id } = req.query;
  let savedInfo = {
    class_name: class_name,
    subject_name: subject_name,
    chapter_name: chapter_name,
    topic_name: topic_name,
  };
  //filter = filter != undefined ? filter.length <= 1 ? filter : filter.join(',') : ''
  if (typeof filter === "object" && filter !== undefined) {
    filter = filter.join(",");
  }

  try {
    if (edit) {
      db.query(
        "update q_others set question_text=?,question_answer=?,filter=?,year=? where id = ?",
        [question_text, question_answer, filter, year, q_id],
        (e, data) => {
          if (e) {
            return next(e);
          } else {
            if (data.affectedRows >= 1) {
              req.flash("success", "Update success!");
            } else {
              req.flash("fail", "Error!");
            }
            return res.redirect(
              `/user/admin/questions/others?class_id=${class_id}&subject_id=${subject_id}&chapter_id=${chapter_id}&topic_id=${topic_id}&question_id=${q_id}&class_name=${savedInfo.class_name}&subject_name=${savedInfo.subject_name}&chapter_name=${savedInfo.chapter_name}&topic_name=${savedInfo.topic_name}&setContent=true&q_type=q_others`
            );
          }
        }
      );
    } else {
      db.query(
        "insert into q_others values(?,?,?,?,?,?,?,?,?,?)",
        [
          null,
          class_id,
          subject_id,
          chapter_id,
          question_text,
          question_answer,
          filter,
          year,
          topic_id,
          req.user.id,
        ],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows >= 1) {
              req.flash("success", "Insert Success!");
            } else {
              req.flash("fail", "Error!");
            }
            return res.redirect(
              `/user/admin/questions/others?class_id=${class_id}&subject_id=${subject_id}&chapter_id=${chapter_id}&topic_id=${topic_id}&question_id=${data.insertId}&class_name=${savedInfo.class_name}&subject_name=${savedInfo.subject_name}&chapter_name=${savedInfo.chapter_name}&topic_name=${savedInfo.topic_name}&setContent=false&q_type=q_others`
            );
          }
        }
      );
    }
  } catch (error) {
    next(error);
  }
};

exports.makeQuestionRender = (req, res, next) => {
  var katex = require("katex");
  let { class_id, subject_id, chapter_id } = req.query;
  try {
    db.query(
      "SELECT questions.*, classes.class_name, subject_list.subject_name, chapter.chapter_name FROM questions JOIN classes ON questions.class_id = classes.id JOIN subject_list ON questions.subject_id = subject_list.id JOIN chapter ON questions.chapter_id = chapter.id WHERE questions.class_id=1 and questions.subject_id=1 and questions.chapter_id=2 and questions.id=11",
      [class_id, subject_id, chapter_id],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          const equation =
            '<p><span class="math-tex">(x = {-b pm sqrt{b^2-4ac} over 2a})</span></p>';
          const tex = katex.renderToString(equation);

          const html = `
        <html>
          <body>
            ${tex}
          </body>
        </html>
      `;
          pdf.create(html).toFile("./expression.pdf", function (err, res) {
            console.log(res);
          });

          res.render("user/admin/question/make-questions", {
            data,
            title: "See Question",
            flashMessage: Flash.getMessage(req),
          });
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.renderCreateFilter = (req, res, next) => {
  let { question_id, q_type } = req.query;
  try {
    db.query("select * from filter", (e, data) => {
      if (e) return next(e);
      res.render("user/admin/question/filter", {
        data,
        title: "Filter",
        flashMessage: Flash.getMessage(req),
      });
    });
  } catch (error) {
    next(error);
  }
};

exports.filterPost = (req, res, next) => {
  let { filter_type, filter_name, id } = req.body;
  try {
    if (id) {
      db.query(
        `update filter set type=? ,name=? where id = ?`,
        [filter_type, filter_name, id],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows >= 1) {
              req.flash("success", "Update successfully");
            } else {
              req.flash("fail", "failed to update");
            }
            return res.redirect("/user/admin/questions/filter");
          }
        }
      );
    } else {
      db.query(
        `insert into filter values(?,?,?)`,
        [null, filter_type, filter_name],
        (e, data) => {
          if (e) {
            next(e);
          } else {
            if (data.affectedRows >= 1) {
              req.flash("success", "create successfully");
            } else {
              req.flash("fail", "failed to create");
            }
            return res.redirect("/user/admin/questions/filter");
          }
        }
      );
    }
  } catch (error) {
    next(error);
  }
};
