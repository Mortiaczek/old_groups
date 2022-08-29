import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import { VisibilityProvider } from './providers/VisibilityProvider.tsx';
import App from "./groupmaker/groupmaker.jsx"


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <VisibilityProvider>
      <App />
    </VisibilityProvider>
  </React.StrictMode>
);