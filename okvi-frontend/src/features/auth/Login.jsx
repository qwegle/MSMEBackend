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
    <div className="max-w-md mx-auto">
      <Card>
        <div className="text-center mb-6">
          <h1 className={`text-2xl font-bold text-gov-blue ${language === 'or' ? 'font-odia' : ''}`}>
            {t('auth:loginTitle')}
          </h1>
          <p className={`text-gray-600 mt-2 ${language === 'or' ? 'font-odia' : ''}`}>
            {t('auth:loginSubtitle')}
          </p>
        </div>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
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
              className="absolute right-3 top-9 text-gray-500 hover:text-gray-700"
            >
              {showPassword ? <EyeOff size={20} /> : <Eye size={20} />}
            </button>
          </div>

          <div className="space-y-2">
            <label className={`block text-sm font-medium text-gray-700 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('common:captcha')} <span className="text-red-500">*</span>
            </label>
            <div className="flex items-center gap-3">
              <div className="flex-1 bg-gray-100 px-4 py-3 rounded-lg text-lg font-mono">
                {captcha.question || '...'}
              </div>
              <button
                type="button"
                onClick={fetchCaptcha}
                className="p-3 bg-gray-100 hover:bg-gray-200 rounded-lg transition-colors"
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

          <Button type="submit" loading={loading} className="w-full">
            {t('common:login')}
          </Button>
        </form>

        <div className="mt-6 text-center space-y-2">
          <Link 
            to="/forgot-password" 
            className={`text-gov-blue hover:underline block ${language === 'or' ? 'font-odia' : ''}`}
          >
            {t('common:forgotPassword')}
          </Link>
          <p className={`text-gray-600 ${language === 'or' ? 'font-odia' : ''}`}>
            {t('auth:dontHaveAccount')}{' '}
            <Link to="/register" className="text-gov-blue hover:underline font-medium">
              {t('common:signUp')}
            </Link>
          </p>
        </div>
      </Card>
    </div>
  );
};

export default Login;
