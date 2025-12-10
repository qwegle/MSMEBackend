import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import toast from 'react-hot-toast';
import { Button } from '../../../components/ui';
import { claimsApi } from '../../../services/api';
import useLanguageStore from '../../../store/languageStore';

const FormVI = ({ festivalId, onSuccess }) => {
  const { t } = useTranslation(['claims', 'common']);
  const { language } = useLanguageStore();
  const [loading, setLoading] = useState(false);
  const [summary, setSummary] = useState(null);

  useEffect(() => {
    fetchSummary();
  }, [festivalId]);

  const fetchSummary = async () => {
    try {
      const response = await claimsApi.getClaimSummary({ festivalId, centerWise: true });
      setSummary(response.data);
    } catch (error) {
      console.error('Failed to fetch summary');
    }
  };

  const handleSubmit = async () => {
    setLoading(true);
    try {
      await claimsApi.createFormVI({
        festivalId,
        centerWiseSummary: summary?.centers || [],
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
        {t('claims:formVIDescription')}
      </p>

      <div className="overflow-x-auto">
        <table className="min-w-full divide-y divide-gray-200">
          <thead className="bg-gray-50">
            <tr>
              <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:centerName')}</th>
              <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:centerAddress')}</th>
              <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:saleAmount')}</th>
              <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:rebateAmount')}</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200">
            {summary?.centers?.length > 0 ? (
              summary.centers.map((center, index) => (
                <tr key={index}>
                  <td className="px-4 py-3 text-sm">{center.name}</td>
                  <td className="px-4 py-3 text-sm">{center.address}</td>
                  <td className="px-4 py-3 text-sm font-medium">₹{center.saleAmount?.toLocaleString()}</td>
                  <td className="px-4 py-3 text-sm font-medium text-green-600">₹{center.rebateAmount?.toLocaleString()}</td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="4" className={`px-4 py-8 text-center text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('common:noDataFound')}
                </td>
              </tr>
            )}
          </tbody>
          {summary?.centers?.length > 0 && (
            <tfoot className="bg-gray-50">
              <tr>
                <td colSpan="2" className={`px-4 py-3 text-right font-medium ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:totalSale')} / {t('claims:totalRebate')}:</td>
                <td className="px-4 py-3 font-bold text-gov-blue">₹{summary?.totalSaleAmount?.toLocaleString() || 0}</td>
                <td className="px-4 py-3 font-bold text-green-600">₹{summary?.totalRebateAmount?.toLocaleString() || 0}</td>
              </tr>
            </tfoot>
          )}
        </table>
      </div>

      <div className="flex justify-end">
        <Button onClick={handleSubmit} loading={loading}>
          {t('common:submit')}
        </Button>
      </div>
    </div>
  );
};

export default FormVI;
