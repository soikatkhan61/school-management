const db = require("../../config/db.config");
const Flash = require("../../utils/Flash");

exports.renderCreateExam = (req, res, next) => {
    let { class_id, subject, q_set } = req.query
    console.log(req.query);
    let sqlForClassAndSubject
    if ((class_id && subject) && subject != 0) {
        sqlForClassAndSubject = `select classes.id as class_id,classes.class_name,subject_list.id,subject_list.subject_name from classes JOIN subject_list on classes.id = subject_list.class_id WHERE classes.id=${class_id} and subject_list.id=${subject}`
    } else {
        sqlForClassAndSubject = `select id,class_name from classes order by id asc`
    }
    try {
        db.query(`select school_name from schools where id=?;${sqlForClassAndSubject}`, [req.user.school_id], (e, data) => {
            if (e) {
                next(e)
            } else {
                let data1 = data[0]
                function extractFirstLetters(str) {
                    var words = str.split(" ");
                    var result = "";
                    for (var i = 0; i < words.length; i++) {
                        result += words[i].charAt(0);
                    }
                    return result;
                }
                const dateObj = new Date(Date.now());

                const month = dateObj.getMonth() + 1;
                const date = dateObj.getDate();
                let exam_code = extractFirstLetters(data1[0].school_name) + "_" + date + month
                res.render("exam/createExam", {
                    title: "Create Exam",
                    flashMessage: Flash.getMessage(req),
                    exam_code: exam_code + "_" + (Math.floor(Math.random() * 9000) + 1000),
                    classes: data[1],
                    class_id,
                    subject,
                    q_set
                });
            }
        })
    } catch (error) {
        next(error)
    }
};
exports.createExamPost = (req, res, next) => {
    let { exam_name, exam_code, class_id, subject, start_time, end_time, teacher, school_id, q_set } = req.body
    try {
        db.query("INSERT INTO exams VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", [null, exam_name, exam_code, q_set, class_id, subject, start_time, end_time, 0, school_id, teacher, null, null], (e, data) => {
            if (e) {
                next(e)
            } else {
                if (data.affectedRows > 0) {
                    req.flash('success', "success")
                } else {
                    req.flash('fail', "Failed to create")
                }
                res.redirect(`/exam/view?q_set_id=${q_set}`)
            }
        })
    } catch (error) {
        next(error)
    }
};
exports.renderExamResults = (req, res, next) => {
    let { exam_id } = req.query
    console.log(exam_id);
    try {
        db.query(`
        SELECT e.id,e.name, e.code, e.start_time, e.end_time, e.status, 
  COUNT(*) as total_participants, 
  MAX(p.score) as highest_score, 
  MIN(p.score) as lowest_score, 
  AVG(p.score) as average_score,
  (SELECT COUNT(*) 
   FROM exams_participants 
   WHERE score > (0.8 * m.max_score) AND exam_id = m.exam_id) as participants_above_80_percent
FROM exams_participants p 
INNER JOIN (
  SELECT MAX(score) as max_score, exam_id
  FROM exams_participants
  WHERE exam_id = ?
  GROUP BY exam_id
) m ON p.exam_id = m.exam_id 
INNER JOIN exams e 
ON p.exam_id = e.id 
WHERE e.id = ?
GROUP BY e.id;

        `, [exam_id, exam_id], (e, data) => {
            if (e) return next(e)
            console.log(data);
            if (data.length == 0) data = ''

            return res.render("exam/results", {
                title: "Results of Exam",
                flashMessage: Flash.getMessage(req),
                data,
                exam_id
            });
        })

    } catch (error) {
        next(error)
    }
};

exports.renderAllExamList = (req, res, next) => {
    let currentPage = parseInt(req.query.page) || 1
    let itemPerPage = 25
    try {
        db.query("select count(*) as count from exams where q_set_id=? and school_id=?;select * from exams where q_set_id=? and school_id=? order by id desc", [Number(req.query.q_set_id), req.user.school_id, Number(req.query.q_set_id), req.user.school_id], (e, data) => {
            if (e) return next(e)
            let totalMessage = data[0]
            let totalPage = Math.ceil(totalMessage[0].count / itemPerPage)
            res.render("exam/viewAllExam", {
                title: "List of exam",
                flashMessage: Flash.getMessage(req),
                exams: data[1],
                currentPage, itemPerPage, totalPage
            });
        })
    } catch (error) {
        next(error)
    }
};

exports.examStatusChange = (req, res, next) => {
    let status = req.query.status
    let exam_id = req.query.exam_id
    console.log(req.query);
    try {
        db.query("update exams set status = ? where id = ?", [status, exam_id], (e, data) => {
            if (e) return next(e)
            console.log(data);
            if (data.affectedRows === 0) {
                req.flash('failed', 'Update failed')
            } else {
                req.flash('success', 'Update success')
            }
            return res.redirect(`/exam/results?exam_id=${exam_id}}`)
        })
    } catch (error) {
        next(error)
    }
};

exports.renderMyExam = (req, res, next) => {
    let currentPage = parseInt(req.query.page) || 1
    let itemPerPage = 25
    try {
        db.query("select count(*) as count from exams where class = ? and school_id=?;select * from exams where class=? and school_id=? order by id desc", [req.user.class_id, req.user.school_id, req.user.class_id, req.user.school_id], (e, data) => {
            if (e) return next(e)
            if (data.length == 0) {
                return res.render("exam/my-exam", {
                    title: "Results of Exam",
                    flashMessage: Flash.getMessage(req),
                    exams: "",
                    currentPage: '', itemPerPage: '', totalPage: '',
                });
            }
            let totalMessage = data[0]
            let totalPage = Math.ceil(totalMessage[0].count / itemPerPage)
            let exam = data[1]

            res.render("exam/my-exam", {
                title: "My exams",
                flashMessage: Flash.getMessage(req),
                exams: data[1],
                currentPage, itemPerPage, totalPage
            });
        })
    } catch (error) {
        next(error)
    }
};

exports.renderJoinExam = (req, res, next) => {
    try {
        db.query("select exams.id,exams.name,exams.code,exams.start_time,exams.end_time,exams.status,exams.q_set_id,exams.school_id,exams.class,q_set.questions FROM exams join q_set on exams.q_set_id = q_set.id where exams.school_id=? and exams.class=? and exams.id=?", [req.user.school_id, req.user.class_id, req.query.exam_id], (e, data) => {
            if (e) return next(e)
            if (data.length == 0) {
                res.render("exam/join-exam", {
                    title: "Join the exam",
                    flashMessage: Flash.getMessage(req),
                    data: "", examEligible: ''
                });
            } else {
                const start_time = new Date(data[0].start_time);
                const end_time = new Date(data[0].end_time);
                const isExamOngoing = start_time.getTime() <= Date.now() && end_time.getTime() >= Date.now();
                let examEligible = isExamOngoing || data[0].status == 1 ? true : false
                return res.render("exam/join-exam", {
                    title: "Join the exam",
                    flashMessage: Flash.getMessage(req),
                    data: data, examEligible, start_time, end_time
                });
            }

        })
    } catch (error) {
        next(error)
    }
};
exports.joinExamPost = (req, res, next) => {
    try {
        db.query("select questions from q_set where class_id=? and school_id=? and id=?", [req.user.class_id, req.user.school_id, req.body.q_set_id], (e, data) => {
            if (e) return next(e)
            if (data.length == 0) return res.send("No data found")
            console.log(data[0].questions)
            db.query(`SELECT q.id,q.question_text,q.question_option FROM questions q WHERE q.id IN (${data[0].questions}) ORDER BY FIELD(q.id, ${data[0].questions});`, (e, qus) => {
                if (e) return next(e)
                if (qus.length == 0) return res.send("no data")
                console.log(qus);
                return res.render("exam/renderExamSet", {
                    title: "Exam is ongoing",
                    flashMessage: Flash.getMessage(req),
                    qus,
                    end_time: req.body.end_time,
                    start_time: req.body.start_time,
                    examname: req.body.examname,
                    exam_id: req.body.exam_id,
                    name: req.body.name,
                    student_id: req.body.student_id,
                });
            })
        })
    } catch (error) {
        next(error)
    }
};

exports.submitResponse = (req, res, next) => {
    try {
        let answrs = ''
        let student_answrs = Object.values(req.body)
        for (let i = 0; i < student_answrs.length; i++) {
            if (i == 0) {
                continue
            } else {
                answrs = answrs + (student_answrs[i] + (i == student_answrs.length - 1 ? '' : ','))
            }
        }
        let answer_str = JSON.stringify(answrs)
        db.query("select stu_id from exams_participants where exam_id = ? and stu_id=? and school_id", [req.body.code, req.user.student_id, req.user.school_id], (e, data) => {
            if (e) return next(e)
            if (data.length > 0) return res.send("Already Recorded!")
            db.query("INSERT INTO exams_participants values(?,?,?,?,?,?,?,?,?)", [null, answer_str, null, , req.body.code, Number(req.user.student_id), req.user.school_id, null, null], (e, data) => {
                if (e) return next(e)
                if (data.affectedRows > 0) {
                    return res.redirect(`/exam/submit?status=true&token=${data.insertId}`)
                } else {
                    return res.redirect(`/exam/submit?status=false`)
                }
            })
        })
    } catch (error) {
        next(error)
    }
};

exports.renderSubmitStatus = (req, res, next) => {
    try {
        let { status, token } = req.query
        return res.render("exam/submit-status", {
            title: "Submit Status",
            flashMessage: Flash.getMessage(req),
            status, token
        });
    } catch (error) {
        next(error)
    }
};

exports.renderStudentResult = (req, res, next) => {
    try {
        let { token } = req.query
        if (token == undefined || token == null) return res.send("Unauthorized access!")
        db.query("select exam_id,score,answers from exams_participants where id=? and school_id=? and stu_id = ?", [token, req.user.school_id, req.user.student_id], (e, data) => {
            if (e) return next(e)
            if (data[0].score) {
                return res.render("exam/score", {
                    title: "Submit Status",
                    flashMessage: Flash.getMessage(req),
                    score: data[0].score
                });
            } else {
                db.query("select q_set.answers,exams.q_set_id FROM exams JOIN q_set on q_set.id = exams.q_set_id WHERE exams.id = ? limit 1", [data[0].exam_id], (e, ans) => {
                    if (e) return next(e)
                    if (ans.length == 0 || ans[0].answers == null) return res.send("not found")
                    let qus_ans_arr = JSON.parse(data[0].answers).split(',')
                    let marks = 0
                    console.log("submit " + qus_ans_arr);
                    console.log("real " + ans[0].answers.split(','));

                    let correct = ans[0].answers.split(',').map((m, index) => {
                        if (m == qus_ans_arr[index]) {
                            return marks++
                        }
                        return marks
                    })
                    db.query("update exams_participants set score=? where id=? and school_id=? and stu_id = ?", [marks, token, req.user.school_id, req.user.student_id], (e, update) => {
                        if (e) return next(e)
                        if (update.affectedRows == 0) return res.send("error")
                        return res.render("exam/score", {
                            title: "Submit Status",
                            flashMessage: Flash.getMessage(req),
                            score: marks
                        });
                    })

                })

            }
        })

    } catch (error) {
        next(error)
    }
};

exports.renderStudentAllResult = (req, res, next) => {
    try {
        db.query("select exams_participants.*,exams.name,exams.id as exam_id from exams_participants join exams on exams_participants.exam_id = exams.id where exams_participants.stu_id = ? and exams_participants.school_id=? order by exams_participants.id desc", [req.user.student_id, req.user.school_id], (e, exams) => {
            if (e) return next(e)
            return res.render("exam/all-results", {
                title: "Submit Status",
                flashMessage: Flash.getMessage(req),
                exams
            });
        })
    } catch (error) {
        next(error)
    }
};

exports.renderExamParticipats = (req, res, next) => {
    try {
        db.query("select exams_participants.submit_on,exams_participants.score,students.name,students.avater from exams_participants join students on exams_participants.stu_id = students.student_id where exams_participants.school_id=? and exam_id=? order by exams_participants.score and exams_participants.submit_on", [req.user.school_id, req.query.exam_id], (e, data) => {
            if (e) return next(e)
            console.log(data);
            return res.render("exam/participants", {
                title: "Participants",
                flashMessage: Flash.getMessage(req),
                data
            });
        })
    } catch (error) {
        next(error)
    }
};

exports.compareMyAnswerList = (req, res, next) => {
    try {
        db.query("select exams_participants.answers as my_ans,exams_participants.exam_id,exams.q_set_id,exams.name,q_set.questions,q_set.answers as real_ans from exams_participants join exams on exams_participants.exam_id = exams.id join q_set on exams.q_set_id = q_set.id where exams_participants.stu_id=? and exams_participants.id = ?", [req.user.student_id, req.query.exam_id], (e, findExmData) => {
            if (e) return next(e)
            if (findExmData.length) {
                db.query(`select * from questions where id in(${findExmData[0].questions})`, (e, data) => {
                    if (e) return next(e)
                    console.log(JSON.parse(findExmData[0].my_ans));
                    console.log(findExmData[0].real_ans);
                    return res.render("exam/compare-answer", {
                        title: "Answer",
                        flashMessage: Flash.getMessage(req),
                        data,
                        findExmData
                    });
                })
            } else {
                res.send("no data")
            }

        })
    } catch (error) {
        next(error)
    }
};
