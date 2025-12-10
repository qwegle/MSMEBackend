import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

import enCommon from './locales/en/common.json';
import enAuth from './locales/en/auth.json';
import enDashboard from './locales/en/dashboard.json';
import enStock from './locales/en/stock.json';
import enClaims from './locales/en/claims.json';
import enSanction from './locales/en/sanction.json';

import orCommon from './locales/or/common.json';
import orAuth from './locales/or/auth.json';
import orDashboard from './locales/or/dashboard.json';
import orStock from './locales/or/stock.json';
import orClaims from './locales/or/claims.json';
import orSanction from './locales/or/sanction.json';

const resources = {
  en: {
    common: enCommon,
    auth: enAuth,
    dashboard: enDashboard,
    stock: enStock,
    claims: enClaims,
    sanction: enSanction,
  },
  or: {
    common: orCommon,
    auth: orAuth,
    dashboard: orDashboard,
    stock: orStock,
    claims: orClaims,
    sanction: orSanction,
  },
};

const savedLanguage = localStorage.getItem('language') || 'en';

i18n
  .use(initReactI18next)
  .init({
    resources,
    lng: savedLanguage,
    fallbackLng: 'en',
    defaultNS: 'common',
    ns: ['common', 'auth', 'dashboard', 'stock', 'claims', 'sanction'],
    interpolation: {
      escapeValue: false,
    },
  });

export default i18n;
