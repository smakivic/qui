import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import './css/Form.css'; // Import the new CSS file

function Register({ setIsLoggedIn }) {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();

  const handleRegister = async (e) => {
    e.preventDefault();
    try {
      await axios.post('http://localhost:8000/api/register', { name, email, password });
      const loginResponse = await axios.post('http://localhost:8000/api/login', { email, password });
      localStorage.setItem('token', loginResponse.data.token);
      setIsLoggedIn(true);
      if (loginResponse.data.user && loginResponse.data.user.id) {
        localStorage.setItem('userId', loginResponse.data.user.id);
      }
      navigate('/quiz');
    } catch (err) {
      if (err.response && err.response.data && err.response.data.errors) {
        const errors = err.response.data.errors;
        if (errors.name) toast.error(errors.name.join(' '));
        if (errors.email) toast.error(errors.email.join(' '));
        if (errors.password) toast.error(errors.password.join(' '));
      } else {
        toast.error('Registration failed');
      }
    }
  };

  return (
    <div className="form-container">
      <h2>Register</h2>
      <form onSubmit={handleRegister}>
        <input
          type="text"
          value={name}
          onChange={(e) => setName(e.target.value)}
          placeholder="Username"
          required
        />
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Email"
          required
        />
        <input
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Password"
          required
        />
        <button type="submit">Register</button>
      </form>
      <ToastContainer />
    </div>
  );
}

export default Register;
