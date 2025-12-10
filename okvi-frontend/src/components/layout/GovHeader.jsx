import { useTranslation } from 'react-i18next';
import useLanguageStore from '../../store/languageStore';
import useAuthStore from '../../store/authStore';
import { Globe, User, LogOut } from 'lucide-react';
import { useNavigate } from 'react-router-dom';

const GovHeader = () => {
  const { t } = useTranslation('common');
  const { language, toggleLanguage } = useLanguageStore();
  const { isAuthenticated, user, logout } = useAuthStore();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  return (
    <header className="bg-white shadow-md">
      <div className="tricolor-top"></div>
      
      <div className="gov-gradient text-white">
        <div className="container mx-auto px-4 py-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <img 
                src="/assets/odisha-emblem.png" 
                alt="Odisha Emblem" 
                className="h-16 w-auto"
                onError={(e) => {
                  e.target.style.display = 'none';
                }}
              />
              
              <div className="flex flex-col">
                <span className={`text-sm ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('govt')}
                </span>
                <span className={`text-lg font-semibold ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('department')}
                </span>
                <span className={`text-xl font-bold ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('appName')}
                </span>
              </div>
            </div>

            <div className="hidden md:flex flex-col items-center">
              <img 
                src="/assets/cm-placeholder.svg" 
                alt={t('cmName')}
                className="h-20 w-20 rounded-full border-2 border-white shadow-lg bg-white"
              />
              <span className={`text-xs mt-1 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('cmName')}
              </span>
              <span className={`text-xs opacity-80 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('cmTitle')}
              </span>
            </div>

            <div className="flex items-center gap-4">
              <button
                onClick={toggleLanguage}
                className="flex items-center gap-2 px-3 py-2 bg-white/10 hover:bg-white/20 rounded-lg transition-colors"
              >
                <Globe size={18} />
                <span className={language === 'or' ? 'font-odia' : ''}>
                  {language === 'en' ? 'ଓଡ଼ିଆ' : 'English'}
                </span>
              </button>

              {isAuthenticated && (
                <div className="flex items-center gap-3">
                  <div className="flex items-center gap-2 px-3 py-2 bg-white/10 rounded-lg">
                    <User size={18} />
                    <span className="text-sm">{user?.name || user?.email}</span>
                  </div>
                  <button
                    onClick={handleLogout}
                    className="flex items-center gap-2 px-3 py-2 bg-red-500/80 hover:bg-red-500 rounded-lg transition-colors"
                  >
                    <LogOut size={18} />
                    <span className={language === 'or' ? 'font-odia' : ''}>
                      {t('logout')}
                    </span>
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default GovHeader;
