import { createTransport } from 'nodemailer';

const sendEmail = async ({ to, subject, html }) => {
  console.log(process.env.EMAIL_PASS);
  const transporter = createTransport({
    service: 'gmail',
    auth: {
      user: process.env.EMAIL_USER,
      pass: process.env.EMAIL_PASS,
    },
  });
  console.log(transporter);

  await transporter.sendMail({
    from: process.env.EMAIL_USER,
    to,
    subject,
    html,
  });
};

export default sendEmail;
