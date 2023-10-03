const db = require("../../config/db.config");
const Flash = require("../../utils/Flash");

exports.renderCombined = (req, res, next) => {
    let school_id
    if (req.user.userType === "admin") {
        school_id = req.user.id
    } else if (req.user.userType === "teacher") {
        school_id = req.user.school_id
    }
    let q_formate
    if (q_formate == 'mcq') {
        q_formate = 'questions'
    } else {
        q_formate = 'creative'
    }
    try {
        db.query("select id,class_name from classes order by id;select school_name from schools where id=?", [school_id], (e, data) => {
            if (e) {
                next(e)
            } else {
                console.log(data[0]);
                res.render("combined", {
                    title: "Combined",
                    flashMessage: Flash.getMessage(req),
                    classes: data[0],
                    school: data[1]
                });
            }
        })
    } catch (error) {
        next(error)
    }

};
exports.viewSubject = (req, res, next) => {
    let school_id
    if (req.user.userType === "admin") {
        school_id = req.user.id
    } else if (req.user.userType === "teacher") {
        school_id = req.user.school_id
    }
    let { name, class_id, subject, q_formate, total_mark, total_qus } = req.body
    try {
        db.query("INSERT into q_set values(?,?,?,?,?,?,?,?,?,?,?,?)", [null, name, class_id, subject, q_formate, total_mark, total_qus, null, null, school_id, null, null], (e, data) => {
            if (e) {
                next(e)
            } else {
                return res.redirect(`/combined-question/view-subject?class_id=${class_id}&subject=${subject}&q_set=${data.insertId}&q_type=${q_formate}`)
            }
        })
    } catch (error) {
        next(error)
    }

};
exports.viewSubjectGet = (req, res, next) => {
    let { class_id, subject, q_set, q_type } = req.query
    try {
        db.query("select * from subject_list where class_id=? and id=?", [class_id, subject], (e, data) => {
            if (e) {
                next(e)
            } else {
                let filter = {
                    class_id,
                    q_set,
                    q_type
                }
                res.render(`combined/view-subject`, {
                    title: "view subject", flashMessage: Flash.getMessage(req),
                    subject: data, filter
                })
            }
        })
    } catch (error) {
        next(error)
    }

};
exports.viewChapterGet = (req, res, next) => {
    let { class_id, subject, q_set, q_type } = req.query
    try {
        db.query("select * from chapter where class_id=? and subject_id=?", [class_id, subject], (e, data) => {
            if (e) {
                next(e)
            } else {
                let filter = {
                    class_id,
                    subject,
                    q_set,
                    q_type
                }
                res.render(`combined/view-chapter`, {
                    title: "view subject", flashMessage: Flash.getMessage(req),
                    chapter: data, filter
                })
            }
        })
    } catch (error) {
        next(error)
    }

};

exports.viewTopicGet = (req, res, next) => {
    let { class_id, subject_id, chapter_id, q_set, q_type } = req.query
    console.log(req.query);
    try {
        db.query("select * from topic where class_id=? and subject_id=? and chapter_id=?", [class_id, subject_id, chapter_id], (e, data) => {
            if (e) {
                next(e)
            } else {
                let filter = {
                    class_id,
                    subject_id,
                    chapter_id,
                    q_set,
                    q_type
                }
                console.log(data);
                return res.render(`combined/view-topic`, {
                    title: "view topics", flashMessage: Flash.getMessage(req),
                    topic: data, filter
                })
            }
        })
    } catch (error) {
        next(error)
    }

};
exports.viewQuestionGet = (req, res, next) => {
    let { class_id, subject_id, chapter, topic_id, q_set, q_type, year, category } = req.query
    let currentPage = parseInt(req.query.page) || 1
    let itemPerPage = 25
    if (q_type == 'mcq' || q_type == 'questions') {
        q_type = 'questions'
    } else if (q_type == 'creative') {
        q_type = 'creative'
    } else {
        q_type = 'q_others'
    }

    category = req.query.category


    //contract the query
    let sql = `SELECT * FROM ${q_type} where class_id=${class_id} and subject_id = ${subject_id} and chapter_id=${chapter}`;
    let counterSql = ''
    if (category) {
        sql += ` AND filter in(${category}) `;
        counterSql += ` and filter in(${category}) `;
    }
    if (topic_id > 0) {
        sql += ` and topic_id = ${topic_id}`;
        counterSql += ` and topic_id = ${topic_id}`;
    }
    if (year) {
        sql += ` and year = ${year}`;
        counterSql += ` and year = ${year}`;
    }

    sql += ` limit ${((itemPerPage * currentPage) - itemPerPage)} , ${itemPerPage};SELECT COUNT(*) as count FROM ${q_type} WHERE class_id=${class_id} AND subject_id=${subject_id} AND chapter_id=${chapter} ${counterSql};select questions,total_qus from q_set where id=${q_set};`

    try {
        db.query(sql, (e, data) => {
            if (e) {
                next(e)
            } else {
                let filter = {
                    class_id,
                    subject_id,
                    topic_id,
                    chapter,
                    q_set,
                    q_type
                }

                let totalDoc = data[1]
                let totalPage = Math.ceil(totalDoc[0].count / itemPerPage)
                let q_set_ids = data[2]
                let total_selected = q_set_ids[0].questions != null ? q_set_ids[0].questions.split(',').length : 0
                res.render(`combined/view-questions`, {
                    title: "view subject", flashMessage: Flash.getMessage(req),
                    questions: data[0],
                    filter,
                    q_set_ids,
                    total_selected,
                    currentPage,
                    itemPerPage,
                    totalPage,
                    q_type,
                    year,
                    category
                })
            }
        })
    } catch (error) {
        next(error)
    }
};
exports.addQuestion = (req, res, next) => {
    let { q_id, q_set, a_id } = req.query;
    try {
        db.query(
            "UPDATE q_set SET questions = IF(FIND_IN_SET(?, questions), questions, CONCAT_WS(',', questions, ?)), answers = IF(FIND_IN_SET(?, questions),  IF(answers IS NULL, ?, CONCAT_WS(',', answers, ?)), answers) WHERE id = ?;",
            [q_id, q_id, q_id, a_id, a_id, q_set],
            (e, data) => {
                if (e) {
                    next(e);
                } else {
                    if (data.changedRows == 1) {
                        res.send({ status: 200 })
                    } else if (data.changedRows == 0) {
                        res.send({ status: 400 })
                    }
                }
            }
        );
    } catch (error) {
        next(error);
    }

};
exports.renderSavedByClass = (req, res, next) => {
    let school_id
    if (req.user.userType === "admin") {
        school_id = req.user.id
    } else if (req.user.userType === "teacher") {
        school_id = req.user.school_id
    }
    let currentPage = parseInt(req.query.page) || 1
    let itemPerPage = 25
    let class_id = req.params.class_id
    try {
        db.query(
            "SELECT COUNT(*) as count FROM q_set where school_id=? ;select * from q_set where q_set.school_id=? and q_set.class_id=? order by id desc limit ?,?", [school_id, school_id, class_id, ((itemPerPage * currentPage) - itemPerPage), itemPerPage],
            (e, data) => {
                if (e) {
                    next(e);
                } else {
                    let totalMessage = data[0]
                    let totalPage = Math.ceil(totalMessage[0].count / itemPerPage)
                    res.render(`combined/saved`, {
                        title: "Saved Question",
                        flashMessage: Flash.getMessage(req),
                        q_set: data[1],
                        currentPage, itemPerPage, totalPage
                    });
                }
            }
        );
    } catch (error) {
        next(error);
    }

}
exports.renderSavedQuesSet = (req, res, next) => {
    try {
        db.query(
            "select * from classes",
            (e, data) => {
                if (e) {
                    next(e);
                } else {
                    res.render(`combined/savedCombined`, {
                        title: "Saved Question",
                        flashMessage: Flash.getMessage(req),
                        data
                    });
                }
            }
        );
    } catch (error) {
        next(error);
    }

};
exports.getFilterData = (req, res, next) => {
    try {
        db.query(
            "select * from filter",
            (e, data) => {
                if (e) {
                    next(e);
                } else {
                    res.send(data)
                }
            }
        );
    } catch (error) {
        next(error);
    }
};
exports.renderviewSet = (req, res, next) => {
    let qset_id = req.query.q_set_id
    if (!parseInt(qset_id)) return res.send("Invalid Token")
    try {
        db.query('select q_set.*,schools.school_name from q_set join schools on q_set.school_id = schools.id WHERE q_set.id = ? limit 1', [qset_id], (e, data) => {
            if (e) {
                return next(e)
            } else {
                if (data && data[0].questions != null) {
                    const questionIds = data[0].questions.split(',');
                    let table = data[0].formate
                    if (table == 'mcq') {
                        table = 'questions'
                    } else if (table == 'creative') {
                        table = 'creative'
                    } else {
                        table = 'q_others'
                    }
                    const query = `SELECT * FROM ${table} WHERE id IN (?) ORDER BY FIELD(${table}.id, ${questionIds});`;
                    db.query(query, [questionIds], (error, results) => {
                        if (error) {
                            return next(error);
                        } else {
                            console.log(results);
                            let obj = {
                                total_qus: data[0].total_qus,
                                total_mark: data[0].total_mark,
                                school_name: data[0].school_name,
                                name: data[0].name,
                                q_formate: data[0].formate
                            }
                            return res.render(`combined/view_qset`, {
                                title: "Preview Question",
                                flashMessage: Flash.getMessage(req),
                                data: results,
                                obj
                            });
                        }
                    });
                } else {
                    return res.send("No data")
                }
            }
        })
    } catch (error) {
        next(error);
    }

};
exports.renderAnswer = (req, res, next) => {
    let { q_set_id, q_type, q_ids, name, total_mark, total_qus } = req.query
    try {
        if (q_set_id && q_type == 'mcq') {
            db.query("select * from q_set where id = ?", [q_set_id], async (e, q_set_data) => {
                if (e) return next(e)
                if (q_set_data) {
                    let answers = q_set_data[0].answers.split(',');
                    let data = await extract_questions_data(q_set_data[0].questions.split(','), 'questions')
                    sendResponse(data, q_set_data[0], answers)
                }
            })
        } else if (q_set_id && q_type == 'creative') {
            db.query("select * from q_set where id = ?", [q_set_id], async (e, q_set_data) => {
                if (e) return next(e)
                if (q_set_data) {
                    let answers = ''
                    let data = await extract_questions_data(q_set_data[0].questions.split(','), 'creative')
                    sendResponse(data, q_set_data[0], answers)
                }
            })
        } else if (q_type == 'q_others') {
            db.query("select * from q_set where id = ?", [q_set_id], async (e, q_set_data) => {
                if (e) return next(e)
                if (q_set_data) {
                    let answers = ''
                    let data = await extract_questions_data(q_set_data[0].questions.split(','), 'q_others')
                    sendResponse(data, q_set_data[0], answers)
                }
            })
        } else if (q_ids && q_type && name) {
            async function start_extract_question() {
                let answers = ''
                let data = await extract_questions_data(q_ids, q_type)
                let obj = {
                    name,
                    total_mark,
                    total_qus
                }
                sendResponse(data, obj, answers)
            }
            start_extract_question()
        }

        function sendResponse(data, obj, answers) {
            return res.render(`combined/view-answer`, {
                title: "Show Answer",
                flashMessage: Flash.getMessage(req),
                data, q_type, obj, answers
            });
        }
        async function extract_questions_data(questionIds, table) {
            let options, query
            if (table == 'q_others') {
                query = `SELECT question_text,question_answer FROM ${table} WHERE id IN (?) ORDER BY FIELD(${table}.id, ${questionIds});`;
            } else {
                query = `SELECT question_text,question_option,question_answer FROM ${table} WHERE id IN (${questionIds}) ORDER BY FIELD(${table}.id, ${questionIds});`;
            }
            const data = await generateResults(query);
            if (data.length) {
                return data
            } else {
                return null
            }

            //prepare the questions data for the response
            function generateResults(query) {
                return new Promise((resolve, reject) => {
                    db.query(query, [questionIds], (error, data) => {
                        if (error) {
                            return next(error);
                        } else {
                            resolve(data);
                        }
                    });
                });
            }
        }

    } catch (error) {
        next(error)
    }
};