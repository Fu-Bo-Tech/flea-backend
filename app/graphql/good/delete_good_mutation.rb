DeleteGoodMutation = GraphQL::Relay::Mutation.define do
  name 'DeleteGood'
  input_field :id, !types.ID

  return_field :good, GoodType
  resolve -> (inputs, ctx) {
    good = NodeIdentification.object_from_id(inputs[:id], ctx)
    good.destroy! 

    { good: good }
  }
end
