import { forwardRef } from 'react';
import useLanguageStore from '../../store/languageStore';

const Select = forwardRef(({
  label,
  error,
  options = [],
  placeholder = 'Select...',
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
      <select
        ref={ref}
        className={`input-field ${error ? 'border-red-500 focus:ring-red-500' : ''} ${className}`}
        {...props}
      >
        <option value="">{placeholder}</option>
        {options.map((option) => (
          <option key={option.value} value={option.value}>
            {option.label}
          </option>
        ))}
      </select>
      {error && (
        <p className={`text-sm text-red-500 ${language === 'or' ? 'font-odia' : ''}`}>
          {error}
        </p>
      )}
    </div>
  );
});

Select.displayName = 'Select';

export default Select;
