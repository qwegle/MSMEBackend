import { Outlet } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import useLanguageStore from '../../store/languageStore';
import { Globe } from 'lucide-react';
import { Toaster } from 'react-hot-toast';

const AuthLayout = () => {
  const { t } = useTranslation('common');
  const { language, toggleLanguage } = useLanguageStore();

  return (
    <div className="min-h-screen bg-gray-100">
      <div className="tricolor-top"></div>
      
      <div className="gov-gradient text-white py-4">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <img 
                src="/assets/odisha-emblem.png" 
                alt="Odisha Emblem" 
                className="h-14 w-auto"
                onError={(e) => {
                  e.target.style.display = 'none';
                }}
              />
              
              <div className="flex flex-col">
                <span className={`text-sm ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('govt')}
                </span>
                <span className={`text-lg font-bold ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('appName')}
                </span>
              </div>
            </div>

            <div className="hidden md:flex flex-col items-center">
              <img 
                src="/assets/cm-placeholder.svg" 
                alt={t('cmName')}
                className="h-16 w-16 rounded-full border-2 border-white shadow-lg bg-white"
              />
              <span className={`text-xs mt-1 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('cmName')}
              </span>
            </div>

            <button
              onClick={toggleLanguage}
              className="flex items-center gap-2 px-4 py-2 bg-white/10 hover:bg-white/20 rounded-lg transition-colors"
            >
              <Globe size={18} />
              <span className={language === 'or' ? 'font-odia' : ''}>
                {language === 'en' ? 'ଓଡ଼ିଆ' : 'English'}
              </span>
            </button>
          </div>
        </div>
      </div>

      <main className="container mx-auto px-4 py-8">
        <Outlet />
      </main>

      <footer className="bg-gov-blue text-white py-4 mt-auto">
        <div className="container mx-auto px-4 text-center">
          <p className={`text-sm ${language === 'or' ? 'font-odia' : ''}`}>
            © {new Date().getFullYear()} {t('department')}, {t('govt')}
          </p>
        </div>
      </footer>
      
      <Toaster position="top-right" />
    </div>
  );
};

export default AuthLayout;
