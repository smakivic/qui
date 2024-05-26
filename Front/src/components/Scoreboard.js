import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './css/Scoreboard.css'; // Import the CSS file for Scoreboard

function Scoreboard() {
  const [scores, setScores] = useState([]);
  const [error, setError] = useState('');
  const [isLoading, setIsLoading] = useState(true); // Add loading state

  useEffect(() => {
    const fetchScores = async () => {
      try {
        const response = await axios.get('http://localhost:8000/api/scoreboard');
        setScores(response.data);
      } catch (err) {
        setError('Failed to fetch scores');
      }
      setIsLoading(false); // Set loading state to false after data is fetched or error occurred
    };
    fetchScores();
  }, []);

  if (isLoading) {
    return <div className="loading-spinner"></div>; // Render loading spinner while data is being fetched
  }

  return (
    <div className="container ">
      
      {error && <p>{error}</p>}
      {scores.length > 0 ? (
         <div className="scoreboard-container">
          <h2>Scoreboard</h2>
         <table className="scoreboard-table">
           <thead>
             <tr>
               <th> </th>
               <th>Username</th>
               <th>Score</th>
               <th>Possible Points</th>
             </tr>
           </thead>
           <tbody>
             {scores.map((score, index) => (
               <tr key={score.id}>
                 <td>{index + 1}.</td>
                 <td>{score.user_name}</td>
                 <td>{score.score}</td>
                 <td>{score.totalPoints}</td>
               </tr>
             ))}
           </tbody>
         </table>
       </div>
      
      
      ) : (
        <p className="no-attempts">There are no quiz attempts yet.</p>
      )}
    </div>
  );
}

export default Scoreboard;
