import { defineConfig, UserConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  root: 'src/dotnet-web-react-vite-template.Web/ClientApp',
  build: {
    outDir: '../wwwroot',
  },
  plugins: [react()],
}) satisfies UserConfig;

