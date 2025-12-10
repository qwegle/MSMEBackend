import { useState } from 'react';
import { useForm, useFieldArray } from 'react-hook-form';
import { useTranslation } from 'react-i18next';
import { Plus, Trash2 } from 'lucide-react';
import toast from 'react-hot-toast';
import { Button, Input } from '../../../components/ui';
import { claimsApi } from '../../../services/api';
import useLanguageStore from '../../../store/languageStore';

const FormI = ({ festivalId, onSuccess }) => {
  const { t } = useTranslation(['claims', 'common']);
  const { language } = useLanguageStore();
  const [loading, setLoading] = useState(false);

  const { register, control, handleSubmit, watch, setValue } = useForm({
    defaultValues: {
      invoices: [{ invoiceNo: '', invoiceDate: '', customerName: '', customerAddress: '', itemDescription: '', saleAmount: '', rebateAmount: '' }],
    },
  });

  const { fields, append, remove } = useFieldArray({ control, name: 'invoices' });
  const watchInvoices = watch('invoices');

  const calculateTotals = () => {
    const totalSale = watchInvoices?.reduce((sum, inv) => sum + (parseFloat(inv.saleAmount) || 0), 0) || 0;
    const totalRebate = watchInvoices?.reduce((sum, inv) => sum + (parseFloat(inv.rebateAmount) || 0), 0) || 0;
    return { totalSale: totalSale.toFixed(2), totalRebate: totalRebate.toFixed(2) };
  };

  const onSubmit = async (data) => {
    setLoading(true);
    try {
      await claimsApi.createFormI({
        festivalId,
        invoices: data.invoices.map(inv => ({
          ...inv,
          saleAmount: parseFloat(inv.saleAmount),
          rebateAmount: parseFloat(inv.rebateAmount),
        })),
      });
      toast.success(t('common:success'));
      onSuccess();
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to submit');
    } finally {
      setLoading(false);
    }
  };

  const totals = calculateTotals();

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
      <p className={`text-sm text-gray-600 ${language === 'or' ? 'font-odia' : ''}`}>
        {t('claims:formIDescription')}
      </p>

      <div className="flex justify-end">
        <Button
          type="button"
          variant="secondary"
          size="sm"
          onClick={() => append({ invoiceNo: '', invoiceDate: '', customerName: '', customerAddress: '', itemDescription: '', saleAmount: '', rebateAmount: '' })}
        >
          <Plus size={16} /> {t('claims:addInvoice')}
        </Button>
      </div>

      <div className="overflow-x-auto">
        <table className="min-w-full divide-y divide-gray-200">
          <thead className="bg-gray-50">
            <tr>
              <th className={`px-3 py-2 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:invoiceNo')}</th>
              <th className={`px-3 py-2 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:invoiceDate')}</th>
              <th className={`px-3 py-2 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:customerName')}</th>
              <th className={`px-3 py-2 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:itemDescription')}</th>
              <th className={`px-3 py-2 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:saleAmount')}</th>
              <th className={`px-3 py-2 text-left text-xs font-medium text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:rebateAmount')}</th>
              <th className="px-3 py-2"></th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200">
            {fields.map((field, index) => (
              <tr key={field.id}>
                <td className="px-3 py-2"><input {...register(`invoices.${index}.invoiceNo`)} className="input-field text-sm" placeholder="INV-001" /></td>
                <td className="px-3 py-2"><input type="date" {...register(`invoices.${index}.invoiceDate`)} className="input-field text-sm" /></td>
                <td className="px-3 py-2"><input {...register(`invoices.${index}.customerName`)} className="input-field text-sm" /></td>
                <td className="px-3 py-2"><input {...register(`invoices.${index}.itemDescription`)} className="input-field text-sm" /></td>
                <td className="px-3 py-2"><input type="number" {...register(`invoices.${index}.saleAmount`)} className="input-field text-sm w-28" placeholder="0.00" /></td>
                <td className="px-3 py-2"><input type="number" {...register(`invoices.${index}.rebateAmount`)} className="input-field text-sm w-28" placeholder="0.00" /></td>
                <td className="px-3 py-2">
                  {fields.length > 1 && (
                    <button type="button" onClick={() => remove(index)} className="text-red-500 hover:text-red-700">
                      <Trash2 size={16} />
                    </button>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
          <tfoot className="bg-gray-50">
            <tr>
              <td colSpan="4" className={`px-3 py-2 text-right font-medium ${language === 'or' ? 'font-odia' : ''}`}>{t('claims:totalSale')} / {t('claims:totalRebate')}:</td>
              <td className="px-3 py-2 font-bold text-gov-blue">₹{totals.totalSale}</td>
              <td className="px-3 py-2 font-bold text-green-600">₹{totals.totalRebate}</td>
              <td></td>
            </tr>
          </tfoot>
        </table>
      </div>

      <div className="flex justify-end gap-3">
        <Button type="submit" loading={loading}>
          {t('common:submit')}
        </Button>
      </div>
    </form>
  );
};

export default FormI;
