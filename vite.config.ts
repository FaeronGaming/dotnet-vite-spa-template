import { defineConfig, UserConfig } from 'vite';
import react from '@vitejs/plugin-react';
import basicSsl from '@vitejs/plugin-basic-ssl';

// https://vitejs.dev/config/
export default defineConfig({
  root: 'src/dotnet-web-react-vite-template.Web/ClientApp',
  build: {
    outDir: '../wwwroot',
  },
  server: {
    proxy: {
      '/api': {
        target: 'https://localhost:7276',
        changeOrigin: true,
        secure: false,
      },
    },
  },
  plugins: [
    basicSsl(),
    react({
      babel: {
        plugins: [
          ['babel-plugin-react-compiler', {}]
        ],
      },
    })
  ],
}) satisfies UserConfig;

