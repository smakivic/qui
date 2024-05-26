<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Question;

class QuestionController extends Controller
{
    public function create(Request $request)
    {
        $validatedData = $request->validate([
            'question' => 'required|string',
            'correct_answer' => 'required|string',
            'options' => 'required|array',
        ]);

        $question = Question::create([
            'question' => $validatedData['question'],
            'correct_answer' => $validatedData['correct_answer'],
            'options' => $validatedData['options'],
        ]);

        return response()->json($question, 201);
    }
}
