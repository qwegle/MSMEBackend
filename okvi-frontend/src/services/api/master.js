import api from './axios';

export const masterApi = {
  getHolidays: (params) => api.get('/holidays/getAllHolidays', { params }),
  
  getCalendarHolidays: () => api.get('/holidays/getCalendarHolidays'),
  
  getHeadTypes: (params) => api.get('/head-types', { params }),
  
  getUnitTypes: (params) => api.get('/unit-types', { params }),
  
  getDistricts: () => api.get('/districts'),
  
  getDicRic: (districtId) => api.get(`/dic-ric/${districtId}`),
};
