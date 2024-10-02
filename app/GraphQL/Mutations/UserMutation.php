<?php

namespace App\GraphQL\Mutations;

use App\Models\User;

class UserMutation
{
    public function deleteUser($rootValue, array $args): bool
    {
        $user = User::find($args['id']);

        if ($user) {
            $user->delete();
            return true;
        }

        return false;
    }
}
