<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\QuizAttempt;
use App\Models\Question;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
class QuizController extends Controller
{
    public function getQuestions()
    {
        $questions = Question::all();
        return response()->json($questions);
    }

    public function submitAttempt(Request $request)
    {
        error_log("Request: " . print_r($request, true));
        $validatedData = $request->validate([
            'user_id' => 'required|integer',
            'score' => 'required|integer',
            'totalPoints' => 'required|integer', // Add validation for total points
        ]);
        error_log("validatedData: " . print_r($validatedData, true));
        $attempt = QuizAttempt::create([
            'score' => $validatedData['score'],
            'totalPoints' => $validatedData['totalPoints'], // Store total points
            'user_id' => $validatedData['user_id'],
        ]);
        error_log("attempt: " . print_r($attempt, true));
        return response()->json($attempt, 201);
    }


    public function getScoreboard()
    {
        $subQuery = QuizAttempt::select('user_id', DB::raw('MAX(score) as max_score'))
                                ->groupBy('user_id');

        $attempts = QuizAttempt::joinSub($subQuery, 'sub', function($join) {
                            $join->on('quiz_attempts.user_id', '=', 'sub.user_id')
                                 ->on('quiz_attempts.score', '=', 'sub.max_score');
                        })
                        ->join('users', 'quiz_attempts.user_id', '=', 'users.id')
                        ->select('quiz_attempts.id', 'quiz_attempts.user_id', 'quiz_attempts.score', 'quiz_attempts.totalPoints', 'users.name as user_name')
                        ->whereIn('quiz_attempts.id', function($query) {
                            $query->select(DB::raw('MIN(id)'))
                                  ->from('quiz_attempts')
                                  ->groupBy('user_id', 'score');
                        })
                        ->orderBy('quiz_attempts.score', 'DESC')
                        ->get();

        return response()->json($attempts);
    }

    public function getUserScoreboard(Request $request)
    {
        //get the id of the currently logged in user
        // Get the user ID from localStorage
        $userId =  $request->input('userId');
        
        // Check if the user ID exists
        if (!$userId) {
            return response()->json(['error' => 'User ID not found in localStorage'], 400);
        }
        // Get the attempts for the current user
        $userAttempts = QuizAttempt::where('user_id', $userId)
            ->orderBy('score', 'desc')
            ->get();

        return response()->json($userAttempts);
    }
}

