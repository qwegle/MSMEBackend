import { useState } from 'react';
import { useTranslation } from 'react-i18next';
import toast from 'react-hot-toast';
import { Button } from '../../../components/ui';
import { claimsApi } from '../../../services/api';
import useLanguageStore from '../../../store/languageStore';

const DeclarationCertificate = ({ festivalId, onSuccess }) => {
  const { t } = useTranslation(['claims', 'common']);
  const { language } = useLanguageStore();
  const [loading, setLoading] = useState(false);
  const [agreed, setAgreed] = useState(false);

  const handleSubmit = async () => {
    if (!agreed) {
      toast.error('Please agree to the declaration');
      return;
    }
    
    setLoading(true);
    try {
      await claimsApi.createDeclarationCertificate({
        festivalId,
        declared: true,
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
        {t('claims:declarationDescription')}
      </p>

      <div className="bg-gray-50 p-6 rounded-lg border">
        <h3 className={`text-lg font-semibold mb-4 ${language === 'or' ? 'font-odia' : ''}`}>
          {t('claims:declarationCertificate')}
        </h3>
        
        <div className={`prose prose-sm max-w-none ${language === 'or' ? 'font-odia' : ''}`}>
          <p>
            I hereby declare that:
          </p>
          <ol className="list-decimal pl-5 space-y-2">
            <li>The information provided in this claim application is true and correct to the best of my knowledge.</li>
            <li>The sales figures and rebate amounts mentioned are accurate and can be verified from our records.</li>
            <li>The institution has complied with all the rules and regulations of the OKVI rebate scheme.</li>
            <li>I understand that any false declaration may lead to rejection of the claim and legal action.</li>
            <li>The bank account details provided are correct and belong to the institution.</li>
          </ol>
        </div>

        <div className="mt-6 flex items-center gap-3">
          <input
            type="checkbox"
            id="declaration"
            checked={agreed}
            onChange={(e) => setAgreed(e.target.checked)}
            className="h-5 w-5 rounded border-gray-300 text-gov-blue focus:ring-gov-blue"
          />
          <label htmlFor="declaration" className={`text-sm font-medium ${language === 'or' ? 'font-odia' : ''}`}>
            I agree to the above declaration
          </label>
        </div>
      </div>

      <div className="flex justify-end">
        <Button onClick={handleSubmit} loading={loading} disabled={!agreed}>
          {t('common:submit')}
        </Button>
      </div>
    </div>
  );
};

export default DeclarationCertificate;
