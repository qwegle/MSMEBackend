import { createTransport } from 'nodemailer';

const sendEmail = async ({ to, subject, html }) => {
  const transporter = createTransport({
    host: 'smtp.sendgrid.net',
    port: 587,
    auth: {
      user: 'apikey', // literally the string 'apikey'
      pass: process.env.SENDGRID_API_KEY,
    },
  });

  await transporter.sendMail({
    from: process.env.EMAIL_USER, // this must be a verified sender in SendGrid
    to,
    subject,
    html,
  });
};

export default sendEmail;
