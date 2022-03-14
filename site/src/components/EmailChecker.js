import React, { useState } from 'react';
import { EmailValidation } from 'common';

export default function EmailChecker() {
  const [inputValue, setInputValue] = useState('');
  const [resultValue, setResultValue] = useState('');

    const handleInputChange = (event) => {
      setInputValue(event.target.value);
    };

    const handleClick = () => {
      const result = EmailValidation.validate(inputValue);
      setResultValue(result); 
    };

    const handleKeyPress = (event) => {
      if(event.key === 'Enter'){
        handleClick();
      }
    }

    return (
      <div className='email-checker'>
        <h5>Is your email valid?</h5>
        <input value={inputValue} onChange={handleInputChange} onKeyPress={handleKeyPress}/>
        <button onClick={handleClick}>Submit</button>
        <p>{ resultValue }</p>
      </div>
    );
  }
