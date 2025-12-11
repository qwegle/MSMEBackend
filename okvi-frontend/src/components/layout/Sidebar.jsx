import { NavLink } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import useLanguageStore from '../../store/languageStore';
import {
  LayoutDashboard,
  Package,
  FileText,
  Upload,
  Key,
  ChevronDown,
  ChevronRight,
  PackageOpen,
  PackageCheck,
  FilePlus,
  FileSearch,
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
    `sidebar-link ${isActive ? 'active' : ''} ${language === 'or' ? 'font-odia' : ''}`;

  const subLinkClass = ({ isActive }) =>
    `sidebar-submenu-link ${isActive ? 'active' : ''} ${language === 'or' ? 'font-odia' : ''}`;

  return (
    <aside className="sidebar">
      <nav className="sidebar-nav">
        <NavLink to="/dashboard" className={linkClass}>
          <LayoutDashboard size={20} className="sidebar-icon" />
          <span>{t('common:dashboard')}</span>
        </NavLink>

        <div>
          <button
            onClick={() => toggleMenu('stock')}
            className={`sidebar-link w-full justify-between ${language === 'or' ? 'font-odia' : ''}`}
          >
            <div className="flex items-center gap-3">
              <Package size={20} className="sidebar-icon" />
              <span>{t('stock:stockManagement', { defaultValue: 'Stock Management' })}</span>
            </div>
            {openMenus.stock ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
          </button>
          {openMenus.stock && (
            <div className="sidebar-submenu">
              <NavLink to="/opening-stock/entry" className={subLinkClass}>
                <PackageOpen size={16} />
                {t('stock:openingStockEntry')}
              </NavLink>
              <NavLink to="/opening-stock/list" className={subLinkClass}>
                <FileSearch size={16} />
                {t('stock:openingStockList')}
              </NavLink>
              <NavLink to="/closing-stock/entry" className={subLinkClass}>
                <PackageCheck size={16} />
                {t('stock:closingStockEntry')}
              </NavLink>
              <NavLink to="/closing-stock/list" className={subLinkClass}>
                <FileSearch size={16} />
                {t('stock:closingStockList')}
              </NavLink>
            </div>
          )}
        </div>

        <div>
          <button
            onClick={() => toggleMenu('claims')}
            className={`sidebar-link w-full justify-between ${language === 'or' ? 'font-odia' : ''}`}
          >
            <div className="flex items-center gap-3">
              <FileText size={20} className="sidebar-icon" />
              <span>{t('claims:claimDocuments')}</span>
            </div>
            {openMenus.claims ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
          </button>
          {openMenus.claims && (
            <div className="sidebar-submenu">
              <NavLink to="/claims/entry" className={subLinkClass}>
                <FilePlus size={16} />
                {t('claims:claimDocumentEntry')}
              </NavLink>
              <NavLink to="/claims/submitted" className={subLinkClass}>
                <FileSearch size={16} />
                {t('claims:viewSubmittedClaims')}
              </NavLink>
            </div>
          )}
        </div>

        <NavLink to="/sanction-order" className={linkClass}>
          <Upload size={20} className="sidebar-icon" />
          <span>{t('sanction:uploadSanctionOrder')}</span>
        </NavLink>

        <div className="mt-auto pt-4 border-t border-gray-100">
          <NavLink to="/change-password" className={linkClass}>
            <Key size={20} className="sidebar-icon" />
            <span>{t('common:changePassword')}</span>
          </NavLink>
        </div>
      </nav>
    </aside>
  );
};

export default Sidebar;
