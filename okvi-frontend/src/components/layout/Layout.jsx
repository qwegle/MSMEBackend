import { Outlet } from 'react-router-dom';
import GovHeader from './GovHeader';
import Sidebar from './Sidebar';
import { Toaster } from 'react-hot-toast';

const Layout = () => {
  return (
    <div className="min-h-screen bg-gray-50">
      <GovHeader />
      <div className="flex">
        <Sidebar />
        <main className="flex-1 p-6">
          <Outlet />
        </main>
      </div>
      <Toaster position="top-right" />
    </div>
  );
};

export default Layout;
