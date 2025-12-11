import { useState, useEffect } from 'react';
import { useForm, useFieldArray } from 'react-hook-form';
import { useTranslation } from 'react-i18next';
import { Plus, Trash2, Package, Save } from 'lucide-react';
import toast from 'react-hot-toast';
import { Button, Select } from '../../components/ui';
import { stockApi, masterApi } from '../../services/api';
import useLanguageStore from '../../store/languageStore';

const OpeningStockEntry = () => {
  const { t } = useTranslation(['stock', 'common']);
  const { language } = useLanguageStore();
  
  const [loading, setLoading] = useState(false);
  const [festivals, setFestivals] = useState([]);
  const [headTypes, setHeadTypes] = useState([]);
  const [unitTypes, setUnitTypes] = useState([]);
  const [selectedFestival, setSelectedFestival] = useState('');

  const { register, control, handleSubmit, watch, setValue, reset, formState: { errors } } = useForm({
    defaultValues: {
      items: [{ headType: '', subHead: '', quantity: '', unitType: '', rate: '', amount: '' }],
    },
  });

  const { fields, append, remove } = useFieldArray({
    control,
    name: 'items',
  });

  const watchItems = watch('items');

  useEffect(() => {
    fetchMasterData();
  }, []);

  useEffect(() => {
    watchItems?.forEach((item, index) => {
      const quantity = parseFloat(item.quantity) || 0;
      const rate = parseFloat(item.rate) || 0;
      const amount = quantity * rate;
      if (item.amount !== amount.toString()) {
        setValue(`items.${index}.amount`, amount.toFixed(2));
      }
    });
  }, [watchItems, setValue]);

  const fetchMasterData = async () => {
    try {
      const [festivalsRes, headTypesRes, unitTypesRes] = await Promise.all([
        masterApi.getHolidays({ upcoming: true }),
        masterApi.getHeadTypes(),
        masterApi.getUnitTypes(),
      ]);
      setFestivals(festivalsRes.data.holidays || []);
      setHeadTypes(headTypesRes.data.headTypes || []);
      setUnitTypes(unitTypesRes.data.unitTypes || []);
    } catch (error) {
      console.error('Failed to fetch master data');
    }
  };

  const calculateTotal = () => {
    return watchItems?.reduce((sum, item) => sum + (parseFloat(item.amount) || 0), 0).toFixed(2);
  };

  const onSubmit = async (data) => {
    if (!selectedFestival) {
      toast.error(t('stock:selectFestival'));
      return;
    }
    
    setLoading(true);
    try {
      await stockApi.createOpeningStock({
        festivalId: selectedFestival,
        items: data.items.map(item => ({
          headType: item.headType,
          subHead: item.subHead,
          quantity: parseFloat(item.quantity),
          unitType: item.unitType,
          rate: parseFloat(item.rate),
          amount: parseFloat(item.amount),
        })),
      });
      toast.success(t('stock:stockSubmitted'));
      reset();
      setSelectedFestival('');
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to submit stock');
    } finally {
      setLoading(false);
    }
  };

  const addItem = () => {
    append({ headType: '', subHead: '', quantity: '', unitType: '', rate: '', amount: '' });
  };

  return (
    <div className="space-y-6">
      <div className="page-header">
        <h1 className={`page-title ${language === 'or' ? 'font-odia' : ''}`}>
          {t('stock:openingStockEntry')}
        </h1>
        <p className={`page-subtitle ${language === 'or' ? 'font-odia' : ''}`}>
          {t('stock:openingStockEntryDesc', { defaultValue: 'Submit your opening stock details for the upcoming festival' })}
        </p>
      </div>

      <form onSubmit={handleSubmit(onSubmit)} className="space-y-6">
        <div className="form-section">
          <div className="form-section-header">
            <div className="form-section-title">
              <Package size={18} className="text-gov-navy" />
              <span className={language === 'or' ? 'font-odia' : ''}>
                {t('stock:festivalDetails', { defaultValue: 'Festival Details' })}
              </span>
            </div>
          </div>
          <div className="form-section-body">
            <div className="max-w-md">
              <Select
                label={t('stock:selectFestival')}
                value={selectedFestival}
                onChange={(e) => setSelectedFestival(e.target.value)}
                options={festivals.map(f => ({ value: f._id, label: f.name }))}
                placeholder={t('stock:selectFestival')}
                required
              />
            </div>
          </div>
        </div>

        <div className="form-section">
          <div className="form-section-header flex items-center justify-between">
            <div className="form-section-title">
              <Package size={18} className="text-gov-navy" />
              <span className={language === 'or' ? 'font-odia' : ''}>
                {t('stock:stockItems', { defaultValue: 'Stock Items' })}
              </span>
            </div>
            <Button type="button" variant="outline" size="sm" onClick={addItem}>
              <Plus size={16} /> {t('common:addItem', { defaultValue: 'Add Item' })}
            </Button>
          </div>
          <div className="overflow-x-auto">
            <table className="data-table">
              <thead>
                <tr>
                  <th className={language === 'or' ? 'font-odia' : ''}>
                    {t('stock:headType')}
                  </th>
                  <th className={language === 'or' ? 'font-odia' : ''}>
                    {t('stock:subHead')}
                  </th>
                  <th className={language === 'or' ? 'font-odia' : ''}>
                    {t('stock:quantity')}
                  </th>
                  <th className={language === 'or' ? 'font-odia' : ''}>
                    {t('stock:unitType')}
                  </th>
                  <th className={language === 'or' ? 'font-odia' : ''}>
                    {t('stock:rate')} (₹)
                  </th>
                  <th className={language === 'or' ? 'font-odia' : ''}>
                    {t('stock:amount')} (₹)
                  </th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {fields.map((field, index) => (
                  <tr key={field.id}>
                    <td>
                      <select
                        {...register(`items.${index}.headType`, { required: true })}
                        className="input-field"
                      >
                        <option value="">Select</option>
                        {headTypes.map(h => (
                          <option key={h._id} value={h._id}>{h.name}</option>
                        ))}
                      </select>
                    </td>
                    <td>
                      <input
                        {...register(`items.${index}.subHead`, { required: true })}
                        className="input-field"
                        placeholder="Enter sub head"
                      />
                    </td>
                    <td>
                      <input
                        type="number"
                        {...register(`items.${index}.quantity`, { required: true, min: 0 })}
                        className="input-field w-24"
                        placeholder="0"
                      />
                    </td>
                    <td>
                      <select
                        {...register(`items.${index}.unitType`, { required: true })}
                        className="input-field"
                      >
                        <option value="">Select</option>
                        {unitTypes.map(u => (
                          <option key={u._id} value={u._id}>{u.name}</option>
                        ))}
                      </select>
                    </td>
                    <td>
                      <input
                        type="number"
                        {...register(`items.${index}.rate`, { required: true, min: 0 })}
                        className="input-field w-28"
                        placeholder="0.00"
                        step="0.01"
                      />
                    </td>
                    <td>
                      <input
                        type="text"
                        {...register(`items.${index}.amount`)}
                        className="input-field w-28 bg-gray-50 font-semibold"
                        readOnly
                      />
                    </td>
                    <td>
                      {fields.length > 1 && (
                        <button
                          type="button"
                          onClick={() => remove(index)}
                          className="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-colors"
                        >
                          <Trash2 size={18} />
                        </button>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
              <tfoot>
                <tr className="bg-gov-navy/5">
                  <td colSpan="5" className={`text-right font-semibold text-gray-700 ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('stock:totalAmount')}:
                  </td>
                  <td className="font-bold text-gov-navy text-lg">
                    ₹{calculateTotal()}
                  </td>
                  <td></td>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>

        <div className="flex justify-end gap-4">
          <Button type="button" variant="outline" onClick={() => reset()}>
            {t('common:reset', { defaultValue: 'Reset' })}
          </Button>
          <Button type="submit" loading={loading}>
            <Save size={18} />
            {t('stock:submitStock')}
          </Button>
        </div>
      </form>
    </div>
  );
};

export default OpeningStockEntry;
