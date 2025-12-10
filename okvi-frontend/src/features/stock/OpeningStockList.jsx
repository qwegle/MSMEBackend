import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { Eye, Trash2, Search } from 'lucide-react';
import toast from 'react-hot-toast';
import { Card, Button, Input, Table, Modal } from '../../components/ui';
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
    return new Date(dateString).toLocaleDateString(language === 'or' ? 'or-IN' : 'en-IN');
  };

  const getStatusBadge = (status) => {
    const statusConfig = {
      pending: { bg: 'bg-yellow-100', text: 'text-yellow-800' },
      approved: { bg: 'bg-green-100', text: 'text-green-800' },
      rejected: { bg: 'bg-red-100', text: 'text-red-800' },
    };
    const config = statusConfig[status] || statusConfig.pending;
    return `${config.bg} ${config.text}`;
  };

  const filteredStocks = stocks.filter(stock =>
    stock.festival?.name?.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const columns = [
    {
      header: t('common:serialNo'),
      render: (_, index) => index + 1,
    },
    {
      header: t('stock:festivalName'),
      accessor: 'festival.name',
      render: (row) => row.festival?.name || '-',
    },
    {
      header: t('stock:spellStartDate'),
      render: (row) => formatDate(row.festival?.spellStartDate),
    },
    {
      header: t('stock:totalAmount'),
      render: (row) => `₹${row.totalAmount?.toLocaleString() || 0}`,
    },
    {
      header: t('stock:submittedOn'),
      render: (row) => formatDate(row.createdAt),
    },
    {
      header: t('common:status'),
      render: (row) => (
        <span className={`px-2 py-1 text-xs rounded-full ${getStatusBadge(row.status)}`}>
          {t(`common:${row.status || 'pending'}`)}
        </span>
      ),
    },
    {
      header: t('common:actions'),
      render: (row) => (
        <div className="flex items-center gap-2">
          <button
            onClick={() => handleView(row)}
            className="p-2 text-gov-blue hover:bg-gray-100 rounded-lg"
          >
            <Eye size={18} />
          </button>
          {row.status === 'pending' && (
            <button
              onClick={() => handleDelete(row._id)}
              className="p-2 text-red-500 hover:bg-red-50 rounded-lg"
            >
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
        {t('stock:openingStockList')}
      </h1>

      <Card>
        <div className="flex items-center gap-4 mb-6">
          <div className="relative flex-1 max-w-md">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
            <input
              type="text"
              placeholder={t('common:search')}
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="input-field pl-10"
            />
          </div>
        </div>

        <Table
          columns={columns}
          data={filteredStocks}
          loading={loading}
          emptyMessage={t('stock:noStockEntries')}
        />
      </Card>

      <Modal
        isOpen={showModal}
        onClose={() => setShowModal(false)}
        title={t('stock:viewStock')}
        size="lg"
      >
        {selectedStock && (
          <div className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <div>
                <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('stock:festivalName')}
                </p>
                <p className="font-medium">{selectedStock.festival?.name}</p>
              </div>
              <div>
                <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('stock:submittedOn')}
                </p>
                <p className="font-medium">{formatDate(selectedStock.createdAt)}</p>
              </div>
              <div>
                <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('stock:approvalStatus')}
                </p>
                <span className={`px-2 py-1 text-xs rounded-full ${getStatusBadge(selectedStock.status)}`}>
                  {selectedStock.status || 'pending'}
                </span>
              </div>
              {selectedStock.approvedBy && (
                <div>
                  <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('stock:approvedBy')}
                  </p>
                  <p className="font-medium">{selectedStock.approvedBy.name}</p>
                </div>
              )}
            </div>

            <div className="mt-4">
              <h4 className={`font-medium mb-2 ${language === 'or' ? 'font-odia' : ''}`}>
                Stock Items
              </h4>
              <table className="min-w-full divide-y divide-gray-200">
                <thead className="bg-gray-50">
                  <tr>
                    <th className="px-4 py-2 text-left text-xs font-medium text-gray-500">{t('stock:headType')}</th>
                    <th className="px-4 py-2 text-left text-xs font-medium text-gray-500">{t('stock:subHead')}</th>
                    <th className="px-4 py-2 text-left text-xs font-medium text-gray-500">{t('stock:quantity')}</th>
                    <th className="px-4 py-2 text-left text-xs font-medium text-gray-500">{t('stock:rate')}</th>
                    <th className="px-4 py-2 text-left text-xs font-medium text-gray-500">{t('stock:amount')}</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-200">
                  {selectedStock.items?.map((item, index) => (
                    <tr key={index}>
                      <td className="px-4 py-2 text-sm">{item.headType?.name || item.headType}</td>
                      <td className="px-4 py-2 text-sm">{item.subHead}</td>
                      <td className="px-4 py-2 text-sm">{item.quantity}</td>
                      <td className="px-4 py-2 text-sm">₹{item.rate}</td>
                      <td className="px-4 py-2 text-sm">₹{item.amount}</td>
                    </tr>
                  ))}
                </tbody>
                <tfoot className="bg-gray-50">
                  <tr>
                    <td colSpan="4" className="px-4 py-2 text-right font-medium">{t('stock:totalAmount')}:</td>
                    <td className="px-4 py-2 font-bold">₹{selectedStock.totalAmount?.toLocaleString()}</td>
                  </tr>
                </tfoot>
              </table>
            </div>

            {selectedStock.rejectionReason && (
              <div className="mt-4 p-4 bg-red-50 rounded-lg">
                <p className={`text-sm font-medium text-red-800 ${language === 'or' ? 'font-odia' : ''}`}>
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
