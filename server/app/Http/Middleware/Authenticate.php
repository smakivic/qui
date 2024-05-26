<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\User;

class Authenticate
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user_id = $request->input('user_id');
        $user = User::where('id', $user_id)->first();
        // check if sent Bearer token matches the user's token in the database
        if ($user && $request->bearerToken() === $user->api_token) {
            return $next($request);
        }
        return response()->json(['message' => 'Unauthorized'], 401);
    }
}
