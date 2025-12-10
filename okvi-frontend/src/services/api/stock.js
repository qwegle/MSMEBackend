import api from './axios';

export const stockApi = {
  createOpeningStock: (data) => api.post('/opening-stock/create', data),
  
  getOpeningStocks: (params) => api.get('/opening-stock/getOpeningStocks', { params }),
  
  getOpeningStockById: (id) => api.get(`/opening-stock/${id}`),
  
  deleteOpeningStock: (id) => api.delete(`/opening-stock/${id}`),
  
  createClosingStock: (data) => api.post('/closing-stock/create', data),
  
  getClosingStocks: (params) => api.get('/closing-stock/getClosingStocks', { params }),
  
  getClosingStockById: (id) => api.get(`/closing-stock/${id}`),
  
  deleteClosingStock: (id) => api.delete(`/closing-stock/${id}`),
};
