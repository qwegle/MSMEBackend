import { forwardRef } from 'react';
import useLanguageStore from '../../store/languageStore';

const Input = forwardRef(({
  label,
  error,
  type = 'text',
  className = '',
  required = false,
  ...props
}, ref) => {
  const { language } = useLanguageStore();

  return (
    <div className="space-y-1">
      {label && (
        <label className={`block text-sm font-medium text-gray-700 ${language === 'or' ? 'font-odia' : ''}`}>
          {label}
          {required && <span className="text-red-500 ml-1">*</span>}
        </label>
      )}
      <input
        ref={ref}
        type={type}
        className={`input-field ${error ? 'border-red-500 focus:ring-red-500' : ''} ${className}`}
        {...props}
      />
      {error && (
        <p className={`text-sm text-red-500 ${language === 'or' ? 'font-odia' : ''}`}>
          {error}
        </p>
      )}
    </div>
  );
});

Input.displayName = 'Input';

export default Input;
