import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { Eye, CheckCircle, XCircle, Clock, Search, FileText } from 'lucide-react';
import toast from 'react-hot-toast';
import { Modal } from '../../components/ui';
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

  const formatDate = (dateString) => new Date(dateString).toLocaleDateString(language === 'or' ? 'or-IN' : 'en-IN', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
  });

  const getStatusIcon = (status) => {
    switch (status) {
      case 'approved':
      case 'sanctioned':
      case 'disbursed':
        return <CheckCircle className="text-green-600" size={16} />;
      case 'rejected':
        return <XCircle className="text-red-600" size={16} />;
      default:
        return <Clock className="text-amber-600" size={16} />;
    }
  };

  const getStatusBadge = (status) => {
    const config = {
      submitted: 'badge-info',
      gmdic_approved: 'badge-info',
      di_approved: 'badge-info',
      sanctioned: 'badge-success',
      disbursed: 'badge-success',
      rejected: 'badge-danger',
    };
    return config[status] || 'badge-warning';
  };

  const filteredClaims = claims.filter(claim =>
    claim.festival?.name?.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div className="space-y-6">
      <div className="page-header">
        <h1 className={`page-title ${language === 'or' ? 'font-odia' : ''}`}>
          {t('claims:viewSubmittedClaims')}
        </h1>
        <p className={`page-subtitle ${language === 'or' ? 'font-odia' : ''}`}>
          {t('claims:submittedClaimsDesc', { defaultValue: 'Track your claim status and approval history' })}
        </p>
      </div>

      <div className="dashboard-card">
        <div className="dashboard-card-header">
          <div className="dashboard-card-title">
            <FileText size={20} className="text-gov-navy" />
            <span className={language === 'or' ? 'font-odia' : ''}>
              {t('claims:allClaims', { defaultValue: 'All Claims' })}
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
          ) : filteredClaims.length === 0 ? (
            <div className="empty-state">
              <div className="empty-state-icon">
                <FileText size={28} />
              </div>
              <p className={`empty-state-title ${language === 'or' ? 'font-odia' : ''}`}>
                {t('claims:noClaimsFound', { defaultValue: 'No Claims Found' })}
              </p>
              <p className={`empty-state-text ${language === 'or' ? 'font-odia' : ''}`}>
                {t('claims:noClaimsDesc', { defaultValue: 'You have not submitted any claims yet.' })}
              </p>
            </div>
          ) : (
            <table className="data-table">
              <thead>
                <tr>
                  <th>{t('common:serialNo')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('dashboard:festival')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('claims:totalSale')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('claims:totalRebate')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('common:date')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('common:status')}</th>
                  <th className={language === 'or' ? 'font-odia' : ''}>{t('common:actions')}</th>
                </tr>
              </thead>
              <tbody>
                {filteredClaims.map((claim, index) => (
                  <tr key={claim._id}>
                    <td className="font-medium">{index + 1}</td>
                    <td className="font-semibold text-gray-900">{claim.festival?.name || '-'}</td>
                    <td className="font-semibold text-gov-navy">₹{claim.totalSaleAmount?.toLocaleString() || 0}</td>
                    <td className="font-semibold text-gov-green">₹{claim.totalRebateAmount?.toLocaleString() || 0}</td>
                    <td className="text-gray-500">{formatDate(claim.submittedAt || claim.createdAt)}</td>
                    <td>
                      <div className="flex items-center gap-2">
                        {getStatusIcon(claim.status)}
                        <span className={`badge ${getStatusBadge(claim.status)}`}>
                          {claim.status?.replace('_', ' ') || 'pending'}
                        </span>
                      </div>
                    </td>
                    <td>
                      <button
                        onClick={() => { setSelectedClaim(claim); setShowModal(true); }}
                        className="p-2 text-gov-navy hover:bg-gov-navy/10 rounded-lg transition-colors"
                        title="View Details"
                      >
                        <Eye size={18} />
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      </div>

      <Modal isOpen={showModal} onClose={() => setShowModal(false)} title={t('claims:viewClaimDetails')} size="lg">
        {selectedClaim && (
          <div className="space-y-6">
            <div className="grid grid-cols-2 gap-4">
              <div className="p-4 bg-gray-50 rounded-xl">
                <p className={`text-sm text-gray-500 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>{t('dashboard:festival')}</p>
                <p className="font-semibold text-gray-900">{selectedClaim.festival?.name}</p>
              </div>
              <div className="p-4 bg-gray-50 rounded-xl">
                <p className={`text-sm text-gray-500 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>{t('common:status')}</p>
                <span className={`badge ${getStatusBadge(selectedClaim.status)}`}>
                  {selectedClaim.status?.replace('_', ' ')}
                </span>
              </div>
              <div className="p-4 bg-blue-50 rounded-xl">
                <p className={`text-sm text-blue-600 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:totalSale')}</p>
                <p className="font-bold text-xl text-gov-navy">₹{selectedClaim.totalSaleAmount?.toLocaleString()}</p>
              </div>
              <div className="p-4 bg-green-50 rounded-xl">
                <p className={`text-sm text-green-600 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:totalRebate')}</p>
                <p className="font-bold text-xl text-gov-green">₹{selectedClaim.totalRebateAmount?.toLocaleString()}</p>
              </div>
            </div>

            <div>
              <h4 className={`font-semibold text-gray-900 mb-4 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('claims:claimApprovalHistory')}
              </h4>
              <div className="space-y-3">
                {[
                  { key: 'gmdic', label: 'GMDIC Review' },
                  { key: 'di', label: 'DI Review' },
                  { key: 'addlDirector', label: 'Addl. Director Review' }
                ].map(({ key, label }) => {
                  const approval = selectedClaim.approvals?.[key];
                  const isApproved = approval?.approved;
                  const isRejected = approval?.rejected;
                  const isPending = !isApproved && !isRejected;
                  
                  return (
                    <div key={key} className={`flex items-center gap-4 p-4 rounded-xl border ${
                      isApproved ? 'bg-green-50 border-green-200' :
                      isRejected ? 'bg-red-50 border-red-200' :
                      'bg-gray-50 border-gray-200'
                    }`}>
                      <div className={`w-10 h-10 rounded-full flex items-center justify-center ${
                        isApproved ? 'bg-green-100' : isRejected ? 'bg-red-100' : 'bg-gray-200'
                      }`}>
                        {isApproved ? <CheckCircle className="text-green-600" size={20} /> :
                         isRejected ? <XCircle className="text-red-600" size={20} /> :
                         <Clock className="text-gray-400" size={20} />}
                      </div>
                      <div className="flex-1">
                        <p className={`font-semibold ${
                          isApproved ? 'text-green-800' : isRejected ? 'text-red-800' : 'text-gray-600'
                        } ${language === 'or' ? 'font-odia' : ''}`}>
                          {label}
                        </p>
                        <p className="text-sm text-gray-500">
                          {isApproved ? `Approved on ${formatDate(approval.approvedAt)}` :
                           isRejected ? `Rejected on ${formatDate(approval.rejectedAt)}` :
                           'Pending review'}
                        </p>
                      </div>
                    </div>
                  );
                })}
              </div>
            </div>

            {selectedClaim.sanctionAmount && (
              <div className="p-6 bg-gradient-to-r from-green-50 to-emerald-50 rounded-xl border border-green-200">
                <p className={`text-sm text-green-700 mb-1 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('claims:sanctionAmount')}
                </p>
                <p className="text-3xl font-bold text-green-800">₹{selectedClaim.sanctionAmount?.toLocaleString()}</p>
              </div>
            )}
          </div>
        )}
      </Modal>
    </div>
  );
};

export default SubmittedClaims;
