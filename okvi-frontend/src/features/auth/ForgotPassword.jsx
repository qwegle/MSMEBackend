import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { useTranslation } from 'react-i18next';
import { Link, useNavigate } from 'react-router-dom';
import { ArrowLeft, Eye, EyeOff } from 'lucide-react';
import toast from 'react-hot-toast';
import { Button, Input, Card } from '../../components/ui';
import { authApi } from '../../services/api';
import useLanguageStore from '../../store/languageStore';

const ForgotPassword = () => {
  const { t } = useTranslation(['auth', 'common']);
  const { language } = useLanguageStore();
  const navigate = useNavigate();
  
  const [step, setStep] = useState(1);
  const [loading, setLoading] = useState(false);
  const [email, setEmail] = useState('');
  const [resetToken, setResetToken] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  
  const { register, handleSubmit, formState: { errors }, watch, reset } = useForm();
  const newPassword = watch('newPassword');

  const handleSendOtp = async (data) => {
    setLoading(true);
    try {
      await authApi.forgotPasswordSendOtp({ email: data.email });
      setEmail(data.email);
      setStep(2);
      toast.success(t('auth:otpSent'));
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to send OTP');
    } finally {
      setLoading(false);
    }
  };

  const handleVerifyOtp = async (data) => {
    setLoading(true);
    try {
      const response = await authApi.forgotPasswordVerifyOtp({ 
        email, 
        otp: data.otp 
      });
      setResetToken(response.data.resetToken);
      setStep(3);
      reset();
      toast.success(t('auth:otpVerified'));
    } catch (error) {
      toast.error(error.response?.data?.message || t('auth:otpInvalid'));
    } finally {
      setLoading(false);
    }
  };

  const handleResetPassword = async (data) => {
    setLoading(true);
    try {
      await authApi.forgotPasswordReset({
        email,
        resetToken,
        newPassword: data.newPassword,
      });
      toast.success(t('auth:passwordResetSuccess'));
      navigate('/login');
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to reset password');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="max-w-md mx-auto">
      <Card>
        <Link 
          to="/login" 
          className={`inline-flex items-center gap-2 text-gov-blue hover:underline mb-4 ${language === 'or' ? 'font-odia' : ''}`}
        >
          <ArrowLeft size={18} />
          {t('common:back')}
        </Link>

        <div className="text-center mb-6">
          <h1 className={`text-2xl font-bold text-gov-blue ${language === 'or' ? 'font-odia' : ''}`}>
            {step === 3 ? t('auth:resetPasswordTitle') : t('auth:forgotPasswordTitle')}
          </h1>
          <p className={`text-gray-600 mt-2 ${language === 'or' ? 'font-odia' : ''}`}>
            {step === 3 ? t('auth:resetPasswordSubtitle') : t('auth:forgotPasswordSubtitle')}
          </p>
        </div>

        {step === 1 && (
          <form onSubmit={handleSubmit(handleSendOtp)} className="space-y-4">
            <Input
              label={t('common:email')}
              type="email"
              placeholder={t('auth:enterEmail')}
              required
              {...register('email', { 
                required: t('common:requiredField'),
                pattern: {
                  value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
                  message: t('common:invalidEmail'),
                }
              })}
              error={errors.email?.message}
            />
            <Button type="submit" loading={loading} className="w-full">
              {t('common:sendOtp')}
            </Button>
          </form>
        )}

        {step === 2 && (
          <form onSubmit={handleSubmit(handleVerifyOtp)} className="space-y-4">
            <Input
              label={t('common:enterOtp')}
              type="text"
              placeholder="Enter 6-digit OTP"
              required
              {...register('otp', { 
                required: t('common:requiredField'),
                minLength: { value: 6, message: 'OTP must be 6 digits' },
                maxLength: { value: 6, message: 'OTP must be 6 digits' },
              })}
              error={errors.otp?.message}
            />
            <Button type="submit" loading={loading} className="w-full">
              {t('common:verifyOtp')}
            </Button>
            <button
              type="button"
              onClick={() => setStep(1)}
              className={`w-full text-center text-gov-blue hover:underline ${language === 'or' ? 'font-odia' : ''}`}
            >
              {t('common:resendOtp')}
            </button>
          </form>
        )}

        {step === 3 && (
          <form onSubmit={handleSubmit(handleResetPassword)} className="space-y-4">
            <div className="relative">
              <Input
                label={t('common:newPassword')}
                type={showPassword ? 'text' : 'password'}
                required
                {...register('newPassword', { 
                  required: t('common:requiredField'),
                  minLength: { value: 8, message: t('common:minLength', { count: 8 }) },
                  pattern: {
                    value: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,
                    message: t('auth:passwordPolicy'),
                  }
                })}
                error={errors.newPassword?.message}
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-3 top-9 text-gray-500 hover:text-gray-700"
              >
                {showPassword ? <EyeOff size={20} /> : <Eye size={20} />}
              </button>
            </div>
            <Input
              label={t('common:confirmPassword')}
              type="password"
              required
              {...register('confirmPassword', { 
                required: t('common:requiredField'),
                validate: value => value === newPassword || t('common:passwordMismatch'),
              })}
              error={errors.confirmPassword?.message}
            />
            <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('auth:passwordPolicy')}
            </p>
            <Button type="submit" loading={loading} className="w-full">
              {t('common:resetPassword')}
            </Button>
          </form>
        )}
      </Card>
    </div>
  );
};

export default ForgotPassword;
