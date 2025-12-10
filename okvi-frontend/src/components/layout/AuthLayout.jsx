import { Outlet } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import useLanguageStore from '../../store/languageStore';
import { Globe } from 'lucide-react';
import { Toaster } from 'react-hot-toast';

const AuthLayout = () => {
  const { t } = useTranslation('common');
  const { language, toggleLanguage } = useLanguageStore();

  return (
    <div className="min-h-screen flex flex-col">
      <div className="tricolor-bar"></div>
      
      <header className="gov-header">
        <div className="gov-header-inner">
          <div className="gov-brand">
            <div className="gov-emblem">
              <span style={{ color: '#0B2F4A', fontWeight: 700, fontSize: '20px' }}>OD</span>
            </div>
            <div className="gov-titles">
              <span className={`gov-dept ${language === 'or' ? 'font-odia' : ''}`}>
                {t('govt')}
              </span>
              <span className={`gov-app-name ${language === 'or' ? 'font-odia' : ''}`}>
                {t('appName')}
              </span>
            </div>
          </div>

          <div className="cm-card">
            <div className="cm-photo">
              <svg width="32" height="32" viewBox="0 0 24 24" fill="#9e9e9e">
                <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
              </svg>
            </div>
            <div className="cm-info">
              <div className={`cm-name ${language === 'or' ? 'font-odia' : ''}`}>
                {t('cmName')}
              </div>
              <div className="cm-title">Hon'ble Chief Minister</div>
            </div>
          </div>

          <button onClick={toggleLanguage} className="lang-toggle">
            <Globe size={15} />
            <span className={language === 'or' ? 'font-odia' : ''}>
              {language === 'en' ? 'ଓଡ଼ିଆ' : 'English'}
            </span>
          </button>
        </div>
      </header>

      <main className="flex-1 auth-page">
        <Outlet />
      </main>

      <footer className="gov-footer">
        <p className={language === 'or' ? 'font-odia' : ''}>
          © {new Date().getFullYear()} {t('department')}, {t('govt')}
        </p>
      </footer>
      
      <Toaster position="top-right" />
    </div>
  );
};

export default AuthLayout;
