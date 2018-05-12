Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createUser, function: Resolvers::CreateUser.new
  field :signinUser, function: Resolvers::SignInUser.new
  field :createLink, function: Resolvers::CreateLink.new
  field :createVote, function: Resolvers::CreateVote.new
end
