import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import './i18n';

import Layout from './components/layout/Layout';
import AuthLayout from './components/layout/AuthLayout';
import ProtectedRoute from './routes/ProtectedRoute';
import ErrorBoundary from './components/ErrorBoundary';

import { Login, Register, ForgotPassword } from './features/auth';
import { Dashboard } from './features/dashboard';
import { OpeningStockEntry, OpeningStockList, ClosingStockEntry, ClosingStockList } from './features/stock';
import { ClaimDocuments, SubmittedClaims } from './features/claims';
import { SanctionOrder } from './features/sanction';
import { ChangePassword } from './features/profile';

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      retry: 1,
      refetchOnWindowFocus: false,
      staleTime: 5 * 60 * 1000,
    },
  },
});

function App() {
  return (
    <ErrorBoundary>
      <QueryClientProvider client={queryClient}>
        <BrowserRouter>
          <Routes>
            <Route element={<AuthLayout />}>
              <Route path="/login" element={<Login />} />
              <Route path="/register" element={<Register />} />
              <Route path="/forgot-password" element={<ForgotPassword />} />
            </Route>

            <Route element={<ProtectedRoute />}>
              <Route element={<Layout />}>
                <Route path="/dashboard" element={<Dashboard />} />
                <Route path="/opening-stock/entry" element={<OpeningStockEntry />} />
                <Route path="/opening-stock/list" element={<OpeningStockList />} />
                <Route path="/closing-stock/entry" element={<ClosingStockEntry />} />
                <Route path="/closing-stock/list" element={<ClosingStockList />} />
                <Route path="/claims/entry" element={<ClaimDocuments />} />
                <Route path="/claims/submitted" element={<SubmittedClaims />} />
                <Route path="/sanction-order" element={<SanctionOrder />} />
                <Route path="/change-password" element={<ChangePassword />} />
              </Route>
            </Route>

            <Route path="/" element={<Navigate to="/login" replace />} />
            <Route path="*" element={<Navigate to="/login" replace />} />
          </Routes>
        </BrowserRouter>
      </QueryClientProvider>
    </ErrorBoundary>
  );
}

export default App;
