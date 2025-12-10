import { Outlet } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import useLanguageStore from '../../store/languageStore';
import { Globe, User } from 'lucide-react';
import { Toaster } from 'react-hot-toast';

const AuthLayout = () => {
  const { t } = useTranslation('common');
  const { language, toggleLanguage } = useLanguageStore();

  return (
    <div className="min-h-screen flex flex-col" style={{ background: 'linear-gradient(180deg, #e8f4fc 0%, #f0f8ff 100%)' }}>
      <div className="tricolor-top"></div>
      
      <header className="gov-header-pattern text-white py-5 shadow-xl">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-5">
              <div className="h-16 w-16 bg-white rounded-full flex items-center justify-center shadow-lg">
                <img 
                  src="/assets/odisha-emblem.png" 
                  alt="Odisha Emblem" 
                  className="h-12 w-auto"
                  onError={(e) => {
                    e.target.parentElement.innerHTML = '<span class="text-gov-blue font-bold text-xl">OD</span>';
                  }}
                />
              </div>
              
              <div className="flex flex-col">
                <span className={`text-sm opacity-90 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('govt')}
                </span>
                <span className={`text-xl font-bold tracking-wide ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('appName')}
                </span>
              </div>
            </div>

            <div className="hidden md:flex flex-col items-center">
              <div className="relative">
                <div className="absolute -inset-1 bg-gradient-to-r from-gov-saffron via-white to-gov-green rounded-full opacity-70"></div>
                <div className="relative h-20 w-20 rounded-full border-3 border-white shadow-xl bg-white flex items-center justify-center overflow-hidden">
                  <img 
                    src="/assets/cm-placeholder.svg" 
                    alt={t('cmName')}
                    className="h-full w-full object-cover"
                    onError={(e) => {
                      e.target.style.display = 'none';
                      e.target.parentElement.innerHTML = '<div class="flex items-center justify-center h-full w-full bg-gray-100"><svg class="w-12 h-12 text-gray-400" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd" /></svg></div>';
                    }}
                  />
                </div>
              </div>
              <span className={`text-sm font-semibold mt-2 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('cmName')}
              </span>
            </div>

            <button
              onClick={toggleLanguage}
              className="flex items-center gap-2 px-5 py-2.5 bg-white/15 hover:bg-white/25 rounded-xl transition-all border border-white/20 backdrop-blur-sm"
            >
              <Globe size={18} />
              <span className={`font-medium ${language === 'or' ? 'font-odia' : ''}`}>
                {language === 'en' ? 'ଓଡ଼ିଆ' : 'English'}
              </span>
            </button>
          </div>
        </div>
      </header>

      <main className="flex-1 container mx-auto px-4 py-10">
        <Outlet />
      </main>

      <footer className="footer-gradient text-white py-5">
        <div className="container mx-auto px-4 text-center">
          <p className={`text-sm opacity-90 ${language === 'or' ? 'font-odia' : ''}`}>
            © {new Date().getFullYear()} {t('department')}, {t('govt')}
          </p>
        </div>
      </footer>
      
      <Toaster 
        position="top-right" 
        toastOptions={{
          style: {
            borderRadius: '12px',
            padding: '16px',
            boxShadow: '0 10px 40px rgba(0,0,0,0.15)',
          },
          success: {
            iconTheme: {
              primary: '#138808',
              secondary: '#fff',
            },
          },
          error: {
            iconTheme: {
              primary: '#dc2626',
              secondary: '#fff',
            },
          },
        }}
      />
    </div>
  );
};

export default AuthLayout;
