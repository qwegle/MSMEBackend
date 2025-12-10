import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { useTranslation } from 'react-i18next';
import { Eye, EyeOff } from 'lucide-react';
import toast from 'react-hot-toast';
import { Card, Button, Input } from '../../components/ui';
import { authApi } from '../../services/api';
import useLanguageStore from '../../store/languageStore';

const ChangePassword = () => {
  const { t } = useTranslation(['auth', 'common']);
  const { language } = useLanguageStore();
  const [loading, setLoading] = useState(false);
  const [showPasswords, setShowPasswords] = useState({ current: false, new: false, confirm: false });

  const { register, handleSubmit, formState: { errors }, watch, reset } = useForm();
  const newPassword = watch('newPassword');

  const togglePassword = (field) => {
    setShowPasswords(prev => ({ ...prev, [field]: !prev[field] }));
  };

  const onSubmit = async (data) => {
    setLoading(true);
    try {
      await authApi.changePassword({
        currentPassword: data.currentPassword,
        newPassword: data.newPassword,
      });
      toast.success(t('auth:passwordChangeSuccess'));
      reset();
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to change password');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="max-w-md mx-auto">
      <h1 className={`text-2xl font-bold text-gray-900 mb-6 ${language === 'or' ? 'font-odia' : ''}`}>
        {t('auth:changePasswordTitle')}
      </h1>

      <Card>
        <p className={`text-gray-600 mb-6 ${language === 'or' ? 'font-odia' : ''}`}>
          {t('auth:changePasswordSubtitle')}
        </p>

        <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
          <div className="relative">
            <Input
              label={t('common:currentPassword')}
              type={showPasswords.current ? 'text' : 'password'}
              required
              {...register('currentPassword', { required: t('common:requiredField') })}
              error={errors.currentPassword?.message}
            />
            <button
              type="button"
              onClick={() => togglePassword('current')}
              className="absolute right-3 top-9 text-gray-500 hover:text-gray-700"
            >
              {showPasswords.current ? <EyeOff size={20} /> : <Eye size={20} />}
            </button>
          </div>

          <div className="relative">
            <Input
              label={t('common:newPassword')}
              type={showPasswords.new ? 'text' : 'password'}
              required
              {...register('newPassword', {
                required: t('common:requiredField'),
                minLength: { value: 8, message: t('common:minLength', { count: 8 }) },
                pattern: {
                  value: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,
                  message: t('auth:passwordPolicy'),
                },
              })}
              error={errors.newPassword?.message}
            />
            <button
              type="button"
              onClick={() => togglePassword('new')}
              className="absolute right-3 top-9 text-gray-500 hover:text-gray-700"
            >
              {showPasswords.new ? <EyeOff size={20} /> : <Eye size={20} />}
            </button>
          </div>

          <div className="relative">
            <Input
              label={t('common:confirmPassword')}
              type={showPasswords.confirm ? 'text' : 'password'}
              required
              {...register('confirmPassword', {
                required: t('common:requiredField'),
                validate: value => value === newPassword || t('common:passwordMismatch'),
              })}
              error={errors.confirmPassword?.message}
            />
            <button
              type="button"
              onClick={() => togglePassword('confirm')}
              className="absolute right-3 top-9 text-gray-500 hover:text-gray-700"
            >
              {showPasswords.confirm ? <EyeOff size={20} /> : <Eye size={20} />}
            </button>
          </div>

          <div className={`text-sm text-gray-500 bg-gray-50 p-3 rounded-lg ${language === 'or' ? 'font-odia' : ''}`}>
            {t('auth:passwordPolicy')}
          </div>

          <Button type="submit" loading={loading} className="w-full">
            {t('common:changePassword')}
          </Button>
        </form>
      </Card>
    </div>
  );
};

export default ChangePassword;
