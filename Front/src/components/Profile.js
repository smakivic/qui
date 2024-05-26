import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import './css/Profile.css'; 
import './css/Scoreboard.css'; 

function Profile() {
  const [profile, setProfile] = useState({});
  const [userName, setUserName] = useState('');
  const [userEmail, setUserEmail] = useState('');
  const [userPassword, setUserPassword] = useState('');
  const [error, setError] = useState('');
  const [isLoading, setIsLoading] = useState(true);
  const [showScoreboard, setShowScoreboard] = useState(false);
  const [attempts, setAttempts] = useState([]);

  useEffect(() => {
    const fetchProfile = async () => {
      setIsLoading(true);
      try {
        const response = await axios.get('http://localhost:8000/api/profile', {
          headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
        });
        setProfile(response.data);
        setUserName(response.data.name);
        setUserEmail(response.data.email);
      } catch (err) {
        setError('Failed to fetch profile');
      }
      setIsLoading(false);
    };
    fetchProfile();
  }, []);

  const fetchAttempts = async () => {
    setIsLoading(true);
    try {
      const response = await axios.get('http://localhost:8000/api/userScoreboard', {
        headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
        params: {
          userId: localStorage.getItem('userId')
        }
      });
      setAttempts(response.data);
    } catch (err) {
      setError('Failed to fetch attempts');
    }
    setIsLoading(false);
  };

  const handleUpdate = async (e) => {
    e.preventDefault();
    try {
      await axios.put('http://localhost:8000/api/profile', { name: userName, email: userEmail, password: userPassword }, {
        headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
      });
      toast.success('Profile updated successfully');
    } catch (err) {
      if (err.response && err.response.data && err.response.data.errors) {
        const { errors } = err.response.data;
        Object.keys(errors).forEach((key) => {
          errors[key].forEach((error) => {
            toast.error(error);
          });
        });
      } else {
        toast.error('Failed to update profile!');
      }
    }
  };

  const handleDelete = async () => {
    const confirmed = window.confirm('Are you sure you want to delete your profile? This action cannot be undone.');
    if (confirmed) {
      try {
        await axios.delete('http://localhost:8000/api/profile', {
          headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
        });
        localStorage.removeItem('token');
        toast.success('Profile deleted successfully');
        window.location.href = '/login';
      } catch (err) {
        toast.error('Failed to delete profile');
      }
    }
  };

  const handleLogout = async () => {
    try {
      await axios.post('http://localhost:8000/api/logout', {}, {
        headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
      });
      localStorage.removeItem('token');
      localStorage.removeItem('userId');
      toast.success('Logged out successfully');
      window.location.href = '/login';
    } catch (err) {
      toast.error('Failed to logout');
    }
  };

  useEffect(() => {
    if (showScoreboard) {
      fetchAttempts();
    }
  }, [showScoreboard]);

  if (isLoading) {
    return <div className="loading-spinner"></div>;
  }

  return (
    <div>
      {error && <p>{error}</p>}
      {showScoreboard ? (
        <div className="">
          {attempts.length > 0 ? (
            // <ul>
            //   {attempts.map((attempt, index) => (
            //     <li key={index}>{index + 1}: {attempt.score} / {attempt.totalPoints}</li>
            //   ))}
            // </ul>
            <div className="scoreboard-container">
            <h2>Your Quiz Attempts</h2>
           <table className="scoreboard-table">
             <thead>
               <tr>
                 <th> </th>
                 <th>Score</th>
                 <th>Possible Points</th>
                 <th>Date</th>
               </tr>
             </thead>
             <tbody>
             {attempts.map((attempt, index) => {
                // Create a new Date object from the 'created_at' string
                const date = new Date(attempt.created_at);
                // Extract day, month, and year from the date object
                const day = date.getDate();
                const month = date.getMonth() + 1; // January is 0
                const year = date.getFullYear();

                // Pad single-digit day and month with leading zeros
                const formattedDay = day < 10 ? `0${day}` : day;
                const formattedMonth = month < 10 ? `0${month}` : month;

                // Construct the formatted date string
                const formattedDate = `${formattedDay}.${formattedMonth}.${year}`;

                return (
                  <tr key={attempt.id}>
                    <td>{index + 1}.</td>
                    <td>{attempt.score}</td>
                    <td>{attempt.totalPoints}</td>
                    <td>{formattedDate}</td> {/* Display formatted date */}
                  </tr>
                );
              })}
             </tbody>
           </table>
           <div className="button-group">
            <button onClick={() => setShowScoreboard(false)}>Back</button>
          </div>
         </div>
          ) : (
            <p className="no-attempts">No attempts found</p>
          )}
          
        </div>
      ) : (
        <div className="form-container profile-form">
          <h2>Profile</h2>
          <button className="form-button" onClick={() => setShowScoreboard(true)}>Show Scoreboard</button>
          <form onSubmit={handleUpdate}>
            <div className="input-group">
              <input type="text" value={userName} onChange={(e) => setUserName(e.target.value)} placeholder="Name" required style={{borderRadius: '10px'}}/>
              <input type="email" className="updateProfileInput" value={userEmail} onChange={(e) => setUserEmail(e.target.value)} placeholder="Email" required style={{borderRadius: '10px'}}/>
              <input type="password" className="updateProfileInput" value={userPassword} onChange={(e) => setUserPassword(e.target.value)} placeholder="Password" style={{borderRadius: '10px'}}/>
            </div>
            <div className="button-group">
              <button type="submit">Update</button>
              <button onClick={handleDelete}>Delete Profile</button>
            </div>
          </form>
        </div>
      )}
      <ToastContainer
        position="top-right"
        autoClose={5000}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
      />
    </div>
  );
}

export default Profile;
