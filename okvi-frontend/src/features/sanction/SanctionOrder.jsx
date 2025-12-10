import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { Upload, Eye, FileText, Check, Clock } from 'lucide-react';
import toast from 'react-hot-toast';
import { Card, Button, Table, Modal } from '../../components/ui';
import { claimsApi } from '../../services/api';
import useLanguageStore from '../../store/languageStore';

const SanctionOrder = () => {
  const { t } = useTranslation(['sanction', 'claims', 'common']);
  const { language } = useLanguageStore();
  
  const [loading, setLoading] = useState(true);
  const [claims, setClaims] = useState([]);
  const [selectedClaim, setSelectedClaim] = useState(null);
  const [showModal, setShowModal] = useState(false);
  const [file, setFile] = useState(null);
  const [uploading, setUploading] = useState(false);

  useEffect(() => {
    fetchSanctionedClaims();
  }, []);

  const fetchSanctionedClaims = async () => {
    setLoading(true);
    try {
      const response = await claimsApi.getClaimData({ status: 'sanctioned' });
      setClaims(response.data.claims || []);
    } catch (error) {
      console.error('Failed to fetch claims');
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateString) => new Date(dateString).toLocaleDateString(language === 'or' ? 'or-IN' : 'en-IN');

  const getStatusBadge = (status) => {
    const config = {
      sanctioned: 'bg-green-100 text-green-800',
      sanction_order_uploaded: 'bg-blue-100 text-blue-800',
      disbursed: 'bg-emerald-100 text-emerald-800',
    };
    return config[status] || 'bg-gray-100 text-gray-800';
  };

  const handleUpload = async () => {
    if (!file || !selectedClaim) return;
    
    const formData = new FormData();
    formData.append('claimId', selectedClaim._id);
    formData.append('sanctionOrderDocument', file);
    
    setUploading(true);
    try {
      await claimsApi.uploadSanctionOrder(formData);
      toast.success(t('sanction:documentsSubmitted'));
      setShowModal(false);
      setFile(null);
      fetchSanctionedClaims();
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to upload');
    } finally {
      setUploading(false);
    }
  };

  const columns = [
    { header: t('common:serialNo'), render: (_, i) => i + 1 },
    { header: t('claims:festivalName'), render: (row) => row.festival?.name || '-' },
    { header: t('sanction:sanctionedAmount'), render: (row) => `₹${row.sanctionAmount?.toLocaleString() || 0}` },
    { header: t('sanction:sanctionDate'), render: (row) => formatDate(row.sanctionedAt || row.updatedAt) },
    {
      header: t('common:status'),
      render: (row) => (
        <span className={`px-2 py-1 text-xs rounded-full ${getStatusBadge(row.status)}`}>
          {row.status?.replace(/_/g, ' ')}
        </span>
      ),
    },
    {
      header: t('common:actions'),
      render: (row) => (
        <div className="flex items-center gap-2">
          <button
            onClick={() => { setSelectedClaim(row); setShowModal(true); }}
            className="p-2 text-gov-blue hover:bg-gray-100 rounded-lg"
          >
            {row.status === 'sanctioned' ? <Upload size={18} /> : <Eye size={18} />}
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-6">
      <h1 className={`text-2xl font-bold text-gray-900 ${language === 'or' ? 'font-odia' : ''}`}>
        {t('sanction:uploadSanctionOrder')}
      </h1>

      <Card>
        <Table columns={columns} data={claims} loading={loading} />
      </Card>

      <Modal isOpen={showModal} onClose={() => { setShowModal(false); setFile(null); }} title={t('sanction:sanctionOrder')} size="lg">
        {selectedClaim && (
          <div className="space-y-6">
            <div className="grid grid-cols-2 gap-4">
              <div>
                <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>Festival</p>
                <p className="font-medium">{selectedClaim.festival?.name}</p>
              </div>
              <div>
                <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('sanction:sanctionedAmount')}</p>
                <p className="font-bold text-green-600 text-xl">₹{selectedClaim.sanctionAmount?.toLocaleString()}</p>
              </div>
            </div>

            {selectedClaim.status === 'sanctioned' && (
              <div className="space-y-4">
                <h4 className={`font-medium ${language === 'or' ? 'font-odia' : ''}`}>{t('sanction:requiredDocuments')}</h4>
                
                <div className="border-2 border-dashed rounded-lg p-6 text-center">
                  {file ? (
                    <div className="flex items-center justify-center gap-4">
                      <FileText className="text-gov-blue" size={32} />
                      <div className="text-left">
                        <p className="font-medium">{file.name}</p>
                        <p className="text-sm text-gray-500">{(file.size / 1024 / 1024).toFixed(2)} MB</p>
                      </div>
                      <button onClick={() => setFile(null)} className="text-red-500 hover:text-red-700">
                        Remove
                      </button>
                    </div>
                  ) : (
                    <>
                      <Upload className="mx-auto text-gray-400" size={40} />
                      <p className={`mt-2 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:uploadDocument')}</p>
                      <input
                        type="file"
                        accept=".pdf,.jpg,.jpeg,.png"
                        onChange={(e) => setFile(e.target.files[0])}
                        className="hidden"
                        id="sanction-file"
                      />
                      <label
                        htmlFor="sanction-file"
                        className="mt-3 inline-block px-4 py-2 bg-gov-blue text-white rounded-lg cursor-pointer hover:bg-gov-blue-dark"
                      >
                        Choose File
                      </label>
                    </>
                  )}
                </div>

                <div className="flex justify-end">
                  <Button onClick={handleUpload} loading={uploading} disabled={!file}>
                    {t('sanction:submitDocuments')}
                  </Button>
                </div>
              </div>
            )}

            {selectedClaim.status === 'disbursed' && (
              <div className="bg-green-50 p-4 rounded-lg">
                <div className="flex items-center gap-3">
                  <Check className="text-green-600" size={24} />
                  <div>
                    <p className={`font-medium text-green-800 ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('sanction:disbursementComplete')}
                    </p>
                    <p className="text-sm text-green-700">
                      {t('sanction:disbursedAmount')}: ₹{selectedClaim.disbursedAmount?.toLocaleString()}
                    </p>
                  </div>
                </div>
              </div>
            )}
          </div>
        )}
      </Modal>
    </div>
  );
};

export default SanctionOrder;
