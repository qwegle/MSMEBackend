import { createTransport } from 'nodemailer';

const sendEmail = async ({ to, subject, html }) => {
  const useSSL = process.env.USE_SSL_MAIL === 'true';

  const transporter = createTransport({
    host: 'smtp.gmail.com',
    port: useSSL ? 465 : 587,
    secure: useSSL, // true for 465 (SSL), false for 587 (STARTTLS)
    auth: {
      user: process.env.EMAIL_USER,
      pass: process.env.EMAIL_PASS,
    },
  });

  await transporter.sendMail({
    from: process.env.EMAIL_USER,
    to,
    subject,
    html,
  });
};

export default sendEmail;
