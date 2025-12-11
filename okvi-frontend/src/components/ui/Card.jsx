const Card = ({ children, className = '', title, subtitle, actions, variant = 'default', icon: Icon }) => {
  const variants = {
    default: 'dashboard-card',
    elevated: 'dashboard-card shadow-lg',
    flat: 'bg-white rounded-xl border border-gray-200',
  };

  return (
    <div className={`${variants[variant]} ${className}`}>
      {(title || subtitle || actions) && (
        <div className="dashboard-card-header">
          <div className="dashboard-card-title">
            {Icon && <Icon size={20} className="text-gov-navy" />}
            <div>
              {title && <h3 className="text-base font-semibold text-gray-900">{title}</h3>}
              {subtitle && <p className="text-sm text-gray-500 mt-0.5">{subtitle}</p>}
            </div>
          </div>
          {actions && <div>{actions}</div>}
        </div>
      )}
      <div className="dashboard-card-body">{children}</div>
    </div>
  );
};

export default Card;
