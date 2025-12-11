import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { Eye, Trash2, Search, Package, Calendar, X } from 'lucide-react';
import toast from 'react-hot-toast';
import { Button, Modal } from '../../components/ui';
import { stockApi } from '../../services/api';
import useLanguageStore from '../../store/languageStore';

const OpeningStockList = () => {
  const { t } = useTranslation(['stock', 'common']);
  const { language } = useLanguageStore();
  
  const [loading, setLoading] = useState(true);
  const [stocks, setStocks] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedStock, setSelectedStock] = useState(null);
  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    fetchStocks();
  }, []);

  const fetchStocks = async () => {
    setLoading(true);
    try {
      const response = await stockApi.getOpeningStocks();
      setStocks(response.data.openingStocks || []);
    } catch (error) {
      toast.error('Failed to fetch stocks');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (id) => {
    if (!window.confirm('Are you sure you want to delete this stock entry?')) return;
    
    try {
      await stockApi.deleteOpeningStock(id);
      toast.success(t('stock:stockDeleted'));
      fetchStocks();
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to delete stock');
    }
  };

  const handleView = (stock) => {
    setSelectedStock(stock);
    setShowModal(true);
  };

  const formatDate = (dateString) => {
    return new Date(dateString).toLocaleDateString(language === 'or' ? 'or-IN' : 'en-IN', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
    });
  };

  const getStatusBadge = (status) => {
    const statusConfig = {
      pending: 'badge-warning',
      approved: 'badge-success',
      rejected: 'badge-danger',
    };
    return statusConfig[status] || 'badge-neutral';
  };

  const filteredStocks = stocks.filter(stock =>
    stock.festival?.name?.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div className="space-y-6">
      <div className="page-header">
        <h1 className={`page-title ${language === 'or' ? 'font-odia' : ''}`}>
          {t('stock:openingStockList')}
        </h1>
        <p className={`page-subtitle ${language === 'or' ? 'font-odia' : ''}`}>
          {t('stock:openingStockListDesc', { defaultValue: 'View and manage your submitted opening stock entries' })}
        </p>
      </div>

      <div className="dashboard-card">
        <div className="dashboard-card-header">
          <div className="dashboard-card-title">
            <Package size={20} className="text-gov-navy" />
            <span className={language === 'or' ? 'font-odia' : ''}>
              {t('stock:stockEntries', { defaultValue: 'Stock Entries' })}
            </span>
          </div>
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={18} />
            <input
              type="text"
              placeholder={t('common:search')}
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="input-field pl-10 w-64"
            />
          </div>
        </div>
        <div className="p-0">
          {loading ? (
            <div className="flex items-center justify-center py-16">
              <div className="animate-spin rounded-full h-8 w-8 border-2 border-gov-navy border-t-transparent"></div>
            </div>
          ) : filteredStocks.length === 0 ? (
            <div className="empty-state">
              <div className="empty-state-icon">
                <Package size={28} />
              </div>
              <p className={`empty-state-title ${language === 'or' ? 'font-odia' : ''}`}>
                {t('stock:noStockEntries')}
              </p>
              <p className={`empty-state-text ${language === 'or' ? 'font-odia' : ''}`}>
                {t('stock:noStockEntriesDesc', { defaultValue: 'No stock entries found. Start by adding a new entry.' })}
              </p>
            </div>
          ) : (
            <table className="data-table">
              <thead>
                <tr>
                  <th>{t('common:serialNo')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('stock:festivalName')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('stock:spellStartDate')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('stock:totalAmount')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('stock:submittedOn')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('common:status')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('common:actions')}</th>
                </tr>
              </thead>
              <tbody>
                {filteredStocks.map((stock, index) => (
                  <tr key={stock._id}>
                    <td className="font-medium">{index + 1}</td>
                    <td className="font-semibold text-gray-900">{stock.festival?.name || '-'}</td>
                    <td>{formatDate(stock.festival?.spellStartDate)}</td>
                    <td className="font-semibold text-gov-navy">₹{stock.totalAmount?.toLocaleString() || 0}</td>
                    <td className="text-gray-500">{formatDate(stock.createdAt)}</td>
                    <td>
                      <span className={`badge ${getStatusBadge(stock.status)}`}>
                        {t(`common:${stock.status || 'pending'}`)}
                      </span>
                    </td>
                    <td>
                      <div className="flex items-center gap-2">
                        <button
                          onClick={() => handleView(stock)}
                          className="p-2 text-gov-navy hover:bg-gov-navy/10 rounded-lg transition-colors"
                          title="View Details"
                        >
                          <Eye size={18} />
                        </button>
                        {stock.status === 'pending' && (
                          <button
                            onClick={() => handleDelete(stock._id)}
                            className="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-colors"
                            title="Delete"
                          >
                            <Trash2 size={18} />
                          </button>
                        )}
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      </div>

      <Modal
        isOpen={showModal}
        onClose={() => setShowModal(false)}
        title={t('stock:viewStock')}
        size="lg"
      >
        {selectedStock && (
          <div className="space-y-6">
            <div className="grid grid-cols-2 gap-6">
              <div className="p-4 bg-gray-50 rounded-xl">
                <p className={`text-sm text-gray-500 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('stock:festivalName')}
                </p>
                <p className="font-semibold text-gray-900">{selectedStock.festival?.name}</p>
              </div>
              <div className="p-4 bg-gray-50 rounded-xl">
                <p className={`text-sm text-gray-500 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('stock:submittedOn')}
                </p>
                <p className="font-semibold text-gray-900">{formatDate(selectedStock.createdAt)}</p>
              </div>
              <div className="p-4 bg-gray-50 rounded-xl">
                <p className={`text-sm text-gray-500 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('stock:approvalStatus')}
                </p>
                <span className={`badge ${getStatusBadge(selectedStock.status)}`}>
                  {selectedStock.status || 'pending'}
                </span>
              </div>
              {selectedStock.approvedBy && (
                <div className="p-4 bg-gray-50 rounded-xl">
                  <p className={`text-sm text-gray-500 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('stock:approvedBy')}
                  </p>
                  <p className="font-semibold text-gray-900">{selectedStock.approvedBy.name}</p>
                </div>
              )}
            </div>

            <div>
              <h4 className={`font-semibold text-gray-900 mb-4 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('stock:stockItems', { defaultValue: 'Stock Items' })}
              </h4>
              <table className="data-table">
                <thead>
                  <tr>
                    <th className={language === 'or' ? 'font-odia' : ''}>{t('stock:headType')}</th>
                    <th className={language === 'or' ? 'font-odia' : ''}>{t('stock:subHead')}</th>
                    <th className={language === 'or' ? 'font-odia' : ''}>{t('stock:quantity')}</th>
                    <th className={language === 'or' ? 'font-odia' : ''}>{t('stock:rate')}</th>
                    <th className={language === 'or' ? 'font-odia' : ''}>{t('stock:amount')}</th>
                  </tr>
                </thead>
                <tbody>
                  {selectedStock.items?.map((item, index) => (
                    <tr key={index}>
                      <td>{item.headType?.name || item.headType}</td>
                      <td>{item.subHead}</td>
                      <td>{item.quantity}</td>
                      <td>₹{item.rate}</td>
                      <td className="font-semibold">₹{item.amount}</td>
                    </tr>
                  ))}
                </tbody>
                <tfoot>
                  <tr className="bg-gov-navy/5">
                    <td colSpan="4" className={`text-right font-semibold ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('stock:totalAmount')}:
                    </td>
                    <td className="font-bold text-gov-navy text-lg">
                      ₹{selectedStock.totalAmount?.toLocaleString()}
                    </td>
                  </tr>
                </tfoot>
              </table>
            </div>

            {selectedStock.rejectionReason && (
              <div className="p-4 bg-red-50 rounded-xl border border-red-100">
                <p className={`text-sm font-semibold text-red-800 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('stock:rejectionReason')}:
                </p>
                <p className="text-red-700">{selectedStock.rejectionReason}</p>
              </div>
            )}
          </div>
        )}
      </Modal>
    </div>
  );
};

export default OpeningStockList;
