const db = require("../../config/db.config");
const Flash = require("../../utils/Flash");

exports.renderCreateExam = (req, res, next) => {
    let {class_id,subject,q_set} = req.query
    console.log(req.query);
    let sqlForClassAndSubject
    if((class_id && subject) && subject != 0){
        sqlForClassAndSubject = `select classes.id as class_id,classes.class_name,subject_list.id,subject_list.subject_name from classes JOIN subject_list on classes.id = subject_list.class_id WHERE classes.id=${class_id} and subject_list.id=${subject}`
    }else{
        sqlForClassAndSubject = `select id,class_name from classes order by id asc`
    }
    try {
        db.query(`select school_name from schools where id=?;${sqlForClassAndSubject}`, [req.user.school_id],(e, data) => {
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
                    const dateObj = new Date( Date.now());

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
    let {exam_name,exam_code,class_id,subject,start_time,end_time,teacher,school_id,q_set} = req.body
    try {
        db.query("INSERT INTO exams VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)",[null,exam_name,exam_code,q_set,class_id, subject,start_time,end_time,0,school_id,teacher,null,null], (e, data) => {
            if (e) {
                next(e)
            } else {
                if(data.affectedRows >0){
                    req.flash('success',"success")
                }else{
                    req.flash('fail',"Failed to create")
                }
                res.redirect('/combined-question/saved')
            }
        })
    } catch (error) {
        next(error)
    }
};
exports.renderExamResults = (req, res, next) => {
    try {
        res.render("exam/results", {
            title: "Results of Exam",
            flashMessage: Flash.getMessage(req),
        });
    } catch (error) {
        next(error)
    }
};

exports.renderAllExamList = (req, res, next) => {
    let currentPage = parseInt(req.query.page) || 1
    let itemPerPage = 25
    try {
        db.query("select count(*) as count from exams where q_set_id=? and school_id=?;select * from exams where q_set_id=? and school_id=? order by id desc",[Number(req.query.q_set_id),req.user.school_id,Number(req.query.q_set_id),req.user.school_id],(e,data)=>{
            if(e) return next(e)
            let totalMessage = data[0]
            let totalPage = Math.ceil(totalMessage[0].count / itemPerPage)
            res.render("exam/viewAllExam", {
                title: "List of exam",
                flashMessage: Flash.getMessage(req),
                exams:data[1],
                currentPage, itemPerPage, totalPage
            });
        })
    } catch (error) {
        next(error)
    }
};

exports.renderMyExam = (req, res, next) => {
    let currentPage = parseInt(req.query.page) || 1
    let itemPerPage = 25
    try {
        db.query("select count(*) as count from exams where class = ? and school_id=?;select * from exams where class=? and school_id=? order by id desc",[req.user.class_id,req.user.school_id,req.user.class_id,req.user.school_id],(e,data)=>{
            if(e) return next(e)
            if(data.length == 0 ){
                return res.render("exam/my-exam", {
                    title: "Results of Exam JKHGS",
                    flashMessage: Flash.getMessage(req),
                    exams:"",
                    currentPage:'', itemPerPage:'', totalPage:'',
                });
            }
            let totalMessage = data[0]
            let totalPage = Math.ceil(totalMessage[0].count / itemPerPage)
            let exam = data[1]

            res.render("exam/my-exam", {
                title: "My exams",
                flashMessage: Flash.getMessage(req),
                exams:data[1],
                currentPage, itemPerPage, totalPage
            });
        })
    } catch (error) {
        next(error)
    }
};

exports.renderJoinExam = (req, res, next) => {
    try {
        db.query("select exams.id,exams.name,exams.code,exams.start_time,exams.end_time,exams.status,exams.q_set_id,exams.school_id,exams.class,q_set.questions FROM exams join q_set on exams.q_set_id = q_set.id where exams.school_id=? and exams.class=? and exams.id=?",[req.user.school_id,req.user.class_id,req.query.exam_id],(e,data)=>{
            if(e) return next(e)
            if(data.length == 0 ){
                res.render("exam/join-exam", {
                    title: "Join the exam",
                    flashMessage: Flash.getMessage(req),
                    data:"",examEligible:''
                });
            }else{
                const start_time = new Date(data[0].start_time);
                const end_time = new Date(data[0].end_time);
                const isExamOngoing = start_time.getTime() <= Date.now() && end_time.getTime() >= Date.now();
                let examEligible =  isExamOngoing || data[0].status == 1 ? true : false
                return res.render("exam/join-exam", {
                    title: "Join the exam",
                    flashMessage: Flash.getMessage(req),
                    data:data,examEligible,start_time,end_time
                });
            }
           
        })
    } catch (error) {
        next(error)
    }
};
exports.joinExamPost = (req, res, next) => {
    try {
        db.query("select questions from q_set where class_id=? and school_id=? and id=?",[req.user.class_id,req.user.school_id,req.body.q_set_id],(e,data)=>{
            if(e) return next(e)
            if(data.length == 0) return res.send("Invalid parameter or no data found")
            console.log(data[0].questions)
            db.query(`select question_text,question_option from questions where id IN (${data[0].questions})`,(e,qus)=>{
                if(e) return next(e)
                if(qus.length == 0) return res.send("no data")
                console.log(qus);
                return res.render("exam/renderExamSet", {
                    title: "Exam is ongoing",
                    flashMessage: Flash.getMessage(req),
                    qus,
                    end_time:req.body.end_time,
                    start_time:req.body.start_time,
                    examname:req.body.examname,
                    exam_id:req.body.exam_id,
                    name:req.body.name,
                    student_id:req.body.student_id,
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
        for(let i=0;i< student_answrs.length;i++){
            if(i == 0){
                continue
            }else{
                answrs = answrs + (student_answrs[i] + (i == student_answrs.length-1 ? '' : ',') )
            }
        }
        let answer_str = JSON.stringify(answrs)
        console.log(req.user.school_id);
        db.query("select stu_id from exams_participants where exam_id = ? and stu_id=? and school_id",[req.body.code,req.user.student_id,req.user.school_id],(e,data)=>{
            if(e) return next(e)
            if(data.length >0) return res.send("Already Recorded!")
            db.query("INSERT INTO exams_participants values(?,?,?,?,?,?,?,?,?)",[null,answer_str,Date.now(),null,req.body.code,Number(req.user.student_id),req.user.school_id,null,null],(e,data)=>{
                if(e) return next(e)
                if(data.affectedRows>0){
                    return res.redirect(`/exam/submit?status=true&token=${data.insertId}`)
                }else{
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
        let {status,token} = req.query
        return res.render("exam/submit-status", {
            title: "Submit Status",
            flashMessage: Flash.getMessage(req),
            status,token
        });
    } catch (error) {
        next(error)
    }
};
exports.renderStudentResult = (req, res, next) => {
    try {
        let {token} = req.query
        if(token == undefined || token == null) return res.send("Unauthorized access!")
        db.query("select exam_id,score,answers from exams_participants where id=? and school_id=? and stu_id = ?",[token,req.user.school_id,req.user.student_id],(e,data)=>{
            if(e) return next(e)
            //data[0].score == null || data[0].score == undefined |
            if( false){
                return res.send("your result is 0")
            }else{
                db.query("select q_set.answers,exams.q_set_id FROM exams JOIN q_set on q_set.id = exams.q_set_id WHERE exams.id = ? limit 1",[data[0].exam_id],(e,ans)=>{
                    if(e) return next(e)
                    if(ans.length == 0) return res.send("not found")
                    let qus_ans_arr = JSON.parse(data[0].answers).split(',')
                    let marks = 0
                    console.log(data);
                    console.log(ans);
                    let correct = ans[0].answers.split(',').map((m,index)=>{
                        if(m == qus_ans_arr[index]){
                            return marks++
                        }
                        return marks
                    })
                    console.log(correct);          
                    
                    return
                    return res.render("exam/submit-status", {
                        title: "Submit Status",
                        flashMessage: Flash.getMessage(req),
                        token
                    });
                })
                
            }
        })
        
    } catch (error) {
        next(error)
    }
};
