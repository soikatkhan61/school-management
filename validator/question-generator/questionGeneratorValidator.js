const { body } = require('express-validator')

module.exports = [
    body('school_name')
        .isLength({ min: 2, max: 100 })
        .withMessage("School name  must be in 2-100 characters")
        .trim(),

    body('name')
        .isLength({ min: 2, max: 100 }).withMessage('Questions name must be in 3-100 characters')
        .trim(),

    body('class_id')
        .isNumeric().withMessage('Invalid selected class').trim(),

    body('subject')
        .isNumeric().withMessage('Invalid selected subject').trim(),

    body('q_formate')
        .custom((q_formate, { req }) => {
            if (q_formate !== 'mcq' || q_formate !== 'creative' || q_formate !== 'q_others') {
                throw new Error('Invalid question formate')
            }
        }),

    body('c_password')
        .custom((c_password, { req }) => {
            if (c_password !== req.body.password) {
                throw new Error('Password dose not match!')
            }
            return true
        })
]