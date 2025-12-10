import { useState, useEffect } from 'react';
import { useForm, useFieldArray } from 'react-hook-form';
import { useTranslation } from 'react-i18next';
import { Plus, Trash2 } from 'lucide-react';
import toast from 'react-hot-toast';
import { Card, Button, Input, Select } from '../../components/ui';
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
      <h1 className={`text-2xl font-bold text-gray-900 ${language === 'or' ? 'font-odia' : ''}`}>
        {t('stock:openingStockEntry')}
      </h1>

      <Card>
        <form onSubmit={handleSubmit(onSubmit)} className="space-y-6">
          <Select
            label={t('stock:selectFestival')}
            value={selectedFestival}
            onChange={(e) => setSelectedFestival(e.target.value)}
            options={festivals.map(f => ({ value: f._id, label: f.name }))}
            placeholder={t('stock:selectFestival')}
            required
          />

          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <h3 className={`font-medium ${language === 'or' ? 'font-odia' : ''}`}>
                {t('stock:addStock')}
              </h3>
              <Button type="button" variant="secondary" size="sm" onClick={addItem}>
                <Plus size={16} /> {t('common:add')}
              </Button>
            </div>

            <div className="overflow-x-auto">
              <table className="min-w-full divide-y divide-gray-200">
                <thead className="bg-gray-50">
                  <tr>
                    <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('stock:headType')}
                    </th>
                    <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('stock:subHead')}
                    </th>
                    <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('stock:quantity')}
                    </th>
                    <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('stock:unitType')}
                    </th>
                    <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('stock:rate')}
                    </th>
                    <th className={`px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('stock:amount')}
                    </th>
                    <th className="px-4 py-3"></th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {fields.map((field, index) => (
                    <tr key={field.id}>
                      <td className="px-4 py-3">
                        <select
                          {...register(`items.${index}.headType`, { required: true })}
                          className="input-field text-sm"
                        >
                          <option value="">Select</option>
                          {headTypes.map(h => (
                            <option key={h._id} value={h._id}>{h.name}</option>
                          ))}
                        </select>
                      </td>
                      <td className="px-4 py-3">
                        <input
                          {...register(`items.${index}.subHead`, { required: true })}
                          className="input-field text-sm"
                          placeholder="Sub Head"
                        />
                      </td>
                      <td className="px-4 py-3">
                        <input
                          type="number"
                          {...register(`items.${index}.quantity`, { required: true, min: 0 })}
                          className="input-field text-sm w-24"
                          placeholder="0"
                        />
                      </td>
                      <td className="px-4 py-3">
                        <select
                          {...register(`items.${index}.unitType`, { required: true })}
                          className="input-field text-sm"
                        >
                          <option value="">Select</option>
                          {unitTypes.map(u => (
                            <option key={u._id} value={u._id}>{u.name}</option>
                          ))}
                        </select>
                      </td>
                      <td className="px-4 py-3">
                        <input
                          type="number"
                          {...register(`items.${index}.rate`, { required: true, min: 0 })}
                          className="input-field text-sm w-24"
                          placeholder="0.00"
                        />
                      </td>
                      <td className="px-4 py-3">
                        <input
                          type="text"
                          {...register(`items.${index}.amount`)}
                          className="input-field text-sm w-28 bg-gray-50"
                          readOnly
                        />
                      </td>
                      <td className="px-4 py-3">
                        {fields.length > 1 && (
                          <button
                            type="button"
                            onClick={() => remove(index)}
                            className="text-red-500 hover:text-red-700"
                          >
                            <Trash2 size={18} />
                          </button>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
                <tfoot className="bg-gray-50">
                  <tr>
                    <td colSpan="5" className={`px-4 py-3 text-right font-medium ${language === 'or' ? 'font-odia' : ''}`}>
                      {t('stock:totalAmount')}:
                    </td>
                    <td className="px-4 py-3 font-bold text-gov-blue">
                      ₹{calculateTotal()}
                    </td>
                    <td></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>

          <div className="flex justify-end">
            <Button type="submit" loading={loading}>
              {t('stock:submitStock')}
            </Button>
          </div>
        </form>
      </Card>
    </div>
  );
};

export default OpeningStockEntry;
