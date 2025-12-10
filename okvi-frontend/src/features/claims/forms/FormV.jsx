import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import toast from 'react-hot-toast';
import { Button } from '../../../components/ui';
import { claimsApi } from '../../../services/api';
import useLanguageStore from '../../../store/languageStore';

const FormV = ({ festivalId, onSuccess }) => {
  const { t } = useTranslation(['claims', 'common']);
  const { language } = useLanguageStore();
  const [loading, setLoading] = useState(false);
  const [summary, setSummary] = useState(null);

  useEffect(() => {
    fetchSummary();
  }, [festivalId]);

  const fetchSummary = async () => {
    try {
      const response = await claimsApi.getClaimSummary({ festivalId });
      setSummary(response.data);
    } catch (error) {
      console.error('Failed to fetch summary');
    }
  };

  const handleSubmit = async () => {
    setLoading(true);
    try {
      await claimsApi.createFormV({
        festivalId,
        totalSaleAmount: summary?.totalSaleAmount || 0,
        totalRebateAmount: summary?.totalRebateAmount || 0,
      });
      toast.success(t('common:success'));
      onSuccess();
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to submit');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="space-y-6">
      <p className={`text-sm text-gray-600 ${language === 'or' ? 'font-odia' : ''}`}>
        {t('claims:formVDescription')}
      </p>

      <div className="bg-gray-50 rounded-lg p-6">
        <h3 className={`text-lg font-medium mb-4 ${language === 'or' ? 'font-odia' : ''}`}>
          {t('claims:formV')}
        </h3>
        
        <div className="grid grid-cols-2 gap-6">
          <div className="bg-white p-4 rounded-lg shadow-sm">
            <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('claims:totalSale')}
            </p>
            <p className="text-2xl font-bold text-gov-blue mt-1">
              ₹{summary?.totalSaleAmount?.toLocaleString() || 0}
            </p>
          </div>
          <div className="bg-white p-4 rounded-lg shadow-sm">
            <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('claims:totalRebate')}
            </p>
            <p className="text-2xl font-bold text-green-600 mt-1">
              ₹{summary?.totalRebateAmount?.toLocaleString() || 0}
            </p>
          </div>
        </div>

        <p className={`text-sm text-gray-500 mt-4 ${language === 'or' ? 'font-odia' : ''}`}>
          * These values are calculated from Form I entries
        </p>
      </div>

      <div className="flex justify-end">
        <Button onClick={handleSubmit} loading={loading}>
          {t('common:submit')}
        </Button>
      </div>
    </div>
  );
};

export default FormV;
