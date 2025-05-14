const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
    }
});

async function sendStatusChangeEmail(form, oldStatusMsg, newStatusMsg) {
    // 1. Email to user
    const userSubject = `Your OTS Form Status Updated`;
    const userMessage = `Hello ${form.first_name},

        The status of your OTS form with ID ${form._id} has changed from:
        "${oldStatusMsg}" ➝ "${newStatusMsg}"

        Regards,
        OFSC`;

    const userMailOptions = {
        from: process.env.EMAIL_USER,
        to: form.email,
        subject: userSubject,
        text: userMessage
    };

    const adminSubject = `User OTS Form Status Changed`;
    const adminMessage = `Hello Admin,

        User ${form.first_name} ${form.last_name} (${form.email}) had their OTS form (ID: ${form._id}) status changed.

        Previous Status: "${oldStatusMsg}"
        New Status: "${newStatusMsg}"

        Regards,
        System`;

    const adminMailOptions = {
        from: process.env.EMAIL_USER,
        to: 'digbi@qwegle.com', // replace with actual admin email
        subject: adminSubject,
        text: adminMessage
    };

    try {
        await transporter.sendMail(userMailOptions);
        await transporter.sendMail(adminMailOptions);
        console.log('User and admin status change emails sent.');
    } catch (err) {
        console.error('Error sending emails:', err);
    }
}

module.exports = sendStatusChangeEmail;
