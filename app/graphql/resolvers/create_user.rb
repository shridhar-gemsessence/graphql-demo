class Resolvers::CreateUser < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :email, Types::AuthProviderEmailInput
  end

  # arguments passed as "args"
  argument :name, !types.String
  argument :authProvider, !AuthProviderInput

  # return type from the mutation
  type Types::UserType

  # the mutation method
  def call(_obj, args, _ctx)
    User.create!(
      name: args[:name],
      email: args[:authProvider][:email][:email],
      password: args[:authProvider][:email][:password]
    )
  end
end