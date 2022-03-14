import React from 'react';
import logo from './logo.svg';
import './App.css';
import EmailChecker from './components/EmailChecker.js';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <div data-testid="content" className="app-content">
        <p>
          You should learn <a className="app-link" href="https://reactjs.org" target="_blank" rel="noopener noreferrer">React</a> ¯\_(ツ)_/¯ ?<br/>
        </p>
      </div>
      <EmailChecker />
        </header>
    </div>
  );
}

export default App;