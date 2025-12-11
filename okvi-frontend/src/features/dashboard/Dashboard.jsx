import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { useNavigate } from 'react-router-dom';
import { 
  Calendar, 
  FileText, 
  TrendingUp, 
  ChevronLeft, 
  ChevronRight,
  IndianRupee,
  Clock,
  CheckCircle2,
  AlertCircle,
  Package,
  ArrowRight,
  CalendarDays
} from 'lucide-react';
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
    });
  };

  const getStatusBadge = (status) => {
    const statusConfig = {
      submitted: { class: 'badge-info', icon: Clock },
      pending: { class: 'badge-warning', icon: AlertCircle },
      approved: { class: 'badge-success', icon: CheckCircle2 },
      rejected: { class: 'badge-danger', icon: AlertCircle },
      notSubmitted: { class: 'badge-neutral', icon: AlertCircle },
    };
    return statusConfig[status] || statusConfig.pending;
  };

  const statCards = [
    {
      id: 'total',
      label: t('dashboard:totalClaims'),
      value: dashboardData?.totalClaims || 0,
      icon: FileText,
      color: 'navy',
    },
    {
      id: 'pending',
      label: t('dashboard:pendingClaims'),
      value: dashboardData?.pendingClaims || 0,
      icon: Clock,
      color: 'saffron',
    },
    {
      id: 'approved',
      label: t('dashboard:approvedClaims'),
      value: dashboardData?.approvedClaims || 0,
      icon: CheckCircle2,
      color: 'green',
    },
    {
      id: 'rebate',
      label: t('dashboard:totalRebate'),
      value: `₹${(dashboardData?.totalRebate || 0).toLocaleString('en-IN')}`,
      icon: IndianRupee,
      color: 'purple',
    },
  ];

  const recentActivities = [
    {
      id: 1,
      type: 'claim',
      title: 'New claim submitted',
      desc: 'Claim for Durga Puja 2024 submitted successfully',
      time: '2 hours ago',
    },
    {
      id: 2,
      type: 'stock',
      title: 'Opening stock updated',
      desc: 'Stock entry for Raja Festival completed',
      time: '1 day ago',
    },
    {
      id: 3,
      type: 'approval',
      title: 'Claim approved by GMDIC',
      desc: 'Your claim has moved to DI for review',
      time: '3 days ago',
    },
  ];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className={`text-2xl font-bold text-gray-900 ${language === 'or' ? 'font-odia' : ''}`}>
            {t('dashboard:welcomeUser', { name: user?.name || 'User' })}
          </h1>
          <p className={`text-sm text-gray-500 mt-1 ${language === 'or' ? 'font-odia' : ''}`}>
            {t('dashboard:dashboardSubtitle', { defaultValue: 'Here\'s your rebate management overview' })}
          </p>
        </div>
        <button
          onClick={() => navigate('/claims/entry')}
          className="quick-action-btn"
        >
          <FileText size={16} />
          {t('dashboard:newClaim', { defaultValue: 'New Claim' })}
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5">
        {statCards.map((stat) => (
          <div key={stat.id} className={`stat-card ${stat.color}`}>
            <div className={`stat-card-icon ${stat.color}`}>
              <stat.icon size={24} />
            </div>
            <p className={`stat-card-label ${language === 'or' ? 'font-odia' : ''}`}>
              {stat.label}
            </p>
            <p className="stat-card-value">{stat.value}</p>
          </div>
        ))}
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="lg:col-span-2 dashboard-card">
          <div className="dashboard-card-header">
            <div className="dashboard-card-title">
              <CalendarDays size={20} className="text-gov-navy" />
              <span className={language === 'or' ? 'font-odia' : ''}>
                {t('dashboard:festivalCalendar')}
              </span>
            </div>
            <div className="calendar-nav">
              <button onClick={() => changeMonth(-1)} className="calendar-nav-btn">
                <ChevronLeft size={18} />
              </button>
              <span className={`calendar-month ${language === 'or' ? 'font-odia' : ''}`}>
                {currentMonth.toLocaleDateString(language === 'or' ? 'or-IN' : 'en-IN', { 
                  month: 'long', 
                  year: 'numeric' 
                })}
              </span>
              <button onClick={() => changeMonth(1)} className="calendar-nav-btn">
                <ChevronRight size={18} />
              </button>
            </div>
          </div>
          <div className="dashboard-card-body p-0">
            {loading ? (
              <div className="flex items-center justify-center py-16">
                <div className="animate-spin rounded-full h-8 w-8 border-2 border-gov-navy border-t-transparent"></div>
              </div>
            ) : festivals.length === 0 ? (
              <div className="empty-state">
                <div className="empty-state-icon">
                  <Calendar size={28} />
                </div>
                <p className={`empty-state-title ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('dashboard:noFestivalsTitle', { defaultValue: 'No Festivals This Month' })}
                </p>
                <p className={`empty-state-text ${language === 'or' ? 'font-odia' : ''}`}>
                  {t('dashboard:noFestivalsThisMonth')}
                </p>
              </div>
            ) : (
              <table className="data-table">
                <thead>
                  <tr>
                    <th className={language === 'or' ? 'font-odia' : ''}>
                      {t('dashboard:festival')}
                    </th>
                    <th className={language === 'or' ? 'font-odia' : ''}>
                      {t('dashboard:spellPeriod')}
                    </th>
                    <th className={language === 'or' ? 'font-odia' : ''}>
                      {t('dashboard:openingStockStatus')}
                    </th>
                    <th className={language === 'or' ? 'font-odia' : ''}>
                      {t('dashboard:closingStockStatus')}
                    </th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  {festivals.map((festival) => {
                    const openingStatus = getStatusBadge(festival.openingStockStatus || 'notSubmitted');
                    const closingStatus = getStatusBadge(festival.closingStockStatus || 'notSubmitted');
                    return (
                      <tr key={festival._id}>
                        <td>
                          <span className="font-semibold text-gray-900">{festival.name}</span>
                        </td>
                        <td className="text-gray-600">
                          {formatDate(festival.spellStartDate)} - {formatDate(festival.spellEndDate)}
                        </td>
                        <td>
                          <span className={`badge ${openingStatus.class}`}>
                            {t(`dashboard:${festival.openingStockStatus || 'notSubmitted'}`)}
                          </span>
                        </td>
                        <td>
                          <span className={`badge ${closingStatus.class}`}>
                            {t(`dashboard:${festival.closingStockStatus || 'notSubmitted'}`)}
                          </span>
                        </td>
                        <td>
                          <button
                            onClick={() => navigate(`/claims/entry?festival=${festival._id}`)}
                            className="quick-action-btn"
                          >
                            {t('dashboard:applyNow')}
                            <ArrowRight size={14} />
                          </button>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            )}
          </div>
        </div>

        <div className="dashboard-card">
          <div className="dashboard-card-header">
            <div className="dashboard-card-title">
              <TrendingUp size={20} className="text-gov-navy" />
              <span className={language === 'or' ? 'font-odia' : ''}>
                {t('dashboard:recentActivity', { defaultValue: 'Recent Activity' })}
              </span>
            </div>
          </div>
          <div className="dashboard-card-body">
            <div className="activity-timeline">
              {recentActivities.map((activity) => (
                <div key={activity.id} className="activity-item">
                  <div className={`activity-icon ${activity.type}`}>
                    {activity.type === 'claim' && <FileText size={18} />}
                    {activity.type === 'stock' && <Package size={18} />}
                    {activity.type === 'approval' && <CheckCircle2 size={18} />}
                  </div>
                  <div className="activity-content">
                    <p className="activity-title">{activity.title}</p>
                    <p className="activity-desc">{activity.desc}</p>
                    <p className="activity-time">{activity.time}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-5">
        <div 
          className="dashboard-card cursor-pointer hover:shadow-lg transition-shadow"
          onClick={() => navigate('/opening-stock/entry')}
        >
          <div className="dashboard-card-body text-center py-8">
            <div className="stat-card-icon navy mx-auto mb-4">
              <Package size={24} />
            </div>
            <h3 className={`font-semibold text-gray-900 mb-2 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('dashboard:quickOpeningStock', { defaultValue: 'Opening Stock Entry' })}
            </h3>
            <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('dashboard:quickOpeningStockDesc', { defaultValue: 'Submit your opening stock for upcoming festival' })}
            </p>
          </div>
        </div>

        <div 
          className="dashboard-card cursor-pointer hover:shadow-lg transition-shadow"
          onClick={() => navigate('/closing-stock/entry')}
        >
          <div className="dashboard-card-body text-center py-8">
            <div className="stat-card-icon green mx-auto mb-4">
              <Package size={24} />
            </div>
            <h3 className={`font-semibold text-gray-900 mb-2 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('dashboard:quickClosingStock', { defaultValue: 'Closing Stock Entry' })}
            </h3>
            <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('dashboard:quickClosingStockDesc', { defaultValue: 'Submit your closing stock after festival' })}
            </p>
          </div>
        </div>

        <div 
          className="dashboard-card cursor-pointer hover:shadow-lg transition-shadow"
          onClick={() => navigate('/claims/submitted')}
        >
          <div className="dashboard-card-body text-center py-8">
            <div className="stat-card-icon saffron mx-auto mb-4">
              <FileText size={24} />
            </div>
            <h3 className={`font-semibold text-gray-900 mb-2 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('dashboard:quickViewClaims', { defaultValue: 'View Submitted Claims' })}
            </h3>
            <p className={`text-sm text-gray-500 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('dashboard:quickViewClaimsDesc', { defaultValue: 'Track your claim status and history' })}
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
