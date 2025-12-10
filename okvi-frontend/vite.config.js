import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
      '@assets': path.resolve(__dirname, './attached_assets'),
    },
  },
  server: {
    host: '0.0.0.0',
    port: 5000,
    strictPort: true,
    allowedHosts: [
      'localhost',
      '127.0.0.1',
      '.replit.dev',
      '.pike.replit.dev',
      '.repl.co',
      '0b2d1b5d-3b9b-4e15-bba5-9de0e19a1b0d-00-r4zwniir4gzm.pike.replit.dev'
    ],
    hmr: false,
    proxy: {
      '/api': {
        target: 'http://localhost:3000',
        changeOrigin: true,
      },
    },
  },
})
