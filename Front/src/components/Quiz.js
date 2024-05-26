import React from 'react';
import { fetchQuestions } from './questions';
import Quiz from 'react-quiz-component';
import axios from 'axios';
import './css/Quiz.css'; 

class QuizComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      isQuizCompleted: false,
      quizQuestions: {
        quizTitle: "Trivia quiz!",
        quizSynopsis: "Test your knowledge with this quiz!",
        questions: []
      },
    };
  }

  componentDidMount() {
    this.loadQuestions();
  }

  loadQuestions = () => {
    fetchQuestions(5)
      .then(questions => {
        const formattedQuestions = questions
          .filter(question => question !== undefined)
          .map(question => {
            return {
              question: question.question,
              questionType: question.questionType || "text",
              answerSelectionType: question.answerSelectionType || "single",
              answers: question.answers || [],
              correctAnswer: question.correct_answer || "1",
              messageForCorrectAnswer: question.messageForCorrectAnswer || "Correct answer. Good job.",
              messageForIncorrectAnswer: question.messageForIncorrectAnswer || "Incorrect answer. Please try again.",
              explanation: question.explanation || "",
              point: Number.isFinite(question.point) ? question.point : 10
            };
          });

        this.setState({
          isLoading: false,
          isQuizCompleted: false,
          quizQuestions: {
            ...this.state.quizQuestions,
            questions: formattedQuestions
          }
        });
      })
      .catch(error => {
        console.error('Error fetching questions:', error);
      });
  }

  handleQuizCompletion = (result) => {
    const token = localStorage.getItem('token');
    if (!token) {
      console.error('User is not logged in');
      return;
    }
    if (!result || !result.correctPoints || !result.totalPoints) {
      console.error('Invalid quiz result');
      return;
    }

    const attemptData = {
      user_id: parseInt(localStorage.getItem('userId')),
      score: result.correctPoints,
      totalPoints: result.totalPoints,
    };

    axios.post('http://localhost:8000/api/attempt', attemptData, {
      headers: {
        Authorization: `Bearer ${token}`
      }
    })
      .then(response => {
        this.setState({ isQuizCompleted: true });
      })
      .catch(error => {
        console.error('Error saving quiz attempt:', error);
      });
  }

  playAgain = () => {
    this.setState({ isLoading: true, isQuizCompleted: false });
    this.loadQuestions();
  }

  render() {
    if (this.state.isLoading) {
      return <div className="loading-spinner"></div>;
    }

    return (
      <div className="quiz-container">
        <div className="question-container">
          
          <Quiz quiz={this.state.quizQuestions} onComplete={this.handleQuizCompletion} />
          {this.state.isQuizCompleted && (
            <div className="play-again-container">
              <button className="play-again-button" onClick={this.playAgain}
              style={{
                fontSize: '1em', 
                color: '#fff',
                backgroundColor: '#ff7e5f',
                border: 'none',
                padding: '10px 20px',
                borderRadius: '5px',
                cursor: 'pointer',
                transition: 'background-color 0.3s ease',
                marginBottom: '20px'
              }}>Play Again</button>
            </div>
          )}
        </div>
      </div>
    );
  }
}

export default QuizComponent;

