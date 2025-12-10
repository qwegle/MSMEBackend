import { useState, useEffect } from 'react';
import { useForm } from 'react-hook-form';
import { useTranslation } from 'react-i18next';
import { Link, useNavigate } from 'react-router-dom';
import { RefreshCw, Eye, EyeOff } from 'lucide-react';
import toast from 'react-hot-toast';
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
    <div className="login-card">
      <div className="login-header">
        <div className="login-icon">
          <svg width="28" height="28" viewBox="0 0 24 24" fill="white">
            <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
          </svg>
        </div>
        <h1 className={`login-title ${language === 'or' ? 'font-odia' : ''}`}>
          {t('auth:loginTitle')}
        </h1>
        <p className={`login-subtitle ${language === 'or' ? 'font-odia' : ''}`}>
          {t('auth:loginSubtitle')}
        </p>
      </div>

      <div className="login-body">
        <form onSubmit={handleSubmit(onSubmit)}>
          <div className="form-group">
            <label className={`form-label ${language === 'or' ? 'font-odia' : ''}`}>
              {t('common:email')} <span style={{ color: '#dc2626' }}>*</span>
            </label>
            <input
              type="email"
              className="form-input"
              placeholder={t('auth:enterEmail')}
              autoComplete="email"
              {...register('email', { 
                required: t('common:requiredField'),
                pattern: {
                  value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
                  message: t('common:invalidEmail'),
                }
              })}
            />
            {errors.email && (
              <p style={{ color: '#dc2626', fontSize: '13px', marginTop: '4px' }}>
                {errors.email.message}
              </p>
            )}
          </div>

          <div className="form-group" style={{ position: 'relative' }}>
            <label className={`form-label ${language === 'or' ? 'font-odia' : ''}`}>
              {t('common:password')} <span style={{ color: '#dc2626' }}>*</span>
            </label>
            <input
              type={showPassword ? 'text' : 'password'}
              className="form-input"
              placeholder={t('auth:enterPassword')}
              autoComplete="current-password"
              {...register('password', { required: t('common:requiredField') })}
            />
            <button
              type="button"
              onClick={() => setShowPassword(!showPassword)}
              style={{
                position: 'absolute',
                right: '12px',
                top: '38px',
                background: 'none',
                border: 'none',
                cursor: 'pointer',
                color: '#6b7280'
              }}
            >
              {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
            </button>
            {errors.password && (
              <p style={{ color: '#dc2626', fontSize: '13px', marginTop: '4px' }}>
                {errors.password.message}
              </p>
            )}
          </div>

          <div className="form-group">
            <label className={`form-label ${language === 'or' ? 'font-odia' : ''}`}>
              {t('common:captcha')} <span style={{ color: '#dc2626' }}>*</span>
            </label>
            <div className="captcha-row">
              <div className="captcha-display">
                {captcha.question || '...'}
              </div>
              <button type="button" onClick={fetchCaptcha} className="captcha-refresh">
                <RefreshCw size={18} color="#5f6368" />
              </button>
            </div>
            <input
              type="text"
              className="form-input"
              placeholder={t('auth:enterCaptcha')}
              {...register('captcha', { required: t('common:requiredField') })}
            />
            {errors.captcha && (
              <p style={{ color: '#dc2626', fontSize: '13px', marginTop: '4px' }}>
                {errors.captcha.message}
              </p>
            )}
          </div>

          <button type="submit" className="btn-primary" disabled={loading}>
            {loading ? 'Please wait...' : t('common:login')}
          </button>
        </form>

        <div className="login-footer">
          <p style={{ marginBottom: '12px' }}>
            <Link to="/forgot-password" className={`login-link ${language === 'or' ? 'font-odia' : ''}`}>
              {t('common:forgotPassword')}
            </Link>
          </p>
          <p className={language === 'or' ? 'font-odia' : ''} style={{ color: '#5f6368', fontSize: '14px' }}>
            {t('auth:dontHaveAccount')}{' '}
            <Link to="/register" className="login-link" style={{ fontWeight: 600 }}>
              {t('common:signUp')}
            </Link>
          </p>
        </div>
      </div>
    </div>
  );
};

export default Login;
