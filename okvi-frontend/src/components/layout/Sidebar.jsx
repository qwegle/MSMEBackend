import { NavLink } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import useLanguageStore from '../../store/languageStore';
import {
  LayoutDashboard,
  Package,
  PackageCheck,
  FileText,
  FileCheck,
  Upload,
  Key,
  ChevronDown,
  ChevronRight,
} from 'lucide-react';
import { useState } from 'react';

const Sidebar = () => {
  const { t } = useTranslation(['common', 'stock', 'claims', 'sanction']);
  const { language } = useLanguageStore();
  const [openMenus, setOpenMenus] = useState({ stock: false, claims: false });

  const toggleMenu = (menu) => {
    setOpenMenus((prev) => ({ ...prev, [menu]: !prev[menu] }));
  };

  const linkClass = ({ isActive }) =>
    `flex items-center gap-3 px-4 py-3 rounded-lg transition-colors ${
      isActive
        ? 'bg-gov-blue text-white'
        : 'text-gray-700 hover:bg-gray-100'
    } ${language === 'or' ? 'font-odia' : ''}`;

  const subLinkClass = ({ isActive }) =>
    `flex items-center gap-3 px-4 py-2 pl-12 rounded-lg transition-colors text-sm ${
      isActive
        ? 'bg-gov-blue/10 text-gov-blue font-medium'
        : 'text-gray-600 hover:bg-gray-50'
    } ${language === 'or' ? 'font-odia' : ''}`;

  return (
    <aside className="w-64 bg-white shadow-md min-h-screen">
      <nav className="p-4 space-y-2">
        <NavLink to="/dashboard" className={linkClass}>
          <LayoutDashboard size={20} />
          <span>{t('common:dashboard')}</span>
        </NavLink>

        <div>
          <button
            onClick={() => toggleMenu('stock')}
            className={`w-full flex items-center justify-between gap-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-100 transition-colors ${
              language === 'or' ? 'font-odia' : ''
            }`}
          >
            <div className="flex items-center gap-3">
              <Package size={20} />
              <span>{t('stock:openingStock')}</span>
            </div>
            {openMenus.stock ? <ChevronDown size={18} /> : <ChevronRight size={18} />}
          </button>
          {openMenus.stock && (
            <div className="mt-1 space-y-1">
              <NavLink to="/opening-stock/entry" className={subLinkClass}>
                {t('stock:openingStockEntry')}
              </NavLink>
              <NavLink to="/opening-stock/list" className={subLinkClass}>
                {t('stock:openingStockList')}
              </NavLink>
              <NavLink to="/closing-stock/entry" className={subLinkClass}>
                {t('stock:closingStockEntry')}
              </NavLink>
              <NavLink to="/closing-stock/list" className={subLinkClass}>
                {t('stock:closingStockList')}
              </NavLink>
            </div>
          )}
        </div>

        <div>
          <button
            onClick={() => toggleMenu('claims')}
            className={`w-full flex items-center justify-between gap-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-100 transition-colors ${
              language === 'or' ? 'font-odia' : ''
            }`}
          >
            <div className="flex items-center gap-3">
              <FileText size={20} />
              <span>{t('claims:claimDocuments')}</span>
            </div>
            {openMenus.claims ? <ChevronDown size={18} /> : <ChevronRight size={18} />}
          </button>
          {openMenus.claims && (
            <div className="mt-1 space-y-1">
              <NavLink to="/claims/entry" className={subLinkClass}>
                {t('claims:claimDocumentEntry')}
              </NavLink>
              <NavLink to="/claims/submitted" className={subLinkClass}>
                {t('claims:viewSubmittedClaims')}
              </NavLink>
            </div>
          )}
        </div>

        <NavLink to="/sanction-order" className={linkClass}>
          <Upload size={20} />
          <span>{t('sanction:uploadSanctionOrder')}</span>
        </NavLink>

        <NavLink to="/change-password" className={linkClass}>
          <Key size={20} />
          <span>{t('common:changePassword')}</span>
        </NavLink>
      </nav>
    </aside>
  );
};

export default Sidebar;
