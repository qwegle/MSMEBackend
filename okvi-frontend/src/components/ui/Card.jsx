const Card = ({ children, className = '', title, subtitle, actions, variant = 'default' }) => {
  const variants = {
    default: 'bg-white rounded-xl shadow-lg border border-gray-100',
    elevated: 'bg-white rounded-xl shadow-2xl border border-gray-100',
    flat: 'bg-white rounded-xl border border-gray-200',
    gradient: 'bg-gradient-to-br from-white to-gray-50 rounded-xl shadow-lg border border-gray-100',
  };

  return (
    <div className={`${variants[variant]} overflow-hidden ${className}`}>
      {(title || subtitle || actions) && (
        <div className="px-6 py-4 border-b border-gray-100 bg-gradient-to-r from-gray-50 to-white flex items-center justify-between">
          <div>
            {title && <h3 className="text-lg font-bold text-gray-900">{title}</h3>}
            {subtitle && <p className="text-sm text-gray-500 mt-0.5">{subtitle}</p>}
          </div>
          {actions && <div>{actions}</div>}
        </div>
      )}
      <div className="p-6">{children}</div>
    </div>
  );
};

export default Card;
