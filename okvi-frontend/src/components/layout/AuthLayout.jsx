import { Outlet } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import useLanguageStore from '../../store/languageStore';
import { Globe } from 'lucide-react';
import { Toaster } from 'react-hot-toast';

const AuthLayout = () => {
  const { t } = useTranslation('common');
  const { language, toggleLanguage } = useLanguageStore();

  return (
    <div className="min-h-screen flex flex-col bg-gray-50">
      <div className="h-1.5 bg-gradient-to-r from-gov-saffron via-white to-gov-green"></div>
      
      <header className="bg-gradient-to-r from-gov-blue to-gov-blue-dark text-white">
        <div className="max-w-7xl mx-auto px-6 lg:px-10 py-4">
          <div className="flex items-center justify-between gap-6">
            <div className="flex items-center gap-5">
              <div className="h-14 w-14 bg-white rounded-lg flex items-center justify-center shadow-lg flex-shrink-0">
                <span className="text-gov-blue font-bold text-xl">OD</span>
              </div>
              
              <div>
                <p className={`text-sm text-white/80 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('govt')}
                </p>
                <h1 className={`text-lg lg:text-xl font-bold ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('appName')}
                </h1>
              </div>
            </div>

            <div className="hidden md:flex flex-col items-center bg-white/10 rounded-xl px-6 py-3 backdrop-blur-sm">
              <div className="w-16 h-16 rounded-full bg-white shadow-lg overflow-hidden flex items-center justify-center">
                <svg className="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clipRule="evenodd" />
                </svg>
              </div>
              <div className="text-center mt-2">
                <p className={`text-sm font-semibold ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('cmName')}
                </p>
                <p className="text-xs text-white/70 uppercase tracking-wide">
                  Hon'ble Chief Minister
                </p>
              </div>
            </div>

            <button
              onClick={toggleLanguage}
              className="flex items-center gap-2 px-4 py-2 bg-white/10 hover:bg-white/20 rounded-lg transition-all text-sm font-medium"
            >
              <Globe size={16} />
              <span className={language === 'or' ? 'font-odia' : ''}>
                {language === 'en' ? 'ଓଡ଼ିଆ' : 'English'}
              </span>
            </button>
          </div>
        </div>
      </header>

      <main className="flex-1 py-10 px-6">
        <Outlet />
      </main>

      <footer className="bg-gov-blue text-white py-4">
        <div className="max-w-7xl mx-auto px-6 text-center">
          <p className={`text-sm text-white/80 ${language === 'or' ? 'font-odia' : ''}`}>
            © {new Date().getFullYear()} {t('department')}, {t('govt')}
          </p>
        </div>
      </footer>
      
      <Toaster 
        position="top-right" 
        toastOptions={{
          style: {
            borderRadius: '10px',
            padding: '14px 18px',
          },
        }}
      />
    </div>
  );
};

export default AuthLayout;
