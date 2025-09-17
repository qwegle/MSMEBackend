import { createTransport } from 'nodemailer';
import sgMail from '@sendgrid/mail';

const sendEmail = async ({ to, subject, html }) => {
  const useSMTP = process.env.USE_SMTP === 'true';

  if (useSMTP) {
    // ✅ Use Gmail SMTP (works locally, not on Render free tier)
    const useSSL = process.env.USE_SSL_MAIL === 'true';
    const transporter = createTransport({
      host: 'smtp.gmail.com',
      port: useSSL ? 465 : 587,
      secure: useSSL,
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
  } else {

    sgMail.setApiKey(process.env.SENDGRID_API_KEY);
    await sgMail.send({
      from: process.env.SENDGRID_FROM || process.env.EMAIL_USER,
      to,
      subject,
      html,
    });
  }
};

export default sendEmail;
