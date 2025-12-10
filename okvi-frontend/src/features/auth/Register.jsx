import { useState } from 'react';
import { useForm } from 'react-hook-form';
import { useTranslation } from 'react-i18next';
import { Link, useNavigate } from 'react-router-dom';
import { ArrowLeft, ArrowRight, Check, Plus, Trash2, Eye, EyeOff, RefreshCw } from 'lucide-react';
import toast from 'react-hot-toast';
import { Button, Input, Select, Card } from '../../components/ui';
import { authApi, masterApi } from '../../services/api';
import useLanguageStore from '../../store/languageStore';

const STEPS = [
  'step1', 'step2', 'step3', 'step4', 'step5', 'step6', 'step7', 'step8'
];

const Register = () => {
  const { t } = useTranslation(['auth', 'common']);
  const { language } = useLanguageStore();
  const navigate = useNavigate();
  
  const [step, setStep] = useState(1);
  const [loading, setLoading] = useState(false);
  const [emailVerified, setEmailVerified] = useState(false);
  const [otpSent, setOtpSent] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const [captcha, setCaptcha] = useState({ question: '', token: '' });
  const [committeeMembers, setCommitteeMembers] = useState([{ name: '', designation: '', mobile: '' }]);
  
  const [formData, setFormData] = useState({
    email: '',
    institutionName: '',
    district: '',
    dicRic: '',
    address: '',
    pincode: '',
    phone: '',
    registrationNo: '',
    registrationDate: '',
    bankName: '',
    branchName: '',
    accountNo: '',
    ifscCode: '',
    accountHolderName: '',
    secretaryName: '',
    secretaryMobile: '',
    secretaryEmail: '',
    presidentName: '',
    presidentMobile: '',
    presidentEmail: '',
  });

  const { register, handleSubmit, formState: { errors }, watch, reset, getValues } = useForm();
  const newPassword = watch('password');

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

  const handleSendOtp = async () => {
    const email = getValues('email');
    if (!email) {
      toast.error(t('common:requiredField'));
      return;
    }
    setLoading(true);
    try {
      await authApi.sendOtp({ email });
      setOtpSent(true);
      setFormData(prev => ({ ...prev, email }));
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
      await authApi.verifyOtp({ email: formData.email, otp: data.otp });
      setEmailVerified(true);
      toast.success(t('auth:otpVerified'));
      setStep(2);
    } catch (error) {
      toast.error(error.response?.data?.message || t('auth:otpInvalid'));
    } finally {
      setLoading(false);
    }
  };

  const handleStepSubmit = (data) => {
    setFormData(prev => ({ ...prev, ...data }));
    if (step < 8) {
      setStep(step + 1);
      reset();
    }
  };

  const handleFinalSubmit = async (data) => {
    setLoading(true);
    try {
      await authApi.registerUserDetails({
        ...formData,
        ...data,
        committeeMembers,
        captchaAnswer: data.captcha,
        captchaToken: captcha.token,
      });
      toast.success(t('auth:registrationSuccess'));
      navigate('/login');
    } catch (error) {
      toast.error(error.response?.data?.message || 'Registration failed');
      fetchCaptcha();
    } finally {
      setLoading(false);
    }
  };

  const addCommitteeMember = () => {
    setCommitteeMembers([...committeeMembers, { name: '', designation: '', mobile: '' }]);
  };

  const removeCommitteeMember = (index) => {
    if (committeeMembers.length > 1) {
      setCommitteeMembers(committeeMembers.filter((_, i) => i !== index));
    }
  };

  const updateCommitteeMember = (index, field, value) => {
    const updated = [...committeeMembers];
    updated[index][field] = value;
    setCommitteeMembers(updated);
  };

  const renderStepIndicator = () => (
    <div className="flex items-center justify-center gap-2 mb-6 flex-wrap">
      {STEPS.map((_, index) => (
        <div key={index} className="flex items-center">
          <div
            className={`w-8 h-8 rounded-full flex items-center justify-center text-sm font-medium ${
              index + 1 < step
                ? 'bg-green-500 text-white'
                : index + 1 === step
                ? 'bg-gov-blue text-white'
                : 'bg-gray-200 text-gray-500'
            }`}
          >
            {index + 1 < step ? <Check size={16} /> : index + 1}
          </div>
          {index < STEPS.length - 1 && (
            <div className={`w-8 h-1 ${index + 1 < step ? 'bg-green-500' : 'bg-gray-200'}`} />
          )}
        </div>
      ))}
    </div>
  );

  return (
    <div className="max-w-2xl mx-auto">
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
            {t('auth:registerTitle')}
          </h1>
          <p className={`text-gray-600 mt-2 ${language === 'or' ? 'font-odia' : ''}`}>
            {t(`auth:step${step}`)}
          </p>
        </div>

        {renderStepIndicator()}

        {step === 1 && (
          <form onSubmit={handleSubmit(handleVerifyOtp)} className="space-y-4">
            <div className="flex gap-3">
              <div className="flex-1">
                <Input
                  label={t('common:email')}
                  type="email"
                  placeholder={t('auth:enterEmail')}
                  required
                  disabled={otpSent}
                  {...register('email', { 
                    required: t('common:requiredField'),
                    pattern: {
                      value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
                      message: t('common:invalidEmail'),
                    }
                  })}
                  error={errors.email?.message}
                />
              </div>
              {!otpSent && (
                <Button 
                  type="button" 
                  onClick={handleSendOtp} 
                  loading={loading}
                  className="self-end"
                >
                  {t('common:sendOtp')}
                </Button>
              )}
            </div>
            
            {otpSent && !emailVerified && (
              <>
                <Input
                  label={t('common:enterOtp')}
                  type="text"
                  placeholder="Enter 6-digit OTP"
                  required
                  {...register('otp', { 
                    required: t('common:requiredField'),
                    minLength: { value: 6, message: 'OTP must be 6 digits' },
                  })}
                  error={errors.otp?.message}
                />
                <div className="flex gap-3">
                  <Button type="submit" loading={loading} className="flex-1">
                    {t('common:verifyOtp')}
                  </Button>
                  <Button 
                    type="button" 
                    variant="secondary" 
                    onClick={handleSendOtp}
                    loading={loading}
                  >
                    {t('common:resendOtp')}
                  </Button>
                </div>
              </>
            )}
          </form>
        )}

        {step === 2 && (
          <form onSubmit={handleSubmit(handleStepSubmit)} className="space-y-4">
            <Input
              label={t('auth:institutionName')}
              required
              {...register('institutionName', { required: t('common:requiredField') })}
              error={errors.institutionName?.message}
            />
            <div className="grid grid-cols-2 gap-4">
              <Input
                label={t('auth:district')}
                required
                {...register('district', { required: t('common:requiredField') })}
                error={errors.district?.message}
              />
              <Input
                label={t('auth:dicRic')}
                required
                {...register('dicRic', { required: t('common:requiredField') })}
                error={errors.dicRic?.message}
              />
            </div>
            <Input
              label={t('auth:address')}
              required
              {...register('address', { required: t('common:requiredField') })}
              error={errors.address?.message}
            />
            <div className="grid grid-cols-2 gap-4">
              <Input
                label={t('auth:pincode')}
                required
                {...register('pincode', { required: t('common:requiredField') })}
                error={errors.pincode?.message}
              />
              <Input
                label={t('auth:phone')}
                {...register('phone')}
              />
            </div>
            <div className="flex justify-end">
              <Button type="submit">
                {t('common:next')} <ArrowRight size={18} />
              </Button>
            </div>
          </form>
        )}

        {step === 3 && (
          <form onSubmit={handleSubmit(handleStepSubmit)} className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <Input
                label={t('auth:registrationNo')}
                required
                {...register('registrationNo', { required: t('common:requiredField') })}
                error={errors.registrationNo?.message}
              />
              <Input
                label={t('auth:registrationDate')}
                type="date"
                required
                {...register('registrationDate', { required: t('common:requiredField') })}
                error={errors.registrationDate?.message}
              />
            </div>
            <div className="flex justify-between">
              <Button type="button" variant="secondary" onClick={() => setStep(step - 1)}>
                <ArrowLeft size={18} /> {t('common:previous')}
              </Button>
              <Button type="submit">
                {t('common:next')} <ArrowRight size={18} />
              </Button>
            </div>
          </form>
        )}

        {step === 4 && (
          <form onSubmit={handleSubmit(handleStepSubmit)} className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <Input
                label={t('auth:bankName')}
                required
                {...register('bankName', { required: t('common:requiredField') })}
                error={errors.bankName?.message}
              />
              <Input
                label={t('auth:branchName')}
                required
                {...register('branchName', { required: t('common:requiredField') })}
                error={errors.branchName?.message}
              />
            </div>
            <div className="grid grid-cols-2 gap-4">
              <Input
                label={t('auth:accountNo')}
                required
                {...register('accountNo', { required: t('common:requiredField') })}
                error={errors.accountNo?.message}
              />
              <Input
                label={t('auth:ifscCode')}
                required
                {...register('ifscCode', { required: t('common:requiredField') })}
                error={errors.ifscCode?.message}
              />
            </div>
            <Input
              label={t('auth:accountHolderName')}
              required
              {...register('accountHolderName', { required: t('common:requiredField') })}
              error={errors.accountHolderName?.message}
            />
            <div className="flex justify-between">
              <Button type="button" variant="secondary" onClick={() => setStep(step - 1)}>
                <ArrowLeft size={18} /> {t('common:previous')}
              </Button>
              <Button type="submit">
                {t('common:next')} <ArrowRight size={18} />
              </Button>
            </div>
          </form>
        )}

        {step === 5 && (
          <form onSubmit={handleSubmit(handleStepSubmit)} className="space-y-4">
            <Input
              label={t('auth:secretaryName')}
              required
              {...register('secretaryName', { required: t('common:requiredField') })}
              error={errors.secretaryName?.message}
            />
            <div className="grid grid-cols-2 gap-4">
              <Input
                label={t('auth:secretaryMobile')}
                required
                {...register('secretaryMobile', { required: t('common:requiredField') })}
                error={errors.secretaryMobile?.message}
              />
              <Input
                label={t('auth:secretaryEmail')}
                type="email"
                {...register('secretaryEmail')}
              />
            </div>
            <div className="flex justify-between">
              <Button type="button" variant="secondary" onClick={() => setStep(step - 1)}>
                <ArrowLeft size={18} /> {t('common:previous')}
              </Button>
              <Button type="submit">
                {t('common:next')} <ArrowRight size={18} />
              </Button>
            </div>
          </form>
        )}

        {step === 6 && (
          <form onSubmit={handleSubmit(handleStepSubmit)} className="space-y-4">
            <Input
              label={t('auth:presidentName')}
              required
              {...register('presidentName', { required: t('common:requiredField') })}
              error={errors.presidentName?.message}
            />
            <div className="grid grid-cols-2 gap-4">
              <Input
                label={t('auth:presidentMobile')}
                required
                {...register('presidentMobile', { required: t('common:requiredField') })}
                error={errors.presidentMobile?.message}
              />
              <Input
                label={t('auth:presidentEmail')}
                type="email"
                {...register('presidentEmail')}
              />
            </div>
            <div className="flex justify-between">
              <Button type="button" variant="secondary" onClick={() => setStep(step - 1)}>
                <ArrowLeft size={18} /> {t('common:previous')}
              </Button>
              <Button type="submit">
                {t('common:next')} <ArrowRight size={18} />
              </Button>
            </div>
          </form>
        )}

        {step === 7 && (
          <div className="space-y-4">
            <div className="space-y-4">
              {committeeMembers.map((member, index) => (
                <div key={index} className="p-4 border rounded-lg space-y-3">
                  <div className="flex justify-between items-center">
                    <span className={`font-medium ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('auth:memberName', { ns: 'auth' })} {index + 1}
                    </span>
                    {committeeMembers.length > 1 && (
                      <button
                        type="button"
                        onClick={() => removeCommitteeMember(index)}
                        className="text-red-500 hover:text-red-700"
                      >
                        <Trash2 size={18} />
                      </button>
                    )}
                  </div>
                  <div className="grid grid-cols-3 gap-3">
                    <Input
                      placeholder={t('auth:memberName')}
                      value={member.name}
                      onChange={(e) => updateCommitteeMember(index, 'name', e.target.value)}
                    />
                    <Input
                      placeholder={t('auth:memberDesignation')}
                      value={member.designation}
                      onChange={(e) => updateCommitteeMember(index, 'designation', e.target.value)}
                    />
                    <Input
                      placeholder={t('auth:memberMobile')}
                      value={member.mobile}
                      onChange={(e) => updateCommitteeMember(index, 'mobile', e.target.value)}
                    />
                  </div>
                </div>
              ))}
            </div>
            <Button type="button" variant="secondary" onClick={addCommitteeMember} className="w-full">
              <Plus size={18} /> {t('auth:addMember')}
            </Button>
            <div className="flex justify-between">
              <Button type="button" variant="secondary" onClick={() => setStep(step - 1)}>
                <ArrowLeft size={18} /> {t('common:previous')}
              </Button>
              <Button type="button" onClick={() => { fetchCaptcha(); setStep(8); }}>
                {t('common:next')} <ArrowRight size={18} />
              </Button>
            </div>
          </div>
        )}

        {step === 8 && (
          <form onSubmit={handleSubmit(handleFinalSubmit)} className="space-y-4">
            <div className="relative">
              <Input
                label={t('common:password')}
                type={showPassword ? 'text' : 'password'}
                required
                {...register('password', { 
                  required: t('common:requiredField'),
                  minLength: { value: 8, message: t('common:minLength', { count: 8 }) },
                  pattern: {
                    value: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,
                    message: t('auth:passwordPolicy'),
                  }
                })}
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

            <div className="flex justify-between">
              <Button type="button" variant="secondary" onClick={() => setStep(step - 1)}>
                <ArrowLeft size={18} /> {t('common:previous')}
              </Button>
              <Button type="submit" loading={loading}>
                {t('common:register')}
              </Button>
            </div>
          </form>
        )}
      </Card>
    </div>
  );
};

export default Register;
