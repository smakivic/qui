<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuizAttempt extends Model
{
    use HasFactory;

    protected $fillable = [
        'score', 'user_id', 'totalPoints',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
