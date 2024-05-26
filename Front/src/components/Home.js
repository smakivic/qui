// Home.js
import React from 'react';
import { Link } from 'react-router-dom';
import './css/Home.css';

const Home = ({ isLoggedIn }) => { 
  return (
    <div className="home-container">
      <h1>Welcome to Quiz Time!</h1>
      <p>Your one-stop platform for fun and learning.</p>
      <p>Here your general knowledge will be tested. There are two types of questions, true/false and multiple choice, each is worth different points! Good luck!</p>
      {!isLoggedIn && (
        <p>You are currently in guest mode, here you can try the quiz but your results will not be saved.
          To save your results and view your profile, please login or register.
        </p>
      )}
      <Link to="/quiz">
        <button>Start Quiz</button>
      </Link>
    </div>
  );
};

export default Home;
