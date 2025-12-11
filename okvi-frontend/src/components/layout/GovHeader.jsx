import { useTranslation } from 'react-i18next';
import useLanguageStore from '../../store/languageStore';
import useAuthStore from '../../store/authStore';
import { Globe, LogOut } from 'lucide-react';
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
    <header className="bg-white shadow-lg relative z-50">
      <div className="tricolor-top"></div>
      
      <div className="gov-gradient text-white">
        <div className="max-w-full px-6 py-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <div className="w-12 h-12 bg-white rounded-full flex items-center justify-center shadow-md">
                <span className="text-gov-navy font-bold text-lg">OD</span>
              </div>
              
              <div className="flex flex-col">
                <span className={`text-xs uppercase tracking-wider opacity-90 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('govt')}
                </span>
                <span className={`text-lg font-bold ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('appName')}
                </span>
              </div>
            </div>

            <div className="flex items-center gap-6">
              <div className="hidden md:flex items-center gap-3 bg-white/10 px-4 py-2 rounded-xl">
                <div className="w-10 h-10 bg-gray-200 rounded-full flex items-center justify-center">
                  <svg className="w-6 h-6 text-gray-500" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                  </svg>
                </div>
                <div className="text-left">
                  <p className={`text-sm font-semibold ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('cmName')}
                  </p>
                  <p className={`text-xs opacity-80 ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('cmTitle')}
                  </p>
                </div>
              </div>

              <button
                onClick={toggleLanguage}
                className="flex items-center gap-2 px-4 py-2.5 bg-white/15 hover:bg-white/25 rounded-xl transition-all duration-200 border border-white/20"
              >
                <Globe size={18} />
                <span className={`font-medium ${language === 'or' ? 'font-odia' : ''}`}>
                  {language === 'en' ? 'ଓଡ଼ିଆ' : 'English'}
                </span>
              </button>

              {isAuthenticated && (
                <button
                  onClick={handleLogout}
                  className="flex items-center gap-2 px-4 py-2.5 bg-white text-gov-navy hover:bg-gray-100 rounded-xl transition-all duration-200 font-semibold shadow-md"
                >
                  <LogOut size={18} />
                  <span className={language === 'or' ? 'font-odia' : ''}>
                    {t('logout')}
                  </span>
                </button>
              )}
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default GovHeader;
