class Resolvers::CreateLink < GraphQL::Function
    # arguments passed as "args"
    argument :description, !types.String
    argument :url, !types.String
  
    # return type from the mutation
    type Types::LinkType
  
    # the mutation method
    # _obj - is parent object, which in this case is nil
    # args - are the arguments passed
    # ctx - is the GraphQL context
    def call(_obj, args, ctx)
      Link.create!(
        url: args[:url],
        description: args[:description],
        user: ctx[:current_user]
      )

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', '))
    end
  end
  