const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
    }
});

async function sendStatusChangeEmail(form, oldStatusMsg, newStatusMsg) {
    const userSubject = `OTS Form Status Update - Loan No: ${form.loan_number}`;

    const userHtml = `
        <div style="font-family: Arial, sans-serif; line-height: 1.6;">
            <p>Hello <strong>${form.first_name}</strong>,</p>

            <p>We hope you're doing well.</p>

            <p style="margin-bottom: 10px;">
                This is to inform you that the status of your OTS form has been <span style="color: #007bff;"><strong>updated</strong></span>. Please find the details below:
            </p>

            <ul style="list-style: none; padding: 0;">
                <li><strong>OTS Form ID:</strong> ${form._id}</li>
                <li><strong>Loan Number:</strong> ${form.loan_number}</li>
                <li><strong>Previous Status:</strong> <span style="color: #dc3545;">"${oldStatusMsg}"</span></li>
                <li><strong>Updated Status:</strong> <span style="color: #28a745;">"${newStatusMsg}"</span></li>
            </ul>

            <p>
                You can log in to your dashboard for more information or to take further action.
            </p>

            <p style="margin-top: 30px;">
                Best regards,<br>
                <strong style="color:#0d6efd;">OFSC Support Team</strong>
            </p>
        </div>
    `;

    const adminSubject = `OTS Form Status Updated for ${form.first_name} ${form.last_name}`;

    const adminHtml = `
        <div style="font-family: Arial, sans-serif; line-height: 1.6;">
            <p>Hello <strong>Admin</strong>,</p>

            <p style="margin-bottom: 10px;">
                A user's OTS form status has been updated. Please find the details below:
            </p>

            <ul style="list-style: none; padding: 0;">
                <li><strong>User:</strong> ${form.first_name} ${form.last_name}</li>
                <li><strong>Email:</strong> ${form.email}</li>
                <li><strong>OTS Form ID:</strong> ${form._id}</li>
                <li><strong>Loan Number:</strong> ${form.loan_number}</li>
                <li><strong>Previous Status:</strong> <span style="color: #dc3545;">"${oldStatusMsg}"</span></li>
                <li><strong>New Status:</strong> <span style="color: #28a745;">"${newStatusMsg}"</span></li>
            </ul>

            <p>
                Kindly review and proceed accordingly.
            </p>

            <p style="margin-top: 30px;">
                Best regards,<br>
                <strong style="color: #6c757d;">Automated Notification System</strong>
            </p>
        </div>
    `;

    const userMailOptions = {
        from: `"OFSC Support" <${process.env.EMAIL_USER}>`,
        to: form.email,
        subject: userSubject,
        html: userHtml,
    };

    const adminMailOptions = {
        from: `"System Notifier" <${process.env.EMAIL_USER}>`,
        to: 'digbi@qwegle.com', // Replace with actual admin email
        subject: adminSubject,
        html: adminHtml,
    };

    try {
        await transporter.sendMail(userMailOptions);
        await transporter.sendMail(adminMailOptions);
        console.log('HTML emails sent to user and admin.');
    } catch (err) {
        console.error('Error sending emails:', err);
    }
}

module.exports = sendStatusChangeEmail;
