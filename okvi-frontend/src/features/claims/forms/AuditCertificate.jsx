import { useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Upload, File, X } from 'lucide-react';
import toast from 'react-hot-toast';
import { Button } from '../../../components/ui';
import { claimsApi } from '../../../services/api';
import useLanguageStore from '../../../store/languageStore';

const AuditCertificate = ({ festivalId, onSuccess }) => {
  const { t } = useTranslation(['claims', 'common']);
  const { language } = useLanguageStore();
  const [loading, setLoading] = useState(false);
  const [file, setFile] = useState(null);
  const [dragOver, setDragOver] = useState(false);

  const handleFileChange = (e) => {
    const selectedFile = e.target.files[0];
    validateAndSetFile(selectedFile);
  };

  const handleDrop = (e) => {
    e.preventDefault();
    setDragOver(false);
    const droppedFile = e.dataTransfer.files[0];
    validateAndSetFile(droppedFile);
  };

  const validateAndSetFile = (selectedFile) => {
    if (!selectedFile) return;
    
    const allowedTypes = ['application/pdf', 'image/jpeg', 'image/png'];
    if (!allowedTypes.includes(selectedFile.type)) {
      toast.error('Only PDF, JPG, PNG files are allowed');
      return;
    }
    
    if (selectedFile.size > 5 * 1024 * 1024) {
      toast.error('File size must be less than 5MB');
      return;
    }
    
    setFile(selectedFile);
  };

  const handleSubmit = async () => {
    if (!file) {
      toast.error('Please select a file');
      return;
    }
    
    const formData = new FormData();
    formData.append('festivalId', festivalId);
    formData.append('auditCertificate', file);
    
    setLoading(true);
    try {
      await claimsApi.uploadAuditCertificate(formData);
      toast.success(t('claims:documentUploaded'));
      onSuccess();
    } catch (error) {
      toast.error(error.response?.data?.message || 'Failed to upload');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="space-y-6">
      <p className={`text-sm text-gray-600 ${language === 'or' ? 'font-odia' : ''}`}>
        {t('claims:auditDescription')}
      </p>

      <div
        onDragOver={(e) => { e.preventDefault(); setDragOver(true); }}
        onDragLeave={() => setDragOver(false)}
        onDrop={handleDrop}
        className={`border-2 border-dashed rounded-lg p-8 text-center transition-colors ${
          dragOver ? 'border-gov-blue bg-blue-50' : 'border-gray-300 hover:border-gray-400'
        }`}
      >
        {file ? (
          <div className="flex items-center justify-center gap-4">
            <File className="text-gov-blue" size={40} />
            <div className="text-left">
              <p className="font-medium">{file.name}</p>
              <p className="text-sm text-gray-500">{(file.size / 1024 / 1024).toFixed(2)} MB</p>
            </div>
            <button
              onClick={() => setFile(null)}
              className="p-2 hover:bg-gray-100 rounded-lg"
            >
              <X size={20} />
            </button>
          </div>
        ) : (
          <>
            <Upload className="mx-auto text-gray-400" size={48} />
            <p className={`mt-4 font-medium ${language === 'or' ? 'font-odia' : ''}`}>
              {t('claims:uploadDocument')}
            </p>
            <p className={`text-sm text-gray-500 mt-1 ${language === 'or' ? 'font-odia' : ''}`}>
              {t('claims:allowedFormats')} | {t('claims:maxFileSize')}
            </p>
            <input
              type="file"
              accept=".pdf,.jpg,.jpeg,.png"
              onChange={handleFileChange}
              className="hidden"
              id="audit-file"
            />
            <label
              htmlFor="audit-file"
              className="mt-4 inline-block px-4 py-2 bg-gov-blue text-white rounded-lg cursor-pointer hover:bg-gov-blue-dark transition-colors"
            >
              Choose File
            </label>
          </>
        )}
      </div>

      <div className="flex justify-end">
        <Button onClick={handleSubmit} loading={loading} disabled={!file}>
          {t('common:submit')}
        </Button>
      </div>
    </div>
  );
};

export default AuditCertificate;
