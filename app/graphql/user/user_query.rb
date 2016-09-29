UserQuery = GraphQL::Field.define do
  type UserType
  description 'Query account info'
  resolve Auth.authenticate_user! -> (_, _, ctx) do
    ctx[:current_user]
  end
end
