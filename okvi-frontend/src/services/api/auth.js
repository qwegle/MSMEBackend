import api from './axios';

export const authApi = {
  getCaptcha: () => api.get('/auth/get-captcha'),
  
  login: (data) => api.post('/auth/login', data),
  
  logout: () => api.post('/auth/logout'),
  
  sendOtp: (data) => api.post('/auth/sendotp', data),
  
  verifyOtp: (data) => api.post('/auth/verifyotp', data),
  
  registerUserDetails: (data) => api.post('/auth/registerUserDetails', data),
  
  forgotPasswordSendOtp: (data) => api.post('/auth/forgot-password/send-otp', data),
  
  forgotPasswordVerifyOtp: (data) => api.post('/auth/forgot-password/verify-otp', data),
  
  forgotPasswordReset: (data) => api.post('/auth/forgot-password/reset', data),
  
  changePassword: (data) => api.post('/auth/change-password', data),
  
  getDashboard: () => api.get('/auth/dashboard'),
};
