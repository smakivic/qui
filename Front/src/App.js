import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes, Link, Navigate } from 'react-router-dom';
import Register from './components/Register';
import Login from './components/Login';
import QuizComponent from './components/Quiz';
import Scoreboard from './components/Scoreboard';
import Profile from './components/Profile';
import Home from './components/Home';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import '@coreui/coreui/dist/css/coreui.min.css';
import './components/css/App.css'; 
import {
  CNavbar,
  CContainer,
  CNavbarBrand,
  CNavbarToggler,
  CCollapse,
  CNavbarNav,
  CNavItem,
  CNavLink,
  CForm,
  CFormInput,
  CButton
} from '@coreui/react';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(!!localStorage.getItem('userId'));
  const [visible, setVisible] = useState(false);
  const [dropdownVisible, setDropdownVisible] = useState(false);
  useEffect(() => {
    const userId = localStorage.getItem('userId');
    if (userId) {
      setIsLoggedIn(true);
    } else {
      setIsLoggedIn(false);
    }
  }, []);

  const handleLogin = (userId) => {
    localStorage.setItem('userId', userId);
    setIsLoggedIn(true);
  };

  const handleLogout = () => {
    localStorage.removeItem('userId');
    setIsLoggedIn(false);
  };
  const handleDropdownToggle = () => {
    setDropdownVisible(!dropdownVisible);
  };
  return (
    <Router>
      <div className="app-container">
        <CNavbar expand="lg" className="navbar-custom">
          <CContainer fluid>
            <CNavbarBrand as={Link} to="/" className="navbar-brand-custom">Quiz Time!</CNavbarBrand>
            <CNavbarToggler onClick={() => setVisible(!visible)} className="navbar-toggler-custom" />
            <CCollapse className="navbar-collapse" visible={visible}>
              <CNavbarNav className="ms-auto">
                {!isLoggedIn && (
                  <CNavItem>
                    <CNavLink as={Link} to="/register" className="nav-link-custom">
                      Register
                    </CNavLink>
                  </CNavItem>
                )}
                {!isLoggedIn && (
                  <CNavItem>
                    <CNavLink as={Link} to="/login" className="nav-link-custom">
                      Login
                    </CNavLink>
                  </CNavItem>
                )}
                <CNavItem>
                  <CNavLink as={Link} to="/quiz" className="nav-link-custom">
                    Quiz
                  </CNavLink>
                </CNavItem>
                {isLoggedIn && (
                  <CNavItem>
                    <CNavLink as={Link} to="/scoreboard" className="nav-link-custom">
                      Scoreboard
                    </CNavLink>
                  </CNavItem>
                )}
                {isLoggedIn && (
                  <CNavItem>
                    <CNavLink as={Link} to="/profile" className="nav-link-custom">
                      Profile
                    </CNavLink>
                  </CNavItem>
                )}
                {isLoggedIn && (
                  <CNavItem>
                    <CButton onClick={handleLogout} color="link" className="logout-button">
                      Logout
                    </CButton>
                  </CNavItem>
                )}
              </CNavbarNav>
            </CCollapse>
          </CContainer>
          
        </CNavbar>
        <div className="hr-container">
          <hr className="custom-hr" />
        </div>
        <div className="main-content">
        <Routes>
          <Route path="/register" element={<Register setIsLoggedIn={handleLogin} />} />
          <Route path="/login" element={<Login setIsLoggedIn={handleLogin} />} />
          <Route path="/quiz" element={<QuizComponent />} />
          <Route path="/scoreboard" element={isLoggedIn ? <Scoreboard /> : <Navigate to="/login" />} />
          <Route path="/profile" element={isLoggedIn ? <Profile /> : <Navigate to="/login" />} />
          <Route path="/" element={<Home isLoggedIn={isLoggedIn} />} />
        </Routes>
        </div>
        
        <ToastContainer />
        <footer className="footer">
          <p>Created by Stefan Makivić, for subject Web Technologies
          <br></br>
          Faculty of Computer and Information Science, University of Ljubljana
          <br></br>
          May, 2024
          </p>
        </footer>
      </div>
    </Router>
  );
}

export default App;
