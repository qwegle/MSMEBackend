import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { useSearchParams } from 'react-router-dom';
import { FileText, Upload, Check, AlertCircle } from 'lucide-react';
import toast from 'react-hot-toast';
import { Card, Button, Select, Modal } from '../../components/ui';
import { claimsApi, masterApi } from '../../services/api';
import useLanguageStore from '../../store/languageStore';
import FormI from './forms/FormI';
import FormV from './forms/FormV';
import FormVI from './forms/FormVI';
import DeclarationCertificate from './forms/DeclarationCertificate';
import AuditCertificate from './forms/AuditCertificate';
import BankDepositProof from './forms/BankDepositProof';

const FORMS = [
  { id: 'formI', key: 'formI', icon: FileText },
  { id: 'formV', key: 'formV', icon: FileText },
  { id: 'formVI', key: 'formVI', icon: FileText },
  { id: 'declaration', key: 'declarationCertificate', icon: FileText },
  { id: 'audit', key: 'auditCertificate', icon: Upload },
  { id: 'bankProof', key: 'bankDepositProof', icon: Upload },
];

const ClaimDocuments = () => {
  const { t } = useTranslation(['claims', 'common']);
  const { language } = useLanguageStore();
  const [searchParams] = useSearchParams();
  
  const [loading, setLoading] = useState(false);
  const [festivals, setFestivals] = useState([]);
  const [selectedFestival, setSelectedFestival] = useState(searchParams.get('festival') || '');
  const [claimData, setClaimData] = useState(null);
  const [activeForm, setActiveForm] = useState(null);
  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    fetchFestivals();
  }, []);

  useEffect(() => {
    if (selectedFestival) {
      fetchClaimData();
    }
  }, [selectedFestival]);

  const fetchFestivals = async () => {
    try {
      const response = await masterApi.getHolidays({ forClaims: true });
      setFestivals(response.data.holidays || []);
    } catch (error) {
      console.error('Failed to fetch festivals');
    }
  };

  const fetchClaimData = async () => {
    setLoading(true);
    try {
      const response = await claimsApi.getSubmittedClaimDocument({ festivalId: selectedFestival });
      setClaimData(response.data);
    } catch (error) {
      if (error.response?.status !== 404) {
        toast.error('Failed to fetch claim data');
      }
      setClaimData(null);
    } finally {
      setLoading(false);
    }
  };

  const getFormStatus = (formKey) => {
    if (!claimData) return 'incomplete';
    return claimData.formStatuses?.[formKey] ? 'completed' : 'incomplete';
  };

  const canFinalSubmit = () => {
    if (!claimData) return false;
    return FORMS.every(form => claimData.formStatuses?.[form.key]);
  };

  const handleFinalSubmit = async () => {
    if (!window.confirm(t('claims:finalSubmitWarning'))) return;
    
    setLoading(true);
    try {
      await claimsApi.finalSubmit({ festivalId: selectedFestival });
      toast.success(t('claims:claimSubmitted'));
      fetchClaimData();
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to submit claim');
    } finally {
      setLoading(false);
    }
  };

  const openFormModal = (formId) => {
    setActiveForm(formId);
    setShowModal(true);
  };

  const closeFormModal = () => {
    setShowModal(false);
    setActiveForm(null);
    fetchClaimData();
  };

  const renderFormComponent = () => {
    const props = { festivalId: selectedFestival, onSuccess: closeFormModal };
    switch (activeForm) {
      case 'formI': return <FormI {...props} />;
      case 'formV': return <FormV {...props} />;
      case 'formVI': return <FormVI {...props} />;
      case 'declaration': return <DeclarationCertificate {...props} />;
      case 'audit': return <AuditCertificate {...props} />;
      case 'bankProof': return <BankDepositProof {...props} />;
      default: return null;
    }
  };

  return (
    <div className="space-y-6">
      <h1 className={`text-2xl font-bold text-gray-900 ${language === 'or' ? 'font-odia' : ''}`}>
        {t('claims:claimDocumentEntry')}
      </h1>

      <Card>
        <Select
          label={t('claims:selectFestivalForClaim')}
          value={selectedFestival}
          onChange={(e) => setSelectedFestival(e.target.value)}
          options={festivals.map(f => ({ value: f._id, label: f.name }))}
          placeholder={t('claims:selectFestivalForClaim')}
        />

        {selectedFestival && !loading && !claimData?.hasOpeningStock && (
          <div className={`mt-4 p-4 bg-yellow-50 border border-yellow-200 rounded-lg flex items-start gap-3 ${language === 'or' ? 'font-odia' : ''}`}>
            <AlertCircle className="text-yellow-600 mt-0.5" size={20} />
            <p className="text-yellow-800">{t('claims:mustSubmitStocks')}</p>
          </div>
        )}

        {selectedFestival && (claimData?.hasOpeningStock || true) && (
          <div className="mt-6 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {FORMS.map((form) => {
              const status = getFormStatus(form.key);
              const Icon = form.icon;
              return (
                <div
                  key={form.id}
                  className={`p-4 border-2 rounded-lg cursor-pointer transition-all hover:shadow-md ${
                    status === 'completed' 
                      ? 'border-green-300 bg-green-50' 
                      : 'border-gray-200 hover:border-gov-blue'
                  }`}
                  onClick={() => openFormModal(form.id)}
                >
                  <div className="flex items-start justify-between">
                    <div className="flex items-center gap-3">
                      <div className={`p-2 rounded-lg ${status === 'completed' ? 'bg-green-100' : 'bg-gray-100'}`}>
                        <Icon size={24} className={status === 'completed' ? 'text-green-600' : 'text-gray-600'} />
                      </div>
                      <div>
                        <h3 className={`font-medium ${language === 'or' ? 'font-odia' : ''}`}>
                          {t(`claims:${form.key}`)}
                        </h3>
                        <p className={`text-sm text-gray-500 mt-1 ${language === 'or' ? 'font-odia' : ''}`}>
                          {t(`claims:${form.key}Description`)}
                        </p>
                      </div>
                    </div>
                    {status === 'completed' && (
                      <Check className="text-green-600" size={20} />
                    )}
                  </div>
                  <div className="mt-3">
                    <span className={`text-xs px-2 py-1 rounded-full ${
                      status === 'completed' 
                        ? 'bg-green-100 text-green-800' 
                        : 'bg-gray-100 text-gray-600'
                    } ${language === 'or' ? 'font-odia' : ''}`}>
                      {t(`claims:${status}`)}
                    </span>
                  </div>
                </div>
              );
            })}
          </div>
        )}

        {selectedFestival && (
          <div className="mt-6 flex justify-end">
            <Button
              onClick={handleFinalSubmit}
              disabled={!canFinalSubmit() || claimData?.status === 'submitted'}
              loading={loading}
              variant={canFinalSubmit() ? 'saffron' : 'secondary'}
            >
              {t('claims:finalSubmit')}
            </Button>
          </div>
        )}
      </Card>

      <Modal
        isOpen={showModal}
        onClose={closeFormModal}
        title={activeForm ? t(`claims:${FORMS.find(f => f.id === activeForm)?.key || ''}`) : ''}
        size="xl"
      >
        {renderFormComponent()}
      </Modal>
    </div>
  );
};

export default ClaimDocuments;
