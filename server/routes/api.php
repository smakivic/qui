<?php
use App\Http\Controllers\AuthController;
use App\Http\Controllers\QuizController;
use App\Http\Controllers\QuestionController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use App\Models\Question;
use App\Http\Middleware\Authenticate;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');


Route::get('/questions', function () {
    $count = request()->query('count', 15); // Default to 15 if no count is provided
    $questions = Question::inRandomOrder()->take($count)->get()->map(function($question) {
        return $question;
    });
    return response()->json($questions);
});
// Route::post('/attempt', [QuizController::class, 'submitAttempt'])->middleware('auth:sanctum');
Route::get('/scoreboard', [QuizController::class, 'getScoreboard']);
Route::get('/userScoreboard', [QuizController::class, 'getUserScoreboard']);

Route::middleware('auth:sanctum')->get('/profile', [AuthController::class, 'profile']);
Route::middleware('auth:sanctum')->put('/profile', [AuthController::class, 'updateProfile']);
Route::middleware('auth:sanctum')->delete('/profile', [AuthController::class, 'deleteProfile']);
Route::middleware(Authenticate::class)->post('/attempt', [QuizController::class, 'submitAttempt']);

//Route::post('/questions', [QuestionController::class, 'create']);
