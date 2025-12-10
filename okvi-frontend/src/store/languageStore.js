import { create } from 'zustand';
import { persist } from 'zustand/middleware';
import i18n from '../i18n';

const useLanguageStore = create(
  persist(
    (set) => ({
      language: 'en',
      
      setLanguage: (lang) => {
        i18n.changeLanguage(lang);
        localStorage.setItem('language', lang);
        set({ language: lang });
      },
      
      toggleLanguage: () => {
        const newLang = i18n.language === 'en' ? 'or' : 'en';
        i18n.changeLanguage(newLang);
        localStorage.setItem('language', newLang);
        set({ language: newLang });
      },
    }),
    {
      name: 'language-storage',
    }
  )
);

export default useLanguageStore;
