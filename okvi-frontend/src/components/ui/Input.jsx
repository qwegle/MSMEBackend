import { forwardRef } from 'react';
import useLanguageStore from '../../store/languageStore';

const Input = forwardRef(({
  label,
  error,
  type = 'text',
  className = '',
  required = false,
  icon,
  ...props
}, ref) => {
  const { language } = useLanguageStore();

  return (
    <div className="space-y-1.5">
      {label && (
        <label className={`block text-sm font-semibold text-gray-700 ${language === 'or' ? 'font-odia' : ''}`}>
          {label}
          {required && <span className="text-red-500 ml-1">*</span>}
        </label>
      )}
      <div className="relative">
        {icon && (
          <div className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
            {icon}
          </div>
        )}
        <input
          ref={ref}
          type={type}
          className={`w-full px-4 py-3 border-1.5 border-gray-200 rounded-xl focus:ring-4 focus:ring-gov-navy/10 focus:border-gov-navy outline-none transition-all bg-white text-gray-800 placeholder-gray-400 hover:border-gray-300 ${icon ? 'pl-10' : ''} ${error ? 'border-red-400 focus:border-red-500 focus:ring-red-500/10' : ''} ${className}`}
          {...props}
        />
      </div>
      {error && (
        <p className={`text-sm text-red-500 flex items-center gap-1.5 ${language === 'or' ? 'font-odia' : ''}`}>
          <svg className="w-4 h-4 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
            <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
          </svg>
          {error}
        </p>
      )}
    </div>
  );
});

Input.displayName = 'Input';

export default Input;
