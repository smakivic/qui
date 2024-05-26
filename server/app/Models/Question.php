<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;
    protected $fillable = [
        'question', 'questionType', 'answerSelectionType', 'options', 'correctAnswer', 
        'messageForCorrectAnswer', 'messageForIncorrectAnswer', 'point',
    ];
    protected $table = 'questions';
    protected $casts = [
        'answers' => 'array',
    ];
}
