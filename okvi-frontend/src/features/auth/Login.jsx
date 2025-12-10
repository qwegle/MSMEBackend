import { useState, useEffect } from 'react';
import { useForm } from 'react-hook-form';
import { useTranslation } from 'react-i18next';
import { Link, useNavigate } from 'react-router-dom';
import { RefreshCw, Eye, EyeOff } from 'lucide-react';
import toast from 'react-hot-toast';
import { Button, Input, Card } from '../../components/ui';
import { authApi } from '../../services/api';
import useAuthStore from '../../store/authStore';
import useLanguageStore from '../../store/languageStore';

const Login = () => {
  const { t } = useTranslation(['auth', 'common']);
  const { language } = useLanguageStore();
  const navigate = useNavigate();
  const { setAuth, isAuthenticated } = useAuthStore();
  
  const [captcha, setCaptcha] = useState({ question: '', token: '' });
  const [loading, setLoading] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  
  const { register, handleSubmit, formState: { errors }, reset } = useForm();

  useEffect(() => {
    if (isAuthenticated) {
      navigate('/dashboard');
    }
  }, [isAuthenticated, navigate]);

  useEffect(() => {
    fetchCaptcha();
  }, []);

  const fetchCaptcha = async () => {
    try {
      const response = await authApi.getCaptcha();
      setCaptcha({
        question: response.data.captchaQuestion,
        token: response.data.captchaToken,
      });
    } catch (error) {
      toast.error('Failed to load captcha');
    }
  };

  const onSubmit = async (data) => {
    setLoading(true);
    try {
      const response = await authApi.login({
        email: data.email,
        password: data.password,
        captchaAnswer: data.captcha,
        captchaToken: captcha.token,
      });
      
      if (response.data.status === 'success') {
        setAuth(response.data.user, response.data.token);
        toast.success(t('auth:loginSuccess'));
        navigate('/dashboard');
      }
    } catch (error) {
      toast.error(error.response?.data?.message || t('auth:loginFailed'));
      fetchCaptcha();
      reset({ captcha: '' });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="max-w-lg mx-auto animate-fade-in">
      <Card variant="elevated" className="overflow-hidden">
        <div className="bg-gradient-to-r from-gov-blue to-gov-blue-light p-6 -m-6 mb-6">
          <div className="text-center">
            <div className="w-16 h-16 bg-white/20 rounded-full mx-auto mb-4 flex items-center justify-center backdrop-blur-sm">
              <svg className="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
              </svg>
            </div>
            <h1 className={`text-2xl font-bold text-white ${language === 'or' ? 'font-odia' : ''}`}>
              {t('auth:loginTitle')}
            </h1>
            <p className={`text-white/80 mt-2 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('auth:loginSubtitle')}
            </p>
          </div>
        </div>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-5 mt-8">
          <Input
            label={t('common:email')}
            type="email"
            placeholder={t('auth:enterEmail')}
            required
            autoComplete="email"
            {...register('email', { 
              required: t('common:requiredField'),
              pattern: {
                value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
                message: t('common:invalidEmail'),
              }
            })}
            error={errors.email?.message}
          />

          <div className="relative">
            <Input
              label={t('common:password')}
              type={showPassword ? 'text' : 'password'}
              placeholder={t('auth:enterPassword')}
              required
              autoComplete="current-password"
              {...register('password', { required: t('common:requiredField') })}
              error={errors.password?.message}
            />
            <button
              type="button"
              onClick={() => setShowPassword(!showPassword)}
              className="absolute right-4 top-10 text-gray-400 hover:text-gray-600 transition-colors"
            >
              {showPassword ? <EyeOff size={20} /> : <Eye size={20} />}
            </button>
          </div>

          <div className="space-y-2">
            <label className={`block text-sm font-semibold text-gray-700 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('common:captcha')} <span className="text-red-500">*</span>
            </label>
            <div className="flex items-center gap-3">
              <div className="flex-1 bg-gradient-to-r from-gray-100 to-gray-50 px-5 py-3.5 rounded-xl text-lg font-mono border-2 border-gray-200 text-center tracking-wider">
                {captcha.question || '...'}
              </div>
              <button
                type="button"
                onClick={fetchCaptcha}
                className="p-3.5 bg-gray-100 hover:bg-gov-blue hover:text-white rounded-xl transition-all border-2 border-gray-200 hover:border-gov-blue"
              >
                <RefreshCw size={20} />
              </button>
            </div>
            <Input
              type="text"
              placeholder={t('auth:enterCaptcha')}
              {...register('captcha', { required: t('common:requiredField') })}
              error={errors.captcha?.message}
            />
          </div>

          <Button type="submit" loading={loading} className="w-full" size="lg">
            {t('common:login')}
          </Button>
        </form>

        <div className="mt-8 pt-6 border-t border-gray-100 text-center space-y-3">
          <Link 
            to="/forgot-password" 
            className={`text-gov-blue hover:text-gov-blue-dark font-medium hover:underline block transition-colors ${language === 'or' ? 'font-odia' : ''}`}
          >
            {t('common:forgotPassword')}
          </Link>
          <p className={`text-gray-600 ${language === 'or' ? 'font-odia' : ''}`}>
            {t('auth:dontHaveAccount')}{' '}
            <Link to="/register" className="text-gov-blue hover:text-gov-blue-dark font-semibold hover:underline transition-colors">
              {t('common:signUp')}
            </Link>
          </p>
        </div>
      </Card>
    </div>
  );
};

export default Login;
