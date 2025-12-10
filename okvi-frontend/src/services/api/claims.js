import api from './axios';

export const claimsApi = {
  createFormI: (data) => api.post('/claim-documents/form-i', data),
  
  createFormV: (data) => api.post('/claim-documents/form-v', data),
  
  createFormVI: (data) => api.post('/claim-documents/form-vi', data),
  
  createDeclarationCertificate: (data) => api.post('/claim-documents/declaration-certificate', data),
  
  uploadAuditCertificate: (data) => api.post('/claim-documents/upload-audit-certificate', data, {
    headers: { 'Content-Type': 'multipart/form-data' },
  }),
  
  uploadBankDepositProof: (data) => api.post('/claim-documents/upload-bank-deposit-proof', data, {
    headers: { 'Content-Type': 'multipart/form-data' },
  }),
  
  finalSubmit: (data) => api.post('/claim-documents/final-submit', data),
  
  getSubmittedClaimDocument: (data) => api.post('/claim-documents/submitted-claim-document', data),
  
  getClaimSummary: (data) => api.post('/claim-documents/claim-summary', data),
  
  getClaimData: (data) => api.post('/claim-documents/getClaimData', data),
};
