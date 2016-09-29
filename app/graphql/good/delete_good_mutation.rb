DeleteGoodMutation = GraphQL::Relay::Mutation.define do
  name 'DeleteGood'
  input_field :id, !types.ID
  return_field :good, GoodType
  resolve Auth.authenticate_user! -> (inputs, ctx) do
    good = NodeIdentification.object_from_id(inputs[:id], ctx)
    ctx[:current_user].goods.find(good.id)
    good.destroy!
    { good: good }
  end
end
