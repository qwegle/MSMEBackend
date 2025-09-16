import { createTransport } from 'nodemailer';

const sendEmail = async ({ to, subject, html }) => {
  const transporter = createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true, // Use SSL
    auth: {
      user: process.env.EMAIL_USER,
      pass: process.env.EMAIL_PASS,
    },
  });

  try {
    await transporter.sendMail({
      from: process.env.EMAIL_USER,
      to,
      subject,
      html,
    });
    console.log('Email sent successfully');
  } catch (err) {
    console.error('Error sending email:', err);
    throw err;
  }
};

export default sendEmail;
