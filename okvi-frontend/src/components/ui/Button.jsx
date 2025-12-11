import { Loader2 } from 'lucide-react';

const Button = ({
  children,
  type = 'button',
  variant = 'primary',
  size = 'md',
  loading = false,
  disabled = false,
  className = '',
  onClick,
  ...props
}) => {
  const baseClasses = 'inline-flex items-center justify-center gap-2 font-semibold rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2';
  
  const variants = {
    primary: 'bg-gradient-to-r from-gov-navy to-gov-navy-light text-white hover:from-gov-steel hover:to-gov-navy focus:ring-gov-navy shadow-md hover:shadow-lg disabled:from-gray-400 disabled:to-gray-500 disabled:shadow-none',
    secondary: 'bg-white text-gov-navy border-2 border-gov-navy hover:bg-gov-navy hover:text-white focus:ring-gov-navy disabled:bg-gray-100 disabled:border-gray-300 disabled:text-gray-400',
    saffron: 'bg-gradient-to-r from-gov-saffron to-orange-500 text-white hover:from-orange-600 hover:to-orange-700 focus:ring-gov-saffron shadow-md hover:shadow-lg disabled:from-gray-400 disabled:to-gray-500',
    danger: 'bg-gradient-to-r from-red-500 to-red-600 text-white hover:from-red-600 hover:to-red-700 focus:ring-red-500 shadow-md hover:shadow-lg disabled:from-gray-400 disabled:to-gray-500',
    success: 'bg-gradient-to-r from-gov-green to-green-600 text-white hover:from-green-700 hover:to-green-800 focus:ring-green-500 shadow-md hover:shadow-lg disabled:from-gray-400 disabled:to-gray-500',
    ghost: 'text-gov-navy hover:bg-gov-navy/10 focus:ring-gov-navy',
    outline: 'bg-transparent text-gov-navy border-2 border-gov-navy/30 hover:border-gov-navy hover:bg-gov-navy/5 focus:ring-gov-navy',
  };
  
  const sizes = {
    sm: 'px-3 py-2 text-sm',
    md: 'px-5 py-2.5 text-sm',
    lg: 'px-6 py-3 text-base',
  };

  return (
    <button
      type={type}
      disabled={disabled || loading}
      onClick={onClick}
      className={`${baseClasses} ${variants[variant]} ${sizes[size]} ${className}`}
      {...props}
    >
      {loading && <Loader2 className="w-4 h-4 animate-spin" />}
      {children}
    </button>
  );
};

export default Button;
