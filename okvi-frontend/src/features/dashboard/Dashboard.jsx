import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { useNavigate } from 'react-router-dom';
import { Calendar, Package, FileText, TrendingUp, ChevronLeft, ChevronRight } from 'lucide-react';
import toast from 'react-hot-toast';
import { Card, Button } from '../../components/ui';
import { authApi, masterApi } from '../../services/api';
import useAuthStore from '../../store/authStore';
import useLanguageStore from '../../store/languageStore';

const Dashboard = () => {
  const { t } = useTranslation(['dashboard', 'common']);
  const { language } = useLanguageStore();
  const { user } = useAuthStore();
  const navigate = useNavigate();
  
  const [loading, setLoading] = useState(true);
  const [dashboardData, setDashboardData] = useState(null);
  const [festivals, setFestivals] = useState([]);
  const [currentMonth, setCurrentMonth] = useState(new Date());

  useEffect(() => {
    fetchDashboardData();
    fetchFestivals();
  }, [currentMonth]);

  const fetchDashboardData = async () => {
    try {
      const response = await authApi.getDashboard();
      setDashboardData(response.data);
    } catch (error) {
      console.error('Failed to fetch dashboard data');
    }
  };

  const fetchFestivals = async () => {
    setLoading(true);
    try {
      const response = await masterApi.getHolidays({
        month: currentMonth.getMonth() + 1,
        year: currentMonth.getFullYear(),
      });
      setFestivals(response.data.holidays || []);
    } catch (error) {
      console.error('Failed to fetch festivals');
    } finally {
      setLoading(false);
    }
  };

  const changeMonth = (direction) => {
    const newMonth = new Date(currentMonth);
    newMonth.setMonth(newMonth.getMonth() + direction);
    setCurrentMonth(newMonth);
  };

  const formatDate = (dateString) => {
    return new Date(dateString).toLocaleDateString(language === 'or' ? 'or-IN' : 'en-IN', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
    });
  };

  const getStatusBadge = (status) => {
    const statusClasses = {
      submitted: 'bg-blue-100 text-blue-800',
      pending: 'bg-yellow-100 text-yellow-800',
      approved: 'bg-green-100 text-green-800',
      rejected: 'bg-red-100 text-red-800',
      notSubmitted: 'bg-gray-100 text-gray-800',
    };
    return statusClasses[status] || statusClasses.pending;
  };

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className={`text-2xl font-bold text-gray-900 ${language === 'or' ? 'font-odia' : ''}`}>
          {t('dashboard:welcomeUser', { name: user?.name || user?.email })}
        </h1>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card className="bg-gradient-to-r from-gov-blue to-blue-700 text-white">
          <div className="flex items-center justify-between">
            <div>
              <p className={`text-sm opacity-80 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('dashboard:totalClaims')}
              </p>
              <p className="text-3xl font-bold">{dashboardData?.totalClaims || 0}</p>
            </div>
            <FileText size={40} className="opacity-50" />
          </div>
        </Card>

        <Card className="bg-gradient-to-r from-yellow-500 to-orange-500 text-white">
          <div className="flex items-center justify-between">
            <div>
              <p className={`text-sm opacity-80 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('dashboard:pendingClaims')}
              </p>
              <p className="text-3xl font-bold">{dashboardData?.pendingClaims || 0}</p>
            </div>
            <Package size={40} className="opacity-50" />
          </div>
        </Card>

        <Card className="bg-gradient-to-r from-green-500 to-emerald-600 text-white">
          <div className="flex items-center justify-between">
            <div>
              <p className={`text-sm opacity-80 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('dashboard:approvedClaims')}
              </p>
              <p className="text-3xl font-bold">{dashboardData?.approvedClaims || 0}</p>
            </div>
            <TrendingUp size={40} className="opacity-50" />
          </div>
        </Card>

        <Card className="bg-gradient-to-r from-purple-500 to-indigo-600 text-white">
          <div className="flex items-center justify-between">
            <div>
              <p className={`text-sm opacity-80 ${language === 'or' ? 'font-odia' : ''}`}>
                {t('dashboard:totalRebate')}
              </p>
              <p className="text-2xl font-bold">₹{dashboardData?.totalRebate?.toLocaleString() || 0}</p>
            </div>
            <Calendar size={40} className="opacity-50" />
          </div>
        </Card>
      </div>

      <Card 
        title={t('dashboard:festivalCalendar')}
        actions={
          <div className="flex items-center gap-2">
            <button
              onClick={() => changeMonth(-1)}
              className="p-2 hover:bg-gray-100 rounded-lg"
            >
              <ChevronLeft size={20} />
            </button>
            <span className="font-medium min-w-[120px] text-center">
              {currentMonth.toLocaleDateString(language === 'or' ? 'or-IN' : 'en-IN', { 
                month: 'long', 
                year: 'numeric' 
              })}
            </span>
            <button
              onClick={() => changeMonth(1)}
              className="p-2 hover:bg-gray-100 rounded-lg"
            >
              <ChevronRight size={20} />
            </button>
          </div>
        }
      >
        {loading ? (
          <div className="flex items-center justify-center py-12">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gov-blue"></div>
          </div>
        ) : festivals.length === 0 ? (
          <p className={`text-center text-gray-500 py-8 ${language === 'or' ? 'font-odia' : ''}`}>
            {t('dashboard:noFestivalsThisMonth')}
          </p>
        ) : (
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <th className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('dashboard:festival')}
                  </th>
                  <th className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('dashboard:spellPeriod')}
                  </th>
                  <th className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('dashboard:openingStockStatus')}
                  </th>
                  <th className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('dashboard:closingStockStatus')}
                  </th>
                  <th className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase ${language === 'or' ? 'font-odia' : ''}`}>
                    {t('common:actions')}
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {festivals.map((festival) => (
                  <tr key={festival._id} className="hover:bg-gray-50">
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className="font-medium text-gray-900">{festival.name}</span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                      {formatDate(festival.spellStartDate)} - {formatDate(festival.spellEndDate)}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`px-2 py-1 text-xs rounded-full ${getStatusBadge(festival.openingStockStatus || 'notSubmitted')}`}>
                        {t(`dashboard:${festival.openingStockStatus || 'notSubmitted'}`)}
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`px-2 py-1 text-xs rounded-full ${getStatusBadge(festival.closingStockStatus || 'notSubmitted')}`}>
                        {t(`dashboard:${festival.closingStockStatus || 'notSubmitted'}`)}
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <Button
                        size="sm"
                        onClick={() => navigate(`/claims/entry?festival=${festival._id}`)}
                      >
                        {t('dashboard:applyNow')}
                      </Button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </Card>
    </div>
  );
};

export default Dashboard;
