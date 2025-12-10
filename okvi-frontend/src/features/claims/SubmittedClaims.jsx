import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { Eye, CheckCircle, XCircle, Clock, Search } from 'lucide-react';
import toast from 'react-hot-toast';
import { Card, Table, Modal } from '../../components/ui';
import { claimsApi } from '../../services/api';
import useLanguageStore from '../../store/languageStore';

const SubmittedClaims = () => {
  const { t } = useTranslation(['claims', 'common', 'dashboard']);
  const { language } = useLanguageStore();
  
  const [loading, setLoading] = useState(true);
  const [claims, setClaims] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedClaim, setSelectedClaim] = useState(null);
  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    fetchClaims();
  }, []);

  const fetchClaims = async () => {
    setLoading(true);
    try {
      const response = await claimsApi.getClaimData({});
      setClaims(response.data.claims || []);
    } catch (error) {
      toast.error('Failed to fetch claims');
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateString) => new Date(dateString).toLocaleDateString(language === 'or' ? 'or-IN' : 'en-IN');

  const getStatusIcon = (status) => {
    switch (status) {
      case 'approved':
      case 'sanctioned':
      case 'disbursed':
        return <CheckCircle className="text-green-600" size={16} />;
      case 'rejected':
        return <XCircle className="text-red-600" size={16} />;
      default:
        return <Clock className="text-yellow-600" size={16} />;
    }
  };

  const getStatusBadge = (status) => {
    const config = {
      submitted: 'bg-blue-100 text-blue-800',
      gmdic_approved: 'bg-indigo-100 text-indigo-800',
      di_approved: 'bg-purple-100 text-purple-800',
      sanctioned: 'bg-green-100 text-green-800',
      disbursed: 'bg-emerald-100 text-emerald-800',
      rejected: 'bg-red-100 text-red-800',
    };
    return config[status] || 'bg-gray-100 text-gray-800';
  };

  const filteredClaims = claims.filter(claim =>
    claim.festival?.name?.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const columns = [
    { header: t('common:serialNo'), render: (_, i) => i + 1 },
    { header: t('dashboard:festival'), render: (row) => row.festival?.name || '-' },
    { header: t('claims:totalSale'), render: (row) => `₹${row.totalSaleAmount?.toLocaleString() || 0}` },
    { header: t('claims:totalRebate'), render: (row) => `₹${row.totalRebateAmount?.toLocaleString() || 0}` },
    { header: t('common:date'), render: (row) => formatDate(row.submittedAt || row.createdAt) },
    {
      header: t('common:status'),
      render: (row) => (
        <div className="flex items-center gap-2">
          {getStatusIcon(row.status)}
          <span className={`px-2 py-1 text-xs rounded-full ${getStatusBadge(row.status)}`}>
            {row.status?.replace('_', ' ') || 'pending'}
          </span>
        </div>
      ),
    },
    {
      header: t('common:actions'),
      render: (row) => (
        <button
          onClick={() => { setSelectedClaim(row); setShowModal(true); }}
          className="p-2 text-gov-blue hover:bg-gray-100 rounded-lg"
        >
          <Eye size={18} />
        </button>
      ),
    },
  ];

  return (
    <div className="space-y-6">
      <h1 className={`text-2xl font-bold text-gray-900 ${language === 'or' ? 'font-odia' : ''}`}>
        {t('claims:viewSubmittedClaims')}
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

        <Table columns={columns} data={filteredClaims} loading={loading} />
      </Card>

      <Modal isOpen={showModal} onClose={() => setShowModal(false)} title={t('claims:viewClaimDetails')} size="lg">
        {selectedClaim && (
          <div className="space-y-6">
            <div className="grid grid-cols-2 gap-4">
              <div>
                <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('dashboard:festival')}</p>
                <p className="font-medium">{selectedClaim.festival?.name}</p>
              </div>
              <div>
                <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('common:status')}</p>
                <span className={`px-2 py-1 text-xs rounded-full ${getStatusBadge(selectedClaim.status)}`}>
                  {selectedClaim.status?.replace('_', ' ')}
                </span>
              </div>
              <div>
                <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:totalSale')}</p>
                <p className="font-medium text-gov-blue">₹{selectedClaim.totalSaleAmount?.toLocaleString()}</p>
              </div>
              <div>
                <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:totalRebate')}</p>
                <p className="font-medium text-green-600">₹{selectedClaim.totalRebateAmount?.toLocaleString()}</p>
              </div>
            </div>

            <div>
              <h4 className={`font-medium mb-3 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:claimApprovalHistory')}</h4>
              <div className="space-y-3">
                {['gmdic', 'di', 'addlDirector'].map((level, index) => {
                  const approval = selectedClaim.approvals?.[level];
                  return (
                    <div key={level} className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg">
                      <div className={`w-8 h-8 rounded-full flex items-center justify-center ${
                        approval?.approved ? 'bg-green-100' : approval?.rejected ? 'bg-red-100' : 'bg-gray-200'
                      }`}>
                        {approval?.approved ? <CheckCircle className="text-green-600" size={16} /> :
                         approval?.rejected ? <XCircle className="text-red-600" size={16} /> :
                         <Clock className="text-gray-400" size={16} />}
                      </div>
                      <div className="flex-1">
                        <p className={`font-medium ${language === 'or' ? 'font-odia' : ''}`}>
                          {t(`claims:${level}Approval`)}
                        </p>
                        {approval?.approvedAt && (
                          <p className="text-sm text-gray-500">{formatDate(approval.approvedAt)}</p>
                        )}
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>

            {selectedClaim.sanctionAmount && (
              <div className="p-4 bg-green-50 rounded-lg">
                <p className={`text-sm text-green-700 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:sanctionAmount')}</p>
                <p className="text-2xl font-bold text-green-800">₹{selectedClaim.sanctionAmount?.toLocaleString()}</p>
              </div>
            )}
          </div>
        )}
      </Modal>
    </div>
  );
};

export default SubmittedClaims;
