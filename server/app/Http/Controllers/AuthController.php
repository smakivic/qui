<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        //$token = $user->createToken('auth_token')->plainTextToken;
        $validatedData = $request->validate([
            'name' => 'required|string|max:255|unique:users',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => [
                'required',
                'string',
                'min:8',
                'regex:/[A-Z]/',  // must contain at least one uppercase letter
                'regex:/[0-9]/'   // must contain at least one number
            ],
        ], [
            'password.regex' => 'Password must contain at least one uppercase letter and one number',
        ]);

        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
            'api_token' => '',
        ]);
    
        // Create a new token for the registered user
        $token = $user->createToken('auth_token')->plainTextToken;
    
        // Add the token to the user array
        $user = $user->toArray();
        $user['api_token'] = $token;

        return response()->json($user, 201);
    }

    
    public function profile(Request $request)
    {
        // Check if a user is logged in
        if (!Auth::check()) {
            return response()->json(['message' => 'No user is logged in'], 401);
        }

        // Retrieve the logged in user
        $user = Auth::user();
        
        // Return the user's data
        return response()->json([
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
        ]);
    }

        
    public function updateProfile(Request $request)
    {
        try {
            // Define custom messages for validation
            $messages = [
                'password.regex' => 'The password must contain at least one uppercase letter and one number.',
            ];

            // Validate the incoming request data with custom messages
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users,email,' . Auth::id(),
                'password' => [
                    'nullable',
                    'string',
                    'min:8',
                    'regex:/[A-Z]/',  // must contain at least one uppercase letter
                    'regex:/[0-9]/'   // must contain at least one number
                ],
            ], $messages);

            // Retrieve the logged-in user
            $user = Auth::user();

            // Update the user's data
            $user->name = $validatedData['name'];
            $user->email = $validatedData['email'];

            // Only update the password if a new one was provided
            if ($request->has('password')) {
                $user->password = Hash::make($validatedData['password']);
            }

            $user->save();

            // Return a success message
            return response()->json(['message' => 'Profile updated successfully']);
        } catch (ValidationException $e) {
            // Return the validation error messages
            return response()->json(['errors' => $e->errors()], 422);
        }
    }




    public function login(Request $request)
    {
        // Validate the request inputs
        $credentials = $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        // Check if the user with the provided email exists
        $user = User::where('email', $credentials['email'])->first();

        if (!$user) {
            // If the email does not exist, return a specific error message
            return response()->json(['message' => 'Email does not exist'], 404);
        }

        // Check if the provided password matches the user's password
        if (!Hash::check($credentials['password'], $user->password)) {
            // If the password is incorrect, return a specific error message
            return response()->json(['message' => 'Incorrect password'], 401);
        }

        // If the credentials are correct, proceed to authenticate the user
        if (Auth::attempt($credentials)) {
            // Retrieve the authenticated user
            $user = Auth::user();

            // Create a new personal access token for the user
            $token = $user->createToken('auth_token')->plainTextToken;

            $user->api_token = $token;

            $user->save();

            // Return the token and user details in the response
            return response()->json([
                'token' => $token,
                'user' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                ],
            ]);
        } else {
            // Fallback error message if something unexpected happens
            return response()->json(['message' => 'Login failed'], 401);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();
        return response()->json(['message' => 'Logged out successfully'], 200);
    }
    public function deleteProfile(Request $request)
    {
        try {
            // Retrieve the logged-in user
            $user = Auth::user();

            // Delete the user
            $user->delete();

            return response()->json(['message' => 'Profile deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to delete profile'], 500);
        }
    }

}
