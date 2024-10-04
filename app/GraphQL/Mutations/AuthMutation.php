<?php

namespace App\GraphQL\Mutations;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Carbon\Carbon;

class AuthMutation
{
    public function register($root, array $args)
    {
        $validator = Validator::make($args, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|confirmed|min:8',
        ]);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }

        $user = User::create([
            'name' => $args['name'],
            'email' => $args['email'],
            'password' => Hash::make($args['password']),
            'auth_key' => bin2hex(random_bytes(16)),
        ]);

        return [
            'user' => $user,
            'auth_key' => $user->auth_key,
        ];
    }

    public function login($root, array $args)
    {
        $user = User::where('email', $args['email'])->first();

        if (!$user || !Hash::check($args['password'], $user->password)) {
            throw ValidationException::withMessages(['email' => ['Invalid credentials']]);
        }

        $user->update([
            'auth_key' => bin2hex(random_bytes(16)),
            'token_device' => $args['token_device'],
        ]);

        return [
            'user' => $user,
            'auth_key' => $user->auth_key,
        ];
    }

    public function logout()
    {
        $user = auth()->user();

        if ($user instanceof \App\Models\User) { // Ensures $user is a User instance
            $user->update(['auth_key' => null]);
            return true;
        }

        return false;
    }

    public function refreshToken()
    {
        $user = auth()->user();

        if ($user instanceof \App\Models\User) { // Ensures $user is a User instance
            $user->update(['auth_key' => bin2hex(random_bytes(16))]);

            return [
                'user' => $user,
                'auth_key' => $user->auth_key,
            ];
        }

        return null;
    }

    public function forgotPassword($root, array $args)
    {
        $user = User::where('email', $args['email'])->first();

        if ($user) {
            $user->password_reset_token = bin2hex(random_bytes(16)); // Tạo mã reset ngẫu nhiên
            $user->save();

            // Trả về mã reset token cho mục đích testing
            return [
                'code' => 200,
                'success' => true,
                'message' => 'Password reset link sent.',
                'reset_token' => $user->password_reset_token, // Bao gồm mã reset trong response
            ];
        }

        return [
            'code' => 404,
            'success' => false,
            'message' => 'User not found.',
        ];
    }


    public function resetPassword($root, array $args)
    {
        // Tìm user qua email và mã xác thực
        $user = User::where('email', $args['email'])
            ->where('password_reset_token', $args['code'])
            ->first();

        if ($user) {
            // Nếu tìm thấy user, cập nhật mật khẩu mới
            $user->password_reset_token = null; // Xóa mã xác thực sau khi đặt lại
            $user->save();

            return ['success' => true, 'message' => 'Password has been reset.'];
        }

        return ['success' => false, 'message' => 'Invalid reset code.'];
    }

    public function updatePassword($root, array $args)
    {
        $user = User::where('email', $args['email'])
            ->where('password_reset_token', $args['code'])
            ->first();

        if ($user) {
            $user->password = Hash::make($args['password']);
            $user->password_reset_token = null;
            $user->save();

            return ['success' => true, 'message' => 'Password updated successfully.'];
        }

        return ['success' => false, 'message' => 'Invalid reset code or email.'];
    }
}
