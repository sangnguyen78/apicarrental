<?php

namespace App\GraphQL\Resolvers;

use App\Models\User;
use GraphQL\Type\Definition\ResolveInfo;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;

class UserResolver
{
    public function findUser($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
        return User::find($args['id']);
    }
}
