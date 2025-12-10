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
  const baseClasses = 'inline-flex items-center justify-center gap-2 font-semibold rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 transform active:scale-95';
  
  const variants = {
    primary: 'bg-gradient-to-r from-gov-blue to-gov-blue-light text-white hover:from-gov-blue-dark hover:to-gov-blue focus:ring-gov-blue shadow-lg hover:shadow-xl disabled:from-gray-400 disabled:to-gray-500 disabled:shadow-none',
    secondary: 'bg-white text-gov-blue border-2 border-gov-blue hover:bg-gov-blue hover:text-white focus:ring-gov-blue disabled:bg-gray-100 disabled:border-gray-300 disabled:text-gray-400',
    saffron: 'bg-gradient-to-r from-gov-saffron to-orange-500 text-white hover:from-orange-600 hover:to-orange-700 focus:ring-gov-saffron shadow-lg hover:shadow-xl disabled:from-gray-400 disabled:to-gray-500',
    danger: 'bg-gradient-to-r from-red-500 to-red-600 text-white hover:from-red-600 hover:to-red-700 focus:ring-red-500 shadow-lg hover:shadow-xl disabled:from-gray-400 disabled:to-gray-500',
    success: 'bg-gradient-to-r from-gov-green to-green-600 text-white hover:from-green-700 hover:to-green-800 focus:ring-green-500 shadow-lg hover:shadow-xl disabled:from-gray-400 disabled:to-gray-500',
    ghost: 'text-gov-blue hover:bg-gov-blue/10 focus:ring-gov-blue',
    outline: 'bg-transparent text-gov-blue border-2 border-gov-blue/30 hover:border-gov-blue hover:bg-gov-blue/5 focus:ring-gov-blue',
  };
  
  const sizes = {
    sm: 'px-4 py-2 text-sm',
    md: 'px-6 py-3 text-base',
    lg: 'px-8 py-4 text-lg',
  };

  return (
    <button
      type={type}
      disabled={disabled || loading}
      onClick={onClick}
      className={`${baseClasses} ${variants[variant]} ${sizes[size]} ${className}`}
      {...props}
    >
      {loading && <Loader2 className="w-5 h-5 animate-spin" />}
      {children}
    </button>
  );
};

export default Button;
