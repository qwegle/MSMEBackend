import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { Eye, Trash2, Search } from 'lucide-react';
import toast from 'react-hot-toast';
import { Card, Table, Modal } from '../../components/ui';
import { stockApi } from '../../services/api';
import useLanguageStore from '../../store/languageStore';

const ClosingStockList = () => {
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
      const response = await stockApi.getClosingStocks();
      setStocks(response.data.closingStocks || []);
    } catch (error) {
      toast.error('Failed to fetch stocks');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (id) => {
    if (!window.confirm('Are you sure?')) return;
    try {
      await stockApi.deleteClosingStock(id);
      toast.success(t('stock:stockDeleted'));
      fetchStocks();
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to delete');
    }
  };

  const formatDate = (dateString) => new Date(dateString).toLocaleDateString(language === 'or' ? 'or-IN' : 'en-IN');

  const getStatusBadge = (status) => {
    const config = {
      pending: 'bg-yellow-100 text-yellow-800',
      approved: 'bg-green-100 text-green-800',
      rejected: 'bg-red-100 text-red-800',
    };
    return config[status] || config.pending;
  };

  const filteredStocks = stocks.filter(stock =>
    stock.festival?.name?.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const columns = [
    { header: t('common:serialNo'), render: (_, i) => i + 1 },
    { header: t('stock:festivalName'), render: (row) => row.festival?.name || '-' },
    { header: t('stock:spellEndDate'), render: (row) => formatDate(row.festival?.spellEndDate) },
    { header: t('stock:totalAmount'), render: (row) => `₹${row.totalAmount?.toLocaleString() || 0}` },
    { header: t('stock:submittedOn'), render: (row) => formatDate(row.createdAt) },
    { header: t('common:status'), render: (row) => <span className={`px-2 py-1 text-xs rounded-full ${getStatusBadge(row.status)}`}>{row.status || 'pending'}</span> },
    {
      header: t('common:actions'),
      render: (row) => (
        <div className="flex items-center gap-2">
          <button onClick={() => { setSelectedStock(row); setShowModal(true); }} className="p-2 text-gov-blue hover:bg-gray-100 rounded-lg">
            <Eye size={18} />
          </button>
          {row.status === 'pending' && (
            <button onClick={() => handleDelete(row._id)} className="p-2 text-red-500 hover:bg-red-50 rounded-lg">
              <Trash2 size={18} />
            </button>
          )}
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-6">
      <h1 className={`text-2xl font-bold text-gray-900 ${language === 'or' ? 'font-odia' : ''}`}>
        {t('stock:closingStockList')}
      </h1>

      <Card>
        <div className="flex items-center gap-4 mb-6">
          <div className="relative flex-1 max-w-md">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
            <input type="text" placeholder={t('common:search')} value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} className="input-field pl-10" />
          </div>
        </div>

        <Table columns={columns} data={filteredStocks} loading={loading} emptyMessage={t('stock:noStockEntries')} />
      </Card>

      <Modal isOpen={showModal} onClose={() => setShowModal(false)} title={t('stock:viewStock')} size="lg">
        {selectedStock && (
          <div className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <div><p className="text-sm text-gray-500">{t('stock:festivalName')}</p><p className="font-medium">{selectedStock.festival?.name}</p></div>
              <div><p className="text-sm text-gray-500">{t('stock:submittedOn')}</p><p className="font-medium">{formatDate(selectedStock.createdAt)}</p></div>
            </div>
            <table className="min-w-full divide-y divide-gray-200 mt-4">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-4 py-2 text-left text-xs">{t('stock:headType')}</th>
                  <th className="px-4 py-2 text-left text-xs">{t('stock:subHead')}</th>
                  <th className="px-4 py-2 text-left text-xs">{t('stock:quantity')}</th>
                  <th className="px-4 py-2 text-left text-xs">{t('stock:rate')}</th>
                  <th className="px-4 py-2 text-left text-xs">{t('stock:amount')}</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-200">
                {selectedStock.items?.map((item, i) => (
                  <tr key={i}>
                    <td className="px-4 py-2 text-sm">{item.headType?.name || item.headType}</td>
                    <td className="px-4 py-2 text-sm">{item.subHead}</td>
                    <td className="px-4 py-2 text-sm">{item.quantity}</td>
                    <td className="px-4 py-2 text-sm">₹{item.rate}</td>
                    <td className="px-4 py-2 text-sm">₹{item.amount}</td>
                  </tr>
                ))}
              </tbody>
              <tfoot className="bg-gray-50">
                <tr><td colSpan="4" className="px-4 py-2 text-right font-medium">{t('stock:totalAmount')}:</td><td className="px-4 py-2 font-bold">₹{selectedStock.totalAmount?.toLocaleString()}</td></tr>
              </tfoot>
            </table>
          </div>
        )}
      </Modal>
    </div>
  );
};

export default ClosingStockList;
